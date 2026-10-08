# Remedi

Offline-first, multilingual medication reminder for Nigerian patients and caregivers.
Built in Flutter from the Stitch project **"Offline Multilingual Pill Reminder"** and its
design system *Clinical Clarity & Compassionate Care*.

Languages: English, Yorùbá, Nigerian Pidgin, Igbo, Hausa.

## Run

```bash
flutter pub get
dart run build_runner build --force-jit   # Drift code generation (needed after editing tables)
flutter gen-l10n                          # runs automatically on build; needed after editing .arb files
flutter run
```

`--force-jit` is required because a transitive dependency uses Dart build hooks,
which the default AOT build-script compile does not support on Flutter 3.38.

Tests: `flutter test`

## Features

| Tab / screen | What it does |
|---|---|
| **Schedule** | Today's doses: up-next hero card, later today, completed/missed accordion, doctor's instructions, as-needed quick log, emergency SOS to caregiver. |
| **Alarm** (from notification) | Full-screen dose prompt with swallow confirmation, snooze (max 3), clinical skip reasons, caregiver fail-safe. |
| **Fast Log** | Add a medicine by camera/gallery scan (on-device ML Kit OCR), voice, catalog search or quick-pick chips. |
| Routine setup → Clinical details | Frequency, food rule, reminder times and per-dose amount; then condition, doctor, instructions, prescription photo, stock & refill threshold, side-effect watchlist. |
| **My Meds** | Cabinet with time-of-day filters, supply status, quick sheet, refill request by SMS/share. |
| Medication detail | Supply tracking and stock updates, routine, interactions against your other medicines, diet/missed-dose guidance, prescriber call, stop medicine. |
| **Health** | 30-day adherence, streak, weekly routine, language, vitals logger, conditions & regimens, symptom log. |
| Vitals | Apple Health / Health Connect sync (heart rate, steps, BP, glucose) with dose correlation. |
| Doctor visit summary | Offline QR snapshot + PDF (print/save/share via Bluetooth, AirDrop, WhatsApp). |

Reminders are real OS alarms (`flutter_local_notifications`): one repeating daily alarm per
reminder time (survives reboot, rings even if the app is never opened), loud/insistent on
Android with Take/Snooze actions, snooze alarms, caregiver fail-safe prompts and refill warnings.

## Architecture

```
lib/
  app/            router (go_router), bottom-nav shell, localization fallbacks
  core/           theme tokens (colors, type, spacing), enum labels, time utils
  data/
    db/           Drift schema + database (SQLite)
    catalog/      offline drug reference: forms, food rules, side effects, interactions
    models/       enums, DoseOccurrence (computed dose instances), MedicationDraft
    repositories/ medication, dose (logging, snooze, adherence), health (profile, vitals, symptoms), sync
    seed.dart     optional sample regimen with 30 days of history
  services/       notifications/alarms, HealthKit/Health Connect, OCR + voice, PDF/QR export, settings
  providers/      Riverpod providers, DoseActions, AlarmSync
  features/       one folder per screen group
  l10n/           ARB files (app_en.arb is the template)
tool/             arb_add.py (add English strings), arb_check.py (validate translations)
supabase/         schema.sql mirroring the local tables, with RLS
```

- **State:** Riverpod 3 (no codegen). Database streams → `StreamProvider`s; actions go through
  `DoseActions`, which also keeps OS alarms in sync via `AlarmSync`.
- **Doses are computed, not pre-generated.** A `DoseOccurrence` is derived from reminder times
  (`dose_schedules`) and outcomes (`dose_logs`). Editing times soft-deletes old schedules so
  history stays accurate.

## Supabase (next step)

The local database is already sync-ready:

- UUID primary keys generated on the device, `created_at` / `updated_at` / `deleted_at` on every row.
- Every write also appends to the local `sync_outbox` table (see `AppDatabase.enqueue`).
  `SyncRepository.pendingBatch()` / `markPushed()` are the hooks for a sync worker.
- `supabase/schema.sql` creates the matching tables with row-level security keyed on `auth.uid()`.

To connect: add `supabase_flutter`, sign the user in, then write a `SyncService` that drains
`sync_outbox` (upsert rows by id, adding `user_id`), pulls rows where `updated_at > lastPulledAt`,
and applies them locally. Wire it to the "Sync Now" button on the Health tab
(`_VaultBanner` in `features/health/health_screen.dart`).

## Before release

- Change the application id / bundle id from `com.example.remedi`.
- iOS: enable the **HealthKit** capability for the Runner target in Xcode (entitlements file is already added).
- Android: Health Connect requires a privacy policy declaration in Play Console; exact alarms need the
  "Alarms & reminders" permission, which the app requests.
- Have native speakers review the Yorùbá, Pidgin, Igbo and Hausa translations, and a pharmacist review
  `lib/data/catalog/drug_catalog.dart` (clinical guidance text is currently English-only).
