import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import '../providers/providers.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Level-1 card: white face, 12px radius, ultra-subtle lift.
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(Space.md),
    this.color = AppColors.surfaceContainerLowest,
    this.radius = Radii.lg,
    this.shadow = true,
    this.onTap,
    this.accent,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double radius;
  final bool shadow;
  final VoidCallback? onTap;

  /// Optional 6–8px left rail (teal on-time, amber due, orange overdue).
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    Widget body = Padding(padding: padding, child: child);
    if (accent != null) {
      body = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Container(width: 8, color: accent), Expanded(child: body)],
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: shadow ? AppColors.cardShadow : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: onTap == null ? body : InkWell(onTap: onTap, child: body),
      ),
    );
  }
}

class Pill extends StatelessWidget {
  const Pill({
    super.key,
    required this.label,
    this.background = AppColors.surfaceContainerHigh,
    this.foreground = AppColors.primary,
    this.icon,
    this.dot,
    this.uppercase = false,
    this.style,
  });

  final String label;
  final Color background;
  final Color foreground;
  final IconData? icon;
  final Color? dot;
  final bool uppercase;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot != null) ...[
            PulseDot(color: dot!),
            const SizedBox(width: 6),
          ],
          if (icon != null) ...[
            Icon(icon, size: 13, color: foreground),
            const SizedBox(width: 3),
          ],
          Flexible(
            child: Text(
              uppercase ? label.toUpperCase() : label,
              style: (style ?? AppText.labelSm).copyWith(color: foreground),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Small breathing status dot.
class PulseDot extends StatefulWidget {
  const PulseDot({super.key, required this.color, this.size = 8});
  final Color color;
  final double size;

  @override
  State<PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<PulseDot> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations) {
      return _dot(1);
    }
    return AnimatedBuilder(animation: _c, builder: (_, _) => _dot(0.45 + 0.55 * _c.value));
  }

  Widget _dot(double opacity) => Container(
    width: widget.size,
    height: widget.size,
    decoration: BoxDecoration(color: widget.color.withValues(alpha: opacity), shape: BoxShape.circle),
  );
}

class IconTile extends StatelessWidget {
  const IconTile({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconSize = 22,
    this.background = AppColors.surfaceContainerLow,
    this.foreground = AppColors.primary,
    this.radius = Radii.md,
    this.fill = 0,
    this.circle = false,
  });

  final IconData icon;
  final double size;
  final double iconSize;
  final Color background;
  final Color foreground;
  final double radius;
  final double fill;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background,
        borderRadius: circle ? null : BorderRadius.circular(radius),
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: iconSize, color: foreground, fill: fill),
    );
  }
}

enum ButtonTone { primary, primaryContainer, tonal, low, surface, tertiary, danger, ghost }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.trailingIcon,
    this.tone = ButtonTone.primary,
    this.height = 52,
    this.expand = true,
    this.textStyle,
    this.busy = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final IconData? trailingIcon;
  final ButtonTone tone;
  final double height;
  final bool expand;
  final TextStyle? textStyle;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, iconColor) = switch (tone) {
      ButtonTone.primary => (AppColors.primary, AppColors.onPrimary, AppColors.onPrimary),
      ButtonTone.primaryContainer => (AppColors.primaryContainer, AppColors.onPrimary, AppColors.onPrimary),
      ButtonTone.tonal => (AppColors.surfaceContainer, AppColors.onSurface, AppColors.primary),
      ButtonTone.low => (AppColors.surfaceContainerLow, AppColors.onSurface, AppColors.primary),
      ButtonTone.surface => (AppColors.surfaceContainerLowest, AppColors.onSurface, AppColors.primary),
      ButtonTone.tertiary => (AppColors.tertiary, AppColors.onTertiary, AppColors.onTertiary),
      ButtonTone.danger => (AppColors.surfaceContainerLowest, AppColors.error, AppColors.error),
      ButtonTone.ghost => (Colors.transparent, AppColors.onSurfaceVariant, AppColors.primary),
    };
    final disabled = onPressed == null || busy;
    final style = (textStyle ?? (height >= 52 ? AppText.labelLg : AppText.labelMd));
    final child = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (busy)
          SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5, color: fg))
        else if (icon != null)
          Icon(icon, size: height >= 52 ? 22 : 18, color: disabled ? AppColors.surfaceContainer : iconColor),
        if (icon != null || busy) const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: style.copyWith(color: disabled ? AppColors.surfaceContainer : fg),
          ),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: 6),
          Icon(trailingIcon, size: 18, color: disabled ? AppColors.surfaceContainer : fg),
        ],
      ],
    );
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height, minWidth: expand ? double.infinity : 0),
      child: Material(
        color: disabled ? AppColors.secondary.withValues(alpha: 0.4) : bg,
        borderRadius: BorderRadius.circular(Radii.lg),
        elevation: 0,
        shadowColor: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.lg),
          onTap: disabled
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onPressed!();
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Center(widthFactor: expand ? null : 1, child: child),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key, this.trailing, this.icon});
  final String title;
  final Widget? trailing;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 20, color: AppColors.primary), const SizedBox(width: 6)],
          Expanded(child: Text(title, style: AppText.headlineSm)),
          ?trailing,
        ],
      ),
    );
  }
}

