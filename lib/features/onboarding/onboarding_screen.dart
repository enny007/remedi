import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/db/app_database.dart';
import '../../data/seed.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';
import '../health/vitals_screen.dart';

/// Three-step onboarding from the Stitch designs:
/// 1. Meet Remi · 2. Instant Smart Intake · 3. Offline Security & Complete.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _page = PageController();
  final _name = TextEditingController();
  final _cgName = TextEditingController();
  final _cgRelation = TextEditingController();
  final _cgPhone = TextEditingController();
  int _step = 0;
  bool _busy = false;
  bool _alarms = true;
  bool _health = false;
  bool _caregiver = false;

  @override
  void dispose() {
    _page.dispose();
    for (final c in [_name, _cgName, _cgRelation, _cgPhone]) {
      c.dispose();
    }
    super.dispose();
  }

  void _go(int step) {
    FocusScope.of(context).unfocus();
    setState(() => _step = step);
    _page.animateToPage(step, duration: const Duration(milliseconds: 350), curve: Curves.easeOutCubic);
  }

  void _back() => _step == 0 ? context.go('/splash') : _go(_step - 1);

  String? _t(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();

  Future<void> _toggleHealth(bool on) async {
    setState(() => _health = on);
    if (!on) return;
    final err = await ref.read(healthSyncProvider.notifier).sync();
    if (!mounted) return;
    if (err != null) {
      setState(() => _health = false);
      showToast(context, context.l10n.healthDenied, icon: Symbols.lock);
    }
  }

  Future<void> _finish({bool sample = false}) async {
    setState(() => _busy = true);
    if (sample) {
      await seedSampleData(ref.read(databaseProvider), patientName: _t(_name));
    } else {
      await ref.read(healthRepoProvider).saveProfile(ProfilesCompanion(
        fullName: Value(_t(_name) ?? ''),
        caregiverName: Value(_caregiver ? _t(_cgName) : null),
        caregiverRelation: Value(_caregiver ? _t(_cgRelation) : null),
        caregiverPhone: Value(_caregiver ? _t(_cgPhone) : null),
        caregiverAlertsEnabled: Value(_caregiver),
      ));
    }
    if (_alarms || sample) await ref.read(notificationServiceProvider).requestPermissions();
    await ref.read(settingsProvider).setOnboarded(true);
    await ref.read(alarmSyncProvider).resync();
    if (!mounted) return;
    // Sample users land on their populated schedule; new users go straight on
    // to add their first medicine.
    context.go(sample ? '/schedule' : '/log');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final stepLabels = [l.obStep1Label, l.obStep2Label, l.obStep3Label];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, Space.sm, 0),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                        onPressed: _busy ? null : _back,
                        icon: const Icon(Symbols.arrow_back),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _busy ? null : () => _step < 2 ? _go(2) : _finish(),
                        child: Text(l.skip, style: AppText.labelLg.copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Space.margin),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              stepLabels[_step].toUpperCase(),
                              style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Pill(label: l.offlineActive, dot: AppColors.primary, background: AppColors.primaryFixed.withValues(alpha: 0.35)),
                        ],
                      ),
                      const SizedBox(height: Space.sm),
                      Row(
                        children: [
                          for (var i = 0; i < 3; i++) ...[
                            Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: 6,
                                decoration: BoxDecoration(
                                  color: i <= _step ? AppColors.primary : AppColors.surfaceContainer,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            if (i < 2) const SizedBox(width: Space.xs),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _page,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _MeetRemiStep(busy: _busy, onNext: () => _go(1), onSample: () => _finish(sample: true)),
                      _SmartIntakeStep(onNext: () => _go(2)),
                      _SecurityStep(
                        busy: _busy,
                        name: _name,
                        cgName: _cgName,
                        cgRelation: _cgRelation,
                        cgPhone: _cgPhone,
                        alarms: _alarms,
                        health: _health,
                        caregiver: _caregiver,
                        onAlarms: (v) => setState(() => _alarms = v),
                        onHealth: _toggleHealth,
                        onCaregiver: (v) => setState(() => _caregiver = v),
                        onFinish: _finish,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Step 1 · Meet Remi ──────────────────────────────────────────────────────

class _MeetRemiStep extends StatelessWidget {
  const _MeetRemiStep({required this.busy, required this.onNext, required this.onSample});
  final bool busy;
  final VoidCallback onNext;
  final VoidCallback onSample;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.margin, Space.md, Space.margin, Space.lg),
      children: [
        _SpeechBubble(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: l.remiIntroBefore),
                TextSpan(text: l.remiName, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800)),
                TextSpan(text: l.remiIntroAfter),
              ],
            ),
            textAlign: TextAlign.center,
            style: AppText.bodyMd.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        Align(
          alignment: const Alignment(0.35, 0),
          child: Pill(label: l.alwaysReady, icon: Symbols.bolt, background: AppColors.tertiaryFixed, foreground: AppColors.tertiary),
        ),
        Center(child: Remi(size: 200, semanticLabel: l.remiName)),
        const SizedBox(height: Space.sm),
        Text(l.obStep1Title, textAlign: TextAlign.center, style: AppText.displayLgMobile),
        const SizedBox(height: Space.sm),
        Text(l.obStep1Body, textAlign: TextAlign.center, style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: Space.lg),
        SurfaceCard(
          radius: Radii.xl,
          accent: AppColors.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconTile(icon: Symbols.bakery_dining, size: 52, iconSize: 26, radius: Radii.lg, background: AppColors.primaryFixed),
                  const SizedBox(width: Space.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.morningRoutine, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Pill(label: l.withBreakfast, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
                        const SizedBox(height: 4),
                        Text('Metformin • 500mg', style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(Symbols.check_circle, fill: 1, color: AppColors.primary, size: 28),
                      Text(l.remiVerified, style: AppText.labelSm.copyWith(color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: Space.sm),
              Row(
                children: [
                  Expanded(child: _MiniChip(icon: Symbols.offline_bolt, label: l.offlineReliable, color: AppColors.surfaceContainer)),
                  const SizedBox(width: Space.sm),
                  Expanded(child: _MiniChip(icon: Symbols.schedule, label: l.flexibleTime('8:00 AM'), color: AppColors.surfaceContainerLow)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.lg),
        AppButton(label: l.continueSmartIntake, trailingIcon: Symbols.arrow_forward, onPressed: busy ? null : onNext),
        const SizedBox(height: Space.xs),
        AppButton(label: l.exploreSample, tone: ButtonTone.ghost, height: 48, busy: busy, onPressed: onSample),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(Radii.xl),
            boxShadow: AppColors.raisedShadow,
          ),
          child: child,
        ),
        CustomPaint(size: const Size(20, 10), painter: _TailPainter()),
      ],
    );
  }
}

class _TailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = AppColors.surfaceContainerLowest);
  }

  @override
  bool shouldRepaint(_TailPainter old) => false;
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.onSurfaceVariant),
          const SizedBox(width: 6),
          Expanded(child: Text(label, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
        ],
      ),
    );
  }
}

