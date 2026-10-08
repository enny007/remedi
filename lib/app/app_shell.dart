import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../widgets/common.dart';

/// Bottom navigation: Schedule · Fast Log · My Meds · Health.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final items = [
      (Symbols.event_upcoming, l.navSchedule),
      (Symbols.qr_code_scanner, l.navFastLog),
      (Symbols.medication, l.navMyMeds),
      (Symbols.vital_signs, l.navHealth),
    ];
    return Scaffold(
      body: shell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest.withValues(alpha: 0.97),
          boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 12, offset: Offset(0, -2))],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < items.length; i++)
                      _NavItem(
                        icon: items[i].$1,
                        label: items[i].$2,
                        selected: shell.currentIndex == i,
                        onTap: () {
                          HapticFeedback.selectionClick();
                          shell.goBranch(i, initialLocation: i == shell.currentIndex);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.selected, required this.onTap});
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.onSurfaceVariant;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Radii.lg),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 64, minHeight: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primaryFixed.withValues(alpha: 0.45) : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Icon(icon, size: 24, color: color, fill: selected ? 1 : 0),
                ),
                const SizedBox(height: 2),
                Text(label, style: AppText.labelSm.copyWith(color: color, fontWeight: selected ? FontWeight.w700 : FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