class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.value,
    this.size = 64,
    this.stroke = 6,
    this.color = AppColors.primaryContainer,
    this.track = AppColors.surfaceContainerHigh,
    this.child,
  });

  final double value;
  final double size;
  final double stroke;
  final Color color;
  final Color track;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value.clamp(0, 1)),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        builder: (_, v, _) => CustomPaint(
          painter: _RingPainter(v, stroke, color, track),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.value, this.stroke, this.color, this.track);
  final double value;
  final double stroke;
  final Color color;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final r = rect.deflate(stroke / 2);
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(r, 0, math.pi * 2, false, p..color = track);
    if (value > 0) canvas.drawArc(r, -math.pi / 2, math.pi * 2 * value, false, p..color = color);
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.value != value || old.color != color;
}

// ── Header ──────────────────────────────────────────────────────────────────

class RemediLogo extends StatelessWidget {
  const RemediLogo({super.key, this.size = 32});
  final double size;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(size * 0.26),
    child: SvgPicture.asset('assets/brand/logo.svg', width: size, height: size),
  );
}

class OfflinePill extends StatelessWidget {
  const OfflinePill({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final wide = MediaQuery.sizeOf(context).width >= 400;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 1))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PulseDot(color: AppColors.primary),
          const SizedBox(width: 6),
          Text(wide ? l.offlineReady : l.offline, style: AppText.labelSm.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(localeProvider).languageCode;
    return Semantics(
      button: true,
      label: context.l10n.changeLanguage,
      child: Material(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(Radii.md),
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.md),
          onTap: () => showLanguageSheet(context),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44, minWidth: 44),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Symbols.language, size: 18, color: AppColors.primary),
                  const SizedBox(width: 2),
                  Text(languageShortCode(code), style: AppText.labelMd.copyWith(color: AppColors.onSurface)),
                  const Icon(Symbols.arrow_drop_down, size: 16, color: AppColors.onSurface),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String languageShortCode(String code) => code == 'pcm' ? 'PCM' : code.toUpperCase();

/// Language names are always shown in their own language.
const languageNativeNames = {
  'en': 'English',
  'yo': 'Yorùbá',
  'pcm': 'Naijá (Pidgin)',
  'ig': 'Asụsụ Igbo',
  'ha': 'Harshen Hausa',
};

Future<void> showLanguageSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => Consumer(
      builder: (ctx, ref, _) {
        final current = ref.watch(localeProvider).languageCode;
        final l = ctx.l10n;
        final maxHeight = MediaQuery.sizeOf(ctx).height * 0.9;
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.chooseLanguage, style: AppText.headlineMd),
                    const SizedBox(height: 4),
                    Text(l.chooseLanguageHint, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: Space.md),
                    for (final code in supportedLanguageCodes) ...[
                      _LanguageTile(
                        code: code,
                        selected: code == current,
                        onTap: () async {
                          await ref.read(localeProvider.notifier).set(code);
                          if (ctx.mounted) Navigator.of(ctx).pop();
                        },
                      ),
                      const SizedBox(height: Space.sm),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({required this.code, required this.selected, required this.onTap});
  final String code;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : AppColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(Radii.lg),
      child: InkWell(
        borderRadius: BorderRadius.circular(Radii.lg),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.md),
            child: Row(
              children: [
                Container(
                  width: 40,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primaryContainer : AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    languageShortCode(code),
                    style: AppText.labelSm.copyWith(color: selected ? AppColors.onPrimary : AppColors.primary),
                  ),
                ),
                const SizedBox(width: Space.md),
                Expanded(
                  child: Text(
                    languageNativeNames[code]!,
                    style: AppText.bodyLg.copyWith(
                      color: selected ? AppColors.onPrimary : AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (selected) const Icon(Symbols.check_circle, color: AppColors.onPrimary, fill: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key, this.size = 32});
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).value;
    final path = profile?.avatarPath;
    final name = profile?.fullName ?? '';
    final initials = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).take(2).map((p) => p[0].toUpperCase()).join();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryFixed,
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 1))],
        image: path != null && File(path).existsSync()
            ? DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover)
            : null,
      ),
      alignment: Alignment.center,
      child: path == null
          ? Text(initials.isEmpty ? '•' : initials, style: AppText.labelMd.copyWith(color: AppColors.onPrimaryFixed, fontSize: size * 0.36))
          : null,
    );
  }
}

