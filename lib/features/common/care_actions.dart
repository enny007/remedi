import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/db/app_database.dart';
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';

/// Opens the SMS composer. Works over the cellular network with no data.
Future<bool> openSms(String phone, String body) async {
  final uri = Uri(scheme: 'sms', path: phone, queryParameters: {'body': body});
  // Some SMS apps mis-handle '+' encoding in queryParameters; build manually.
  final manual = Uri.parse('sms:${Uri.encodeComponent(phone)}?body=${Uri.encodeComponent(body)}');
  if (await launchUrl(manual)) return true;
  return launchUrl(uri);
}

Future<bool> openDialer(String phone) => launchUrl(Uri(scheme: 'tel', path: phone));

/// Emergency sheet: call or text the caregiver with a prefilled alert.
Future<void> showSosSheet(BuildContext context, WidgetRef ref, {DoseOccurrence? occurrence}) async {
  final profile = await ref.read(healthRepoProvider).getProfile();
  if (!context.mounted) return;
  final l = context.l10n;
  final phone = profile?.caregiverPhone?.trim() ?? '';
  final name = profile?.caregiverName?.trim().isNotEmpty ?? false ? profile!.caregiverName!.trim() : phone;
  final patient = profile?.fullName ?? '';
  final msg = occurrence == null
      ? l.sosMessage(patient)
      : l.sosDoseMessage(patient, occurrence.medication.displayName, formatTime(context, occurrence.scheduledAt));

  await showModalBottomSheet<void>(
    context: context,
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const IconTile(icon: Symbols.contact_emergency, background: AppColors.errorContainer, foreground: AppColors.error, circle: true),
                const SizedBox(width: Space.sm),
                Expanded(child: Text(l.sosTitle, style: AppText.headlineMd)),
              ],
            ),
            const SizedBox(height: Space.sm),
            if (phone.isEmpty) ...[
              Text(l.sosNoCaregiver, style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
              const SizedBox(height: Space.md),
              AppButton(
                label: l.addCaregiver,
                icon: Symbols.person_add,
                onPressed: () {
                  Navigator.pop(ctx);
                  context.push('/profile');
                },
              ),
            ] else ...[
              Text(l.sosBody(name), style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
              const SizedBox(height: Space.md),
              SurfaceCard(
                color: AppColors.surfaceContainerLow,
                shadow: false,
                padding: const EdgeInsets.all(12),
                child: Text('“$msg”', style: AppText.bodySm),
              ),
              const SizedBox(height: Space.md),
              AppButton(
                label: l.sosSendSms(name),
                icon: Symbols.sms,
                tone: ButtonTone.tertiary,
                onPressed: () async {
                  Navigator.pop(ctx);
                  await openSms(phone, msg);
                },
              ),
              const SizedBox(height: Space.sm),
              AppButton(
                label: l.sosCall(name),
                icon: Symbols.call,
                tone: ButtonTone.tonal,
                onPressed: () async {
                  Navigator.pop(ctx);
                  await openDialer(phone);
                },
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

/// Clinical skip reasons, recorded in the audit log.
Future<bool> showSkipSheet(BuildContext context, WidgetRef ref, DoseOccurrence o) async {
  final result = await showModalBottomSheet<SkipReason>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _SkipSheet(occurrence: o),
  );
  if (result == null) return false;
  await ref.read(doseActionsProvider).skip(o, result);
  if (result == SkipReason.stomachUpset) {
    await ref.read(healthRepoProvider).logSymptom(symptom: 'nausea', medicationId: o.medication.id);
  }
  if (context.mounted) showToast(context, context.l10n.skipRecorded, icon: Symbols.verified);
  return true;
}

class _SkipSheet extends StatefulWidget {
  const _SkipSheet({required this.occurrence});
  final DoseOccurrence occurrence;

  @override
  State<_SkipSheet> createState() => _SkipSheetState();
}

class _SkipSheetState extends State<_SkipSheet> {
  SkipReason? _reason;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final doctor = widget.occurrence.medication.prescriberName;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Symbols.warning, color: AppColors.tertiary, size: 22),
                const SizedBox(width: Space.sm),
                Expanded(child: Text(l.skipTitle, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700))),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              doctor == null ? l.skipAuditNote : l.skipAuditNoteDoctor(doctor),
              style: AppText.bodySm.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: Space.md),
            RadioGroup<SkipReason>(
              groupValue: _reason,
              onChanged: (v) => setState(() => _reason = v),
              child: Column(
                children: [
                  for (final r in SkipReason.values) ...[
                    Material(
                      color: _reason == r ? AppColors.surfaceContainer : AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(Radii.md),
                      child: RadioListTile<SkipReason>(
                        value: r,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.md)),
                        title: Text(l.skipReason(r), style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: Space.sm),
                  ],
                ],
              ),
            ),
            const SizedBox(height: Space.sm),
            AppButton(
              label: l.confirmSkip,
              icon: Symbols.verified,
              tone: ButtonTone.tertiary,
              height: 48,
              onPressed: _reason == null ? null : () => Navigator.pop(context, _reason),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick sheet to log a symptom against a medicine.
Future<void> showSymptomSheet(BuildContext context, WidgetRef ref, {Medication? medication}) async {
  final l = context.l10n;
  final picked = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.logSymptomTitle, style: AppText.headlineMd),
            const SizedBox(height: 4),
            Text(l.logSymptomHint, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: Space.md),
            Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                for (final key in const [
                  'nausea', 'dizziness', 'headache', 'fatigue', 'stomachPain', 'diarrhea',
                  'dryCough', 'swelling', 'musclePain', 'lowSugar', 'rash',
                ])
                  ActionChip(
                    label: Text(l.symptom(key)),
                    labelStyle: AppText.labelMd,
                    backgroundColor: AppColors.surfaceContainerLow,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    onPressed: () => Navigator.pop(ctx, key),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  if (picked == null) return;
  await ref.read(healthRepoProvider).logSymptom(symptom: picked, medicationId: medication?.id);
  if (context.mounted) showToast(context, l.symptomLogged(l.symptom(picked)));
}
