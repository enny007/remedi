-- Remedi · Supabase schema (mirror of the local Drift tables in lib/data/db/tables.dart)
--
-- Every table uses the same shape as the device database:
--   id uuid primary key (generated on the phone), created_at, updated_at,
--   deleted_at (soft delete), plus user_id owned by auth.uid().
-- The app writes every local change to its `sync_outbox` table; a sync worker
-- pushes those rows here (upsert by id, last-writer-wins on updated_at) and
-- pulls rows changed since the last sync.

create extension if not exists "pgcrypto";

create or replace function public.touch_updated_at() returns trigger
language plpgsql as $$
begin
  new.updated_at = greatest(coalesce(new.updated_at, now()), coalesce(old.updated_at, 'epoch'::timestamptz));
  return new;
end $$;

create table if not exists public.profiles (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  full_name text not null,
  title text,
  date_of_birth date,
  sex text,
  blood_group text,
  genotype text,
  allergies text,
  avatar_path text,             -- device path; upload to Storage and store the object key when syncing
  caregiver_name text,
  caregiver_relation text,
  caregiver_phone text,
  caregiver_alerts_enabled boolean not null default true,
  caregiver_delay_minutes int not null default 20,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.conditions (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  name text not null,
  diagnosed_at timestamptz,
  doctor_name text,
  facility text,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.medications (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  name text not null,
  strength text not null,
  form text not null check (form in ('tablet','capsule','caplet','softgel','liquid','drops','injection','inhaler','cream','sachet')),
  drug_class text,
  route text not null default 'oral',
  dose_amount numeric not null default 1,
  frequency text not null check (frequency in ('once','twice','thrice','prn')),
  meal_relation text not null check (meal_relation in ('withMeal','beforeFood','afterFood','emptyStomach','waterOnly','any')),
  instructions text,
  pill_description text,
  condition_id uuid references public.conditions (id),
  prescriber_name text,
  prescriber_specialty text,
  facility text,
  prescriber_phone text,
  rx_number text,
  prescription_image_path text,
  stock_count numeric,
  refill_threshold numeric not null default 5,
  side_effect_watch jsonb not null default '[]',
  start_date timestamptz not null default now(),
  end_date timestamptz,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.dose_schedules (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  medication_id uuid not null references public.medications (id),
  hour smallint not null check (hour between 0 and 23),
  minute smallint not null check (minute between 0 and 59),
  dose_amount numeric not null default 1,
  slot text not null default 'custom',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.dose_logs (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  medication_id uuid not null references public.medications (id),
  schedule_id uuid references public.dose_schedules (id),
  scheduled_at timestamptz not null,
  action_at timestamptz not null,
  status text not null check (status in ('taken','skipped','missed')),
  skip_reason text check (skip_reason in ('stomachUpset','outOfStock','doctorHold','other')),
  dose_amount numeric not null default 1,
  note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.snoozes (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  schedule_id uuid not null references public.dose_schedules (id),
  scheduled_at timestamptz not null,
  count int not null default 0,
  snoozed_until timestamptz not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.vitals (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  type text not null check (type in ('bloodPressure','bloodGlucose','heartRate','steps','weight')),
  value numeric not null,
  value2 numeric,
  unit text not null,
  recorded_at timestamptz not null,
  source text not null check (source in ('manual','healthKit','healthConnect')),
  note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table if not exists public.symptom_logs (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  medication_id uuid references public.medications (id),
  symptom text not null,
  severity smallint not null default 1,
  recorded_at timestamptz not null,
  note text,
  resolved boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

-- Row level security: each user sees only their own rows.
do $$
declare t text;
begin
  foreach t in array array['profiles','conditions','medications','dose_schedules','dose_logs','snoozes','vitals','symptom_logs']
  loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists "own rows" on public.%I', t);
    execute format('create policy "own rows" on public.%I for all using (user_id = auth.uid()) with check (user_id = auth.uid())', t);
    execute format('create index if not exists %I on public.%I (user_id, updated_at)', t || '_user_updated_idx', t);
    execute format('drop trigger if exists touch_updated_at on public.%I', t);
    execute format('create trigger touch_updated_at before update on public.%I for each row execute function public.touch_updated_at()', t);
  end loop;
end $$;