/// Sticky translucent header used on every tab: logo, section name, offline
/// status, language switcher and profile.
class RemediHeader extends StatelessWidget implements PreferredSizeWidget {
  const RemediHeader({super.key, required this.subtitle, this.showBack = false});
  final String subtitle;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    // Inner screens get a plain back + title bar; the branded header with
    // offline status, language and profile is only for the main tabs.
    if (showBack) {
      return Material(
        color: AppColors.surface,
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                const SizedBox(width: 4),
                IconButton(
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () => context.canPop() ? context.pop() : context.go('/schedule'),
                  icon: const Icon(Symbols.arrow_back),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: Space.margin),
              ],
            ),
          ),
        ),
      );
    }
    return Material(
      color: AppColors.surface.withValues(alpha: 0.94),
      elevation: 0,
      shadowColor: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 64,
          padding: EdgeInsets.only(left: showBack ? 4 : Space.margin, right: Space.margin),
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0x0A000000), blurRadius: 8, offset: Offset(0, 1))],
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              if (showBack)
                IconButton(
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () => context.canPop() ? context.pop() : context.go('/schedule'),
                  icon: const Icon(Symbols.arrow_back),
                ),
              const RemediLogo(),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Remedi', style: AppText.headlineSm.copyWith(color: AppColors.primary, height: 1.1)),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const OfflinePill(),
              const SizedBox(width: Space.xs),
              const LanguageButton(),
              Semantics(
                button: true,
                label: context.l10n.profileTitle,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => context.push('/profile'),
                  child: const SizedBox(width: 44, height: 44, child: Center(child: ProfileAvatar())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Standard scrolling page body: max 640px wide, 20px side margins.
class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.children, this.bottomPadding = 24, this.spacing = Space.md, this.controller});
  final List<Widget> children;
  final double bottomPadding;
  final double spacing;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: ListView.separated(
          controller: controller,
          padding: EdgeInsets.fromLTRB(Space.margin, Space.md, Space.margin, bottomPadding),
          itemCount: children.length,
          separatorBuilder: (_, _) => SizedBox(height: spacing),
          itemBuilder: (_, i) => children[i],
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message, {IconData icon = Symbols.check_circle, SnackBarAction? action}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: AppColors.inversePrimary, size: 20),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        action: action,
        duration: const Duration(seconds: 4),
      ),
    );
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.icon, required this.title, required this.body, this.action});
  final IconData icon;
  final String title;
  final String body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        children: [
          IconTile(icon: icon, size: 64, iconSize: 32, circle: true, background: AppColors.surfaceContainerHigh, foreground: AppColors.onSurfaceVariant),
          const SizedBox(height: Space.sm),
          Text(title, style: AppText.headlineSm, textAlign: TextAlign.center),
          const SizedBox(height: 4),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(body, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant), textAlign: TextAlign.center),
          ),
          if (action != null) ...[const SizedBox(height: Space.md), action!],
        ],
      ),
    );
  }
}

/// Selectable large tile used in wizards (frequency, food, meal condition).
class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    super.key,
    required this.selected,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.icon,
    this.minHeight = 76,
    this.selectedColor = AppColors.primary,
  });

  final bool selected;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback onTap;
  final double minHeight;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final fg = selected ? AppColors.onPrimary : AppColors.onSurface;
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? selectedColor : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(Radii.lg),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.lg),
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: Container(
            constraints: BoxConstraints(minHeight: minHeight),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Radii.lg),
              boxShadow: selected ? null : AppColors.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (icon != null)
                      Icon(icon, size: 22, fill: selected ? 1 : 0, color: selected ? AppColors.onPrimaryContainer : AppColors.secondary),
                    const Spacer(),
                    Icon(
                      selected ? Symbols.check_circle : Symbols.radio_button_unchecked,
                      size: 20,
                      fill: selected ? 1 : 0,
                      color: selected ? AppColors.onPrimary : AppColors.surfaceDim,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(title, style: AppText.labelLg.copyWith(color: fg, height: 1.2)),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppText.labelSm.copyWith(color: selected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Two-column grid that sizes rows to their tallest child.
class TwoColumnGrid extends StatelessWidget {
  const TwoColumnGrid({super.key, required this.children, this.gap = 10});
  final List<Widget> children;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += 2) {
      rows.add(IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: children[i]),
            SizedBox(width: gap),
            Expanded(child: i + 1 < children.length ? children[i + 1] : const SizedBox()),
          ],
        ),
      ));
      if (i + 2 < children.length) rows.add(SizedBox(height: gap));
    }
    return Column(children: rows);
  }
}
