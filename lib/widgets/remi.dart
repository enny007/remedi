import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';

// Remi, the Remedi mascot, from the Stitch asset "Remi - Remedi Friendly Health
// Companion Mascot". The artwork is split into layers sharing one 240×240
// viewBox so the parts can be animated independently.

const _defs = '''
<defs>
  <linearGradient id="bodyGrad" x1="40" y1="30" x2="200" y2="210" gradientUnits="userSpaceOnUse">
    <stop offset="0%" stop-color="#2DD4BF"/><stop offset="50%" stop-color="#0F766E"/><stop offset="100%" stop-color="#042F2E"/>
  </linearGradient>
  <linearGradient id="bellyGrad" x1="70" y1="80" x2="170" y2="190" gradientUnits="userSpaceOnUse">
    <stop offset="0%" stop-color="#CCFBF1"/><stop offset="100%" stop-color="#99F6E4"/>
  </linearGradient>
</defs>''';

String _svg(String body) => '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 240" fill="none">$_defs$body</svg>';

final _halo = _svg('<circle cx="120" cy="120" r="95" stroke="#14B8A6" stroke-width="2.5" stroke-dasharray="6 8" stroke-opacity="0.3"/>');

final _shadow = _svg('<ellipse cx="120" cy="208" rx="55" ry="12" fill="#042F2E" fill-opacity="0.12"/>');

final _body = _svg('''
<rect x="65" y="45" width="110" height="145" rx="55" fill="url(#bodyGrad)"/>
<path d="M72 80 C80 55, 160 55, 168 80" stroke="#FFFFFF" stroke-width="4" stroke-linecap="round" stroke-opacity="0.4"/>
<rect x="76" y="98" width="88" height="84" rx="42" fill="url(#bellyGrad)"/>
<rect x="114" y="132" width="12" height="30" rx="6" fill="#0F766E"/>
<rect x="105" y="141" width="30" height="12" rx="6" fill="#0F766E"/>
<path d="M112 108 Q120 116 128 108" stroke="#042F2E" stroke-width="3" stroke-linecap="round" fill="none"/>
<circle cx="86" cy="102" r="7" fill="#FDA4AF"/>
<circle cx="154" cy="102" r="7" fill="#FDA4AF"/>
<path d="M174 122 C186 126, 192 138, 185 146 C178 152, 172 138, 172 128" fill="#14B8A6" stroke="#0F766E" stroke-width="2"/>
<path d="M120 45 L120 30" stroke="#0D9488" stroke-width="3.5" stroke-linecap="round"/>
''');

final _eyes = _svg('''
<ellipse cx="98" cy="92" rx="9" ry="11" fill="#042F2E"/>
<circle cx="101" cy="88" r="4" fill="#FFFFFF"/><circle cx="95" cy="96" r="1.5" fill="#FFFFFF"/>
<ellipse cx="142" cy="92" rx="9" ry="11" fill="#042F2E"/>
<circle cx="145" cy="88" r="4" fill="#FFFFFF"/><circle cx="139" cy="96" r="1.5" fill="#FFFFFF"/>
''');

final _waveArm = _svg('<path d="M66 120 C50 110, 42 95, 48 85 C54 77, 65 92, 68 108" fill="#14B8A6" stroke="#0F766E" stroke-width="2"/>');

final _spark = _svg('<circle cx="120" cy="24" r="8" fill="#F43F5E"/>');
final _sparkRing = _svg('<circle cx="120" cy="24" r="13" stroke="#F43F5E" stroke-width="2" stroke-opacity="0.5"/>');

/// Converts a point in the 240×240 artwork to an [Alignment] for pivots.
Alignment _at(double x, double y) => Alignment(x / 120 - 1, y / 120 - 1);

enum RemiPose { waving, idle }

/// Animated mascot: bobs, blinks, waves and pulses its antenna.
/// Honours the system "reduce motion" setting.
class Remi extends StatefulWidget {
  const Remi({super.key, this.size = 160, this.pose = RemiPose.waving, this.showHalo = true, this.semanticLabel});
  final double size;
  final RemiPose pose;
  final bool showHalo;
  final String? semanticLabel;

  @override
  State<Remi> createState() => _RemiState();
}

class _RemiState extends State<Remi> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400))..repeat();

  static final _layers = {
    for (final e in {'halo': _halo, 'shadow': _shadow, 'body': _body, 'eyes': _eyes, 'arm': _waveArm, 'spark': _spark, 'ring': _sparkRing}.entries)
      e.key: SvgPicture.string(e.value, fit: BoxFit.contain),
  };

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final child = SizedBox.square(
      dimension: widget.size,
      child: still ? _frame(0) : AnimatedBuilder(animation: _c, builder: (_, _) => _frame(_c.value)),
    );
    return Semantics(label: widget.semanticLabel, image: widget.semanticLabel != null, child: ExcludeSemantics(child: child));
  }

  Widget _frame(double t) {
    final phase = t * 2 * math.pi;
    final bob = math.sin(phase) * widget.size * 0.025;
    final wave = widget.pose == RemiPose.waving ? math.sin(phase * 2) * 0.35 : math.sin(phase) * 0.06;
    // Blink briefly near the end of each cycle.
    final blink = t > 0.9 && t < 0.96 ? 0.12 : 1.0;
    final pulse = (t * 2) % 1;
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.showHalo)
          Transform.rotate(angle: phase / 12, child: _layers['halo']!),
        Transform.scale(scaleX: 1 - bob / widget.size * 2, child: _layers['shadow']!),
        Transform.translate(
          offset: Offset(0, bob),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _layers['body']!,
              Transform(
                alignment: _at(120, 92),
                transform: Matrix4.diagonal3Values(1, blink, 1),
                child: _layers['eyes']!,
              ),
              Transform.rotate(alignment: _at(67, 112), angle: wave, child: _layers['arm']!),
              Transform.scale(
                alignment: _at(120, 24),
                scale: 1 + pulse * 0.8,
                child: Opacity(opacity: 1 - pulse, child: _layers['ring']!),
              ),
              _layers['spark']!,
            ],
          ),
        ),
      ],
    );
  }
}

/// App-wide loading indicator: Remi bobbing with an optional message.
class RemiLoader extends StatelessWidget {
  const RemiLoader({super.key, this.message, this.size = 96});
  final String? message;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Remi(size: size, pose: RemiPose.idle, showHalo: false),
          if (message != null) ...[
            const SizedBox(height: Space.sm),
            Text(message!, textAlign: TextAlign.center, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          ],
        ],
      ),
    );
  }
}