// ── Step 2 · Instant Smart Intake ───────────────────────────────────────────

class _SmartIntakeStep extends StatelessWidget {
  const _SmartIntakeStep({required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.margin, Space.md, Space.margin, Space.lg),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Pill(label: l.smartScanVoice, icon: Symbols.document_scanner, background: AppColors.primaryFixed.withValues(alpha: 0.5)),
        ),
        const SizedBox(height: Space.sm),
        Text(l.obStep2Title, style: AppText.displayLgMobile),
        const SizedBox(height: Space.xs),
        Text(l.obStep2Body, style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: Space.lg),
        _FeatureCard(
          accent: AppColors.primary,
          icon: Symbols.photo_camera,
          title: l.snapScriptTitle,
          subtitle: l.snapScriptSubtitle,
          badge: l.onDeviceOcr,
          child: Container(
            padding: const EdgeInsets.all(Space.md),
            decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.lg)),
            child: SurfaceCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Metformin', style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700)),
                            Text(l.scanDemoSubtitle, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                      Pill(label: l.recognised, icon: Symbols.verified, background: AppColors.surfaceContainerHigh),
                    ],
                  ),
                  const Divider(height: 20, thickness: 2, color: AppColors.primaryFixed),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Pill(label: l.freqTwice, background: AppColors.surfaceContainerLow, foreground: AppColors.onSurfaceVariant),
                      Pill(label: l.mealWith, background: AppColors.surfaceContainerLow, foreground: AppColors.onSurfaceVariant),
                      Pill(label: l.autoFill, icon: Symbols.check, background: Colors.transparent, foreground: AppColors.primary),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        _FeatureCard(
          accent: AppColors.tertiaryContainer,
          icon: Symbols.mic,
          iconColor: AppColors.tertiary,
          title: l.voiceDictation,
          subtitle: l.voiceDictationLangs,
          badge: languageShortCode('yo'),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.lg)),
            child: Row(
              children: [
                const IconTile(icon: Symbols.graphic_eq, size: 44, circle: true, background: AppColors.primaryContainer, foreground: AppColors.onPrimary),
                const SizedBox(width: Space.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.voiceDemoQuote, style: AppText.bodySm.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(l.understoodInstantly, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        _FeatureCard(
          accent: AppColors.primaryFixedDim,
          icon: Symbols.touch_app,
          title: l.quickPresets,
          subtitle: l.quickPresetsHint,
          child: Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              for (final (name, selected) in const [('Amoxicillin 500mg', false), ('Paracetamol 1g', true), ('Amlodipine 5mg', false)])
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(selected ? Symbols.check_circle : Symbols.add_circle, size: 16, fill: selected ? 1 : 0, color: selected ? AppColors.onPrimary : AppColors.onSurfaceVariant),
                      const SizedBox(width: 6),
                      Text(name, style: AppText.labelMd.copyWith(color: selected ? AppColors.onPrimary : AppColors.onSurface)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: Space.md),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SurfaceCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Symbols.search, size: 14, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text(l.remisAdvice.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(l.remisAdviceBody, style: AppText.bodySm.copyWith(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const Remi(size: 88, pose: RemiPose.idle, showHalo: false),
          ],
        ),
        const SizedBox(height: Space.lg),
        AppButton(label: l.nextPeaceOfMind, trailingIcon: Symbols.arrow_forward, onPressed: onNext),
        const SizedBox(height: Space.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Symbols.lock, size: 14, color: AppColors.onSurfaceVariant),
            const SizedBox(width: 4),
            Flexible(child: Text(l.noPhotosLeave, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.accent,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.child,
    this.badge,
    this.iconColor = AppColors.primary,
  });

  final Color accent;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? badge;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      radius: Radii.xl,
      accent: accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTile(icon: icon, foreground: iconColor, background: AppColors.surfaceContainer),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppText.headlineSm),
                    Text(subtitle, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              if (badge != null) Pill(label: badge!, icon: Symbols.translate, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: Space.md),
          child,
        ],
      ),
    );
  }
}

// ── Step 3 · Offline Security & Complete ────────────────────────────────────

class _SecurityStep extends StatelessWidget {
  const _SecurityStep({
    required this.busy,
    required this.name,
    required this.cgName,
    required this.cgRelation,
    required this.cgPhone,
    required this.alarms,
    required this.health,
    required this.caregiver,
    required this.onAlarms,
    required this.onHealth,
    required this.onCaregiver,
    required this.onFinish,
  });

  final bool busy;
  final TextEditingController name;
  final TextEditingController cgName;
  final TextEditingController cgRelation;
  final TextEditingController cgPhone;
  final bool alarms;
  final bool health;
  final bool caregiver;
  final ValueChanged<bool> onAlarms;
  final ValueChanged<bool> onHealth;
  final ValueChanged<bool> onCaregiver;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final healthName = Platform.isIOS ? 'Apple Health' : 'Health Connect';
    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.margin, Space.md, Space.margin, Space.lg),
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(color: AppColors.surfaceContainerHigh.withValues(alpha: 0.6), shape: BoxShape.circle),
                child: const Remi(size: 180, pose: RemiPose.idle),
              ),
              const Positioned(
                right: 4,
                bottom: 8,
                child: IconTile(icon: Symbols.verified_user, size: 44, iconSize: 24, circle: true, fill: 1, background: AppColors.primary, foreground: AppColors.onPrimary),
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.sm),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(Radii.lg), boxShadow: AppColors.cardShadow),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Symbols.lock, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Flexible(child: Text(l.healthStaysHere, style: AppText.labelMd.copyWith(color: AppColors.primary))),
                  ],
                ),
                Text(l.zeroCloudTrackers, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        Text(l.obStep3Title, textAlign: TextAlign.center, style: AppText.headlineLg),
        const SizedBox(height: Space.xs),
        Text(l.obStep3Body, textAlign: TextAlign.center, style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: Space.lg),
        SurfaceCard(
          child: TextField(
            controller: name,
            textCapitalization: TextCapitalization.words,
            style: AppText.bodyLg,
            decoration: InputDecoration(labelText: l.whatShouldRemiCallYou, prefixIcon: const Icon(Symbols.person)),
          ),
        ),
        const SizedBox(height: Space.sm),
        _ToggleCard(
          icon: Symbols.alarm_on,
          title: l.criticalAlarms,
          badge: l.essential,
          badgeColor: AppColors.primaryFixed,
          body: l.criticalAlarmsBody,
          value: alarms,
          onChanged: onAlarms,
        ),
        const SizedBox(height: Space.sm),
        _ToggleCard(
          icon: Symbols.favorite,
          iconColor: AppColors.tertiary,
          title: l.healthSyncTitle(healthName),
          badge: l.onDevice,
          body: l.healthSyncBody,
          value: health,
          onChanged: onHealth,
        ),
        const SizedBox(height: Space.sm),
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () => onCaregiver(!caregiver),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IconTile(icon: Symbols.contact_emergency, background: AppColors.surfaceContainer),
                    const SizedBox(width: Space.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(l.caregiverSmsAlert, style: AppText.headlineSm),
                              Pill(label: l.optional, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
                            ],
                          ),
                          Text(l.caregiverSmsAlertBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: caregiver ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(Symbols.expand_more, color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 220),
                crossFadeState: caregiver ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: const SizedBox(width: double.infinity),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: Space.md),
                  child: Column(
                    children: [
                      TextField(controller: cgName, textCapitalization: TextCapitalization.words, decoration: InputDecoration(labelText: l.caregiverName)),
                      const SizedBox(height: Space.sm),
                      TextField(
                        controller: cgRelation,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(labelText: l.caregiverRelation, hintText: l.caregiverRelationHint),
                      ),
                      const SizedBox(height: Space.sm),
                      TextField(
                        controller: cgPhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: l.caregiverPhone, prefixIcon: const Icon(Symbols.call)),
                      ),
                      const SizedBox(height: Space.xs),
                      Row(
                        children: [
                          const Icon(Symbols.shield, size: 14, color: AppColors.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Expanded(child: Text(l.caregiverSmsNote, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.sm),
        SurfaceCard(
          color: AppColors.surfaceContainerLow,
          shadow: false,
          child: Row(
            children: [
              const IconTile(icon: Symbols.qr_code_2, background: AppColors.surfaceContainerLowest),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.clinicQrMode, style: AppText.labelLg),
                    Text(l.clinicQrModeBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              Pill(label: l.enabled, background: AppColors.surfaceContainerLowest),
            ],
          ),
        ),
        const SizedBox(height: Space.lg),
        AppButton(
          label: l.enterRemedi,
          trailingIcon: Symbols.arrow_forward,
          textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
          busy: busy,
          onPressed: onFinish,
        ),
        const SizedBox(height: Space.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Symbols.lock, size: 14, color: AppColors.onSurfaceVariant),
            const SizedBox(width: 4),
            Flexible(child: Text(l.storedPrivately, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
          ],
        ),
        const SizedBox(height: Space.md),
        Text(l.medicalDisclaimer, textAlign: TextAlign.center, style: AppText.labelSm.copyWith(color: AppColors.outline, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _ToggleCard extends StatelessWidget {
  const _ToggleCard({
    required this.icon,
    required this.title,
    required this.badge,
    required this.body,
    required this.value,
    required this.onChanged,
    this.iconColor = AppColors.primary,
    this.badgeColor = AppColors.surfaceContainer,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String badge;
  final Color badgeColor;
  final String body;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      onTap: () {
        HapticFeedback.selectionClick();
        onChanged(!value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTile(icon: icon, foreground: iconColor, background: AppColors.surfaceContainer, fill: 1),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(title, style: AppText.headlineSm),
                    Pill(label: badge, background: badgeColor, foreground: AppColors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: 2),
                Text(body, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
