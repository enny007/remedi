import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/catalog/drug_catalog.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';

enum _Step { vault, formulary, scanner, alarms }

/// Launch screen from the Stitch design "Splash Loader & Mascot Welcome".
/// The checklist reflects real start-up work: opening the local database,
/// loading the offline drug reference, and arming the OS alarms.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final _done = <_Step>{};
  _Step? _running;

  bool get _ready => _done.length == _Step.values.length;

  @override
  void initState() {
    super.initState();
    unawaited(_boot());
  }

  Future<void> _run(_Step step, Future<void> Function() work) async {
    if (!mounted) return;
    setState(() => _running = step);
    // A short floor keeps each line readable instead of flashing past.
    await Future.wait([work(), Future<void>.delayed(const Duration(milliseconds: 280))]);
    if (!mounted) return;
    setState(() => _done.add(step));
  }

  Future<void> _boot() async {
    await _run(_Step.vault, () => ref.read(medicationRepoProvider).loadActive());
    await _run(_Step.formulary, () async => drugCatalog.length);
    await _run(_Step.scanner, () async => ref.read(scanServiceProvider).ocrSupported);
    await _run(_Step.alarms, () => ref.read(alarmSyncProvider).resync());
    if (!mounted) return;
    setState(() => _running = null);
    if (ref.read(settingsProvider).onboarded) {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      if (mounted) context.go('/schedule');
    }
  }

  void _continue() => context.go(ref.read(settingsProvider).onboarded ? '/schedule' : '/welcome');

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final progress = _done.length / _Step.values.length;
    final onboarded = ref.watch(settingsProvider).onboarded;
    final labels = {
      _Step.vault: (Symbols.database, l.splashVault),
      _Step.formulary: (Symbols.menu_book, l.splashFormulary),
      _Step.scanner: (Symbols.document_scanner, l.splashScanner),
      _Step.alarms: (Symbols.alarm_on, l.splashAlarms),
    };

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.55),
            radius: 0.9,
            colors: [Color(0xFFE6F7F4), AppColors.surface],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Space.margin, Space.md, Space.margin, Space.lg),
                children: [
                  Row(
                    children: [
                      Pill(label: l.offlineVault.toUpperCase(), dot: AppColors.primary, background: AppColors.surfaceContainerLow, style: AppText.labelSm),
                      const Spacer(),
                      const LanguageButton(),
                    ],
                  ),
                  const SizedBox(height: Space.sm),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: AppColors.surfaceContainerLowest,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Color(0x1A0F766E), blurRadius: 40, offset: Offset(0, 12))],
                          ),
                        ),
                        Remi(size: 200, semanticLabel: l.remiName),
                        const Positioned(
                          top: 18,
                          right: 26,
                          child: IconTile(icon: Symbols.favorite, size: 30, iconSize: 16, circle: true, fill: 1, background: AppColors.tertiary, foreground: AppColors.onTertiary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Symbols.medical_services, color: AppColors.primary, size: 26),
                      const SizedBox(width: 8),
                      Text('Remedi', style: AppText.displayLg),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(l.splashTagline, textAlign: TextAlign.center, style: AppText.bodyLg.copyWith(color: AppColors.onSurfaceVariant)),
                  const SizedBox(height: Space.lg),
                  SurfaceCard(
                    radius: Radii.xl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(_ready ? Symbols.verified : Symbols.sync, size: 20, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Expanded(child: Text(_ready ? l.splashReady : l.splashPreparing, style: AppText.labelLg)),
                            Text('${(progress * 100).round()}%', style: AppText.labelLg.copyWith(color: AppColors.primary)),
                          ],
                        ),
                        const SizedBox(height: Space.sm),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(end: progress),
                            duration: const Duration(milliseconds: 300),
                            builder: (_, v, _) => LinearProgressIndicator(
                              value: v,
                              minHeight: 10,
                              backgroundColor: AppColors.surfaceContainerHigh,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: Space.sm),
                        for (final step in _Step.values) ...[
                          _CheckRow(
                            icon: labels[step]!.$1,
                            label: labels[step]!.$2,
                            status: _done.contains(step)
                                ? l.statusReady
                                : _running == step
                                ? l.statusLoading
                                : l.statusWaiting,
                            done: _done.contains(step),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: Space.md),
                  SurfaceCard(
                    color: AppColors.surfaceContainerLow,
                    shadow: false,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconTile(icon: Symbols.verified_user, background: AppColors.surfaceContainerLowest),
                        const SizedBox(width: Space.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l.zeroTelemetryTitle, style: AppText.labelLg),
                              const SizedBox(height: 2),
                              Text(l.zeroTelemetryBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Space.lg),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: _ready ? 1 : 0.5,
                    child: AppButton(
                      label: onboarded ? l.openDoseStation : l.getStarted,
                      trailingIcon: Symbols.arrow_forward,
                      onPressed: _ready ? _continue : null,
                    ),
                  ),
                  const SizedBox(height: Space.md),
                  Text(
                    'REMEDI • ${l.worksOffline.toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: AppText.labelSm.copyWith(color: AppColors.outline),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  const _CheckRow({required this.icon, required this.label, required this.status, required this.done});
  final IconData icon;
  final String label;
  final String status;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              done ? Symbols.check_circle : icon,
              key: ValueKey(done),
              size: 18,
              fill: done ? 1 : 0,
              color: done ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: AppText.bodySm.copyWith(color: AppColors.onSurface))),
          Text(status.toUpperCase(), style: AppText.labelSm.copyWith(color: done ? AppColors.primary : AppColors.outline)),
        ],
      ),
    );
  }
}
