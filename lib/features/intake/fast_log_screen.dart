import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/catalog/drug_catalog.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../services/capture_service.dart';
import '../../widgets/common.dart';
import 'draft_controller.dart';
import 'medicine_edit_sheet.dart';

const _quickPicks = [
  ('Metformin', '500mg'),
  ('Amlodipine', '5mg'),
  ('Paracetamol', '1000mg'),
  ('Omeprazole', '20mg'),
  ('Lisinopril', '10mg'),
  ('Atorvastatin', '20mg'),
  ('Artemether/Lumefantrine', '80/480mg'),
];

class FastLogScreen extends ConsumerStatefulWidget {
  const FastLogScreen({super.key});

  @override
  ConsumerState<FastLogScreen> createState() => _FastLogScreenState();
}

class _FastLogScreenState extends ConsumerState<FastLogScreen> {
  String? _lastImage;
  bool _scanning = false;

  void _startWith(MedicationDraft draft) {
    ref.read(draftProvider.notifier).start(draft);
    context.push('/add/routine');
  }

  Future<void> _scan({required bool camera}) async {
    final l = context.l10n;
    final scan = ref.read(scanServiceProvider);
    String? path;
    try {
      path = await scan.capture(fromCamera: camera);
    } catch (e) {
      if (mounted) showToast(context, l.cameraUnavailable, icon: Symbols.error);
      return;
    }
    if (path == null || !mounted) return;
    setState(() {
      _lastImage = path;
      _scanning = true;
    });
    showToast(context, l.analyzingPrescription, icon: Symbols.document_scanner);
    final text = await scan.recognizeText(path);
    if (!mounted) return;
    setState(() => _scanning = false);
    final parsed = parseMedicationText(text);
    if (parsed.drug != null) {
      final d = MedicationDraft.fromCatalog(parsed.drug!, strength: parsed.strength).copyWith(prescriptionImagePath: path);
      showToast(context, l.scanFound('${parsed.drug!.generic} ${parsed.strength ?? ''}'.trim()));
      _startWith(d);
    } else {
      showToast(context, l.scanNotRecognized, icon: Symbols.help);
      final draft = await showMedicineEditSheet(
        context,
        MedicationDraft(name: parsed.name ?? '', strength: parsed.strength ?? '', prescriptionImagePath: path),
        title: l.confirmMedicine,
      );
      if (draft != null && mounted) _startWith(draft);
    }
  }

  Future<void> _search() async {
    final draft = await showSearchSheet(context);
    if (draft != null && mounted) _startWith(draft);
  }

  Future<void> _voice() async {
    final draft = await showModalBottomSheet<MedicationDraft>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _VoiceSheet(),
    );
    if (draft != null && mounted) _startWith(draft);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: RemediHeader(subtitle: l.navFastLog),
      body: PageBody(
        spacing: Space.lg,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Pill(label: l.instantIntake, icon: Symbols.bolt, style: AppText.labelSm),
              const SizedBox(height: 6),
              Text(l.addNewMedicine, style: AppText.headlineLg),
              Text(l.addNewMedicineHint, style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          SurfaceCard(
            radius: Radii.xl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconTile(icon: Symbols.document_scanner, size: 32, iconSize: 19, circle: true, background: AppColors.primary.withValues(alpha: 0.1)),
                    const SizedBox(width: Space.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.smartScan, style: AppText.headlineSm),
                          Text(l.works100Offline, style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Pill(label: l.onDeviceOcr, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: Space.md),
                _Viewfinder(imagePath: _lastImage, scanning: _scanning, onTap: () => _scan(camera: true)),
                const SizedBox(height: Space.md),
                AppButton(label: l.snapAutoFill, icon: Symbols.photo_camera, busy: _scanning, onPressed: () => _scan(camera: true)),
                const SizedBox(height: 10),
                AppButton(
                  label: l.chooseFromGallery,
                  icon: Symbols.add_photo_alternate,
                  tone: ButtonTone.tonal,
                  height: 46,
                  onPressed: _scanning ? null : () => _scan(camera: false),
                ),
              ],
            ),
          ),
          TwoColumnGrid(
            gap: 12,
            children: [
              _MethodCard(
                icon: Symbols.mic,
                iconBg: AppColors.tertiaryFixed,
                iconFg: AppColors.tertiary,
                title: l.voiceNote,
                body: l.voiceNoteHint,
                cta: l.tapToSpeak,
                ctaColor: AppColors.tertiary,
                onTap: _voice,
              ),
              _MethodCard(
                icon: Symbols.keyboard,
                iconBg: AppColors.surfaceContainerHigh,
                iconFg: AppColors.primary,
                title: l.typeName,
                body: l.typeNameHint,
                cta: l.manualEntry,
                ctaColor: AppColors.primary,
                onTap: _search,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionTitle(l.quickPick, trailing: Text(l.oneTapAdd, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
              const SizedBox(height: Space.sm),
              Wrap(
                spacing: Space.sm,
                runSpacing: Space.sm,
                children: [
                  for (final (name, strength) in _quickPicks)
                    if (findCatalogDrug(name) case final drug?)
                      _QuickChip(
                        icon: formIcon(drug.form),
                        name: name.split('/').first,
                        strength: strength,
                        onTap: () => _startWith(MedicationDraft.fromCatalog(drug, strength: strength)),
                      ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Viewfinder extends StatelessWidget {
  const _Viewfinder({required this.imagePath, required this.scanning, required this.onTap});
  final String? imagePath;
  final bool scanning;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          decoration: BoxDecoration(color: AppColors.inverseSurface, borderRadius: BorderRadius.circular(Radii.lg)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (imagePath != null)
                Opacity(opacity: 0.4, child: Image.file(File(imagePath!), fit: BoxFit.cover))
              else
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [Color(0xFF1E3A44), AppColors.inverseSurface], radius: 0.9),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(Space.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Pill(
                          label: scanning ? l.readingText : l.lensReady,
                          dot: AppColors.inversePrimary,
                          background: AppColors.inverseSurface.withValues(alpha: 0.8),
                          foreground: AppColors.inverseOnSurface,
                        ),
                        const Spacer(),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(color: AppColors.inverseSurface.withValues(alpha: 0.8), shape: BoxShape.circle),
                          child: const Icon(Symbols.photo_camera, size: 20, color: AppColors.inverseOnSurface),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 176,
                      height: 128,
                      child: Stack(
                        children: [
                          const _Corner(top: true, left: true),
                          const _Corner(top: true, left: false),
                          const _Corner(top: false, left: true),
                          const _Corner(top: false, left: false),
                          Center(
                            child: scanning
                                ? const CircularProgressIndicator(color: AppColors.inversePrimary)
                                : Pill(
                                    label: l.aimInsideBox,
                                    icon: Symbols.center_focus_strong,
                                    background: AppColors.inverseSurface.withValues(alpha: 0.9),
                                    foreground: AppColors.inverseOnSurface,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.inverseSurface.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(Radii.md)),
                      child: Text(
                        l.aimHint,
                        textAlign: TextAlign.center,
                        style: AppText.labelMd.copyWith(color: AppColors.inverseOnSurface.withValues(alpha: 0.9)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Corner extends StatelessWidget {
  const _Corner({required this.top, required this.left});
  final bool top;
  final bool left;

  @override
  Widget build(BuildContext context) {
    const side = BorderSide(color: AppColors.inversePrimary, width: 2);
    return Positioned(
      top: top ? 0 : null,
      bottom: top ? null : 0,
      left: left ? 0 : null,
      right: left ? null : 0,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border(top: top ? side : BorderSide.none, bottom: top ? BorderSide.none : side, left: left ? side : BorderSide.none, right: left ? BorderSide.none : side),
          borderRadius: BorderRadius.only(
            topLeft: top && left ? const Radius.circular(8) : Radius.zero,
            topRight: top && !left ? const Radius.circular(8) : Radius.zero,
            bottomLeft: !top && left ? const Radius.circular(8) : Radius.zero,
            bottomRight: !top && !left ? const Radius.circular(8) : Radius.zero,
          ),
        ),
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({
    required this.icon,
    required this.iconBg,
    required this.iconFg,
    required this.title,
    required this.body,
    required this.cta,
    required this.ctaColor,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconFg;
  final String title;
  final String body;
  final String cta;
  final Color ctaColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      radius: Radii.xl,
      padding: const EdgeInsets.all(14),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTile(icon: icon, background: iconBg, foreground: iconFg, radius: Radii.lg),
          const SizedBox(height: 10),
          Text(title, style: AppText.headlineSm),
          const SizedBox(height: 2),
          Text(body, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          const Spacer(),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(child: Text(cta, style: AppText.labelSm.copyWith(color: ctaColor))),
              const SizedBox(width: 4),
              Icon(Symbols.arrow_forward, size: 14, color: ctaColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({required this.icon, required this.name, required this.strength, required this.onTap});
  final IconData icon;
  final String name;
  final String strength;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(Radii.lg),
      elevation: 1,
      shadowColor: const Color(0x220F172A),
      child: InkWell(
        borderRadius: BorderRadius.circular(Radii.lg),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(name, style: AppText.labelMd),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.sm)),
                  child: Text(strength, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Catalog search with a free-text fallback for medicines not in the list.
Future<MedicationDraft?> showSearchSheet(BuildContext context) {
  return showModalBottomSheet<MedicationDraft>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const _SearchSheet(),
  );
}

class _SearchSheet extends StatefulWidget {
  const _SearchSheet();

  @override
  State<_SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends State<_SearchSheet> {
  final _q = TextEditingController();

  @override
  void dispose() {
    _q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final results = searchCatalog(_q.text);
    final query = _q.text.trim();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.margin),
              child: TextField(
                controller: _q,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: l.searchMedicineHint,
                  prefixIcon: const Icon(Symbols.search),
                ),
              ),
            ),
            const SizedBox(height: Space.sm),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: Space.margin, vertical: Space.sm),
                children: [
                  if (query.isNotEmpty && !results.any((d) => d.generic.toLowerCase() == query.toLowerCase()))
                    ListTile(
                      leading: const IconTile(icon: Symbols.add, size: 40),
                      title: Text(l.useCustomMedicine(query), style: AppText.labelLg),
                      subtitle: Text(l.useCustomMedicineHint, style: AppText.bodySm),
                      onTap: () async {
                        final draft = await showMedicineEditSheet(context, MedicationDraft(name: query, strength: ''), title: l.confirmMedicine);
                        if (draft != null && context.mounted) Navigator.pop(context, draft);
                      },
                    ),
                  for (final d in results)
                    ListTile(
                      leading: IconTile(icon: formIcon(d.form), size: 40),
                      title: Text(d.generic, style: AppText.labelLg),
                      subtitle: Text(
                        [if (d.brands.isNotEmpty) d.brands.take(2).join(', '), d.drugClass].join(' • '),
                        style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          for (final s in d.strengths.take(2))
                            ActionChip(
                              label: Text(s),
                              labelStyle: AppText.labelSm,
                              visualDensity: VisualDensity.compact,
                              side: BorderSide.none,
                              backgroundColor: AppColors.surfaceContainer,
                              onPressed: () => Navigator.pop(context, MedicationDraft.fromCatalog(d, strength: s)),
                            ),
                        ],
                      ),
                      onTap: () => Navigator.pop(context, MedicationDraft.fromCatalog(d)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VoiceSheet extends ConsumerStatefulWidget {
  const _VoiceSheet();

  @override
  ConsumerState<_VoiceSheet> createState() => _VoiceSheetState();
}

class _VoiceSheetState extends ConsumerState<_VoiceSheet> {
  // Held directly so dispose() never touches `ref` after unmount.
  late final VoiceService _voice = ref.read(voiceServiceProvider);
  String _words = '';
  bool _listening = false;
  VoiceError? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    setState(() {
      _error = null;
      _words = '';
    });
    if (!await _voice.init()) {
      if (mounted) setState(() => _error = VoiceError.unavailable);
      return;
    }
    if (await _voice.permissionDenied) {
      if (mounted) setState(() => _error = VoiceError.permissionDenied);
      return;
    }
    if (!mounted) return;
    final locale = await _voice.localeFor(ref.read(localeProvider).languageCode);
    if (!mounted) return;
    setState(() => _listening = true);
    HapticFeedback.lightImpact();
    await _voice.listen(
      localeId: locale,
      onResult: (w, _) {
        if (mounted) setState(() => _words = w);
      },
      onDone: (error) {
        if (!mounted) return;
        setState(() {
          _listening = false;
          // "No match" after hearing words is fine; keep what was heard.
          _error = error == VoiceError.noMatch && _words.isNotEmpty ? null : error;
        });
      },
    );
  }

  Future<void> _stop() async {
    await _voice.stop();
  }

  @override
  void dispose() {
    if (_voice.isListening) _voice.cancel();
    super.dispose();
  }

  String _status(BuildContext context) {
    final l = context.l10n;
    return switch (_error) {
      VoiceError.unavailable => l.voiceUnavailable,
      VoiceError.permissionDenied => l.voicePermissionDenied,
      VoiceError.noMatch => l.voiceNoMatch,
      VoiceError.network => l.voiceNetwork,
      VoiceError.other => l.voiceFailed,
      null when _words.isNotEmpty => '“$_words”',
      null when _listening => l.listening,
      null => l.tapMicToSpeak,
    };
  }

  Future<void> _typeInstead() async {
    final draft = await showSearchSheet(context);
    if (draft != null && mounted) Navigator.pop(context, draft);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final parsed = _words.isEmpty || _listening ? null : parseMedicationText(_words);
    final canRetry = _error != VoiceError.unavailable && _error != VoiceError.permissionDenied;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.voiceNote, style: AppText.headlineMd),
            Text(l.voiceSheetHint, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: Space.lg),
            Center(
              child: Semantics(
                button: true,
                label: _listening ? l.stopListening : l.tapMicToSpeak,
                child: GestureDetector(
                  onTap: _listening ? _stop : (canRetry ? _start : null),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _listening ? 96 : 80,
                    height: _listening ? 96 : 80,
                    decoration: BoxDecoration(
                      color: _error != null
                          ? AppColors.surfaceContainerHigh
                          : _listening
                          ? AppColors.tertiaryContainer
                          : AppColors.tertiaryFixed,
                      shape: BoxShape.circle,
                      boxShadow: _listening ? const [BoxShadow(color: Color(0x55B94200), blurRadius: 24)] : null,
                    ),
                    child: Icon(
                      _listening ? Symbols.stop : (_error != null ? Symbols.mic_off : Symbols.mic),
                      size: 40,
                      fill: 1,
                      color: _listening ? AppColors.onTertiary : (_error != null ? AppColors.outline : AppColors.tertiary),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Space.md),
            Text(
              _status(context),
              textAlign: TextAlign.center,
              style: AppText.bodyLg.copyWith(color: _error != null ? AppColors.tertiary : AppColors.onSurface),
            ),
            if (_listening) ...[
              const SizedBox(height: 4),
              Text(l.tapToStop, textAlign: TextAlign.center, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
            ],
            const SizedBox(height: Space.lg),
            if (parsed?.name != null)
              AppButton(
                label: l.useThisMedicine('${parsed!.name} ${parsed.strength ?? ''}'.trim()),
                icon: Symbols.check,
                onPressed: () async {
                  final draft = parsed.drug != null
                      ? MedicationDraft.fromCatalog(parsed.drug!, strength: parsed.strength)
                      : await showMedicineEditSheet(context, MedicationDraft(name: parsed.name!, strength: parsed.strength ?? ''), title: l.confirmMedicine);
                  if (draft != null && context.mounted) Navigator.pop(context, draft);
                },
              )
            else if (!_listening && _words.isNotEmpty)
              Text(l.voiceNotRecognised, textAlign: TextAlign.center, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            if (!_listening) ...[
              const SizedBox(height: Space.sm),
              Row(
                children: [
                  if (canRetry)
                    Expanded(
                      child: AppButton(label: l.tryAgain, icon: Symbols.mic, tone: ButtonTone.tonal, height: 48, onPressed: _start),
                    ),
                  if (canRetry) const SizedBox(width: Space.sm),
                  Expanded(
                    child: AppButton(label: l.typeInstead, icon: Symbols.keyboard, tone: ButtonTone.low, height: 48, onPressed: _typeInstead),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
