import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as pathlib;
import 'package:path_provider/path_provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/db/app_database.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final profile = ref.watch(profileProvider);
    return Scaffold(
      appBar: RemediHeader(subtitle: l.profileTitle, showBack: true),
      body: profile.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (p) => _ProfileForm(key: ValueKey(p?.id), profile: p),
      ),
    );
  }
}

class _ProfileForm extends ConsumerStatefulWidget {
  const _ProfileForm({super.key, required this.profile});
  final Profile? profile;

  @override
  ConsumerState<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<_ProfileForm> {
  late final Profile? p = widget.profile;
  late final _title = TextEditingController(text: p?.title ?? '');
  late final _name = TextEditingController(text: p?.fullName ?? '');
  late final _allergies = TextEditingController(text: p?.allergies ?? '');
  late final _cgName = TextEditingController(text: p?.caregiverName ?? '');
  late final _cgRelation = TextEditingController(text: p?.caregiverRelation ?? '');
  late final _cgPhone = TextEditingController(text: p?.caregiverPhone ?? '');
  late DateTime? _dob = p?.dateOfBirth;
  late String? _sex = p?.sex;
  late String? _blood = p?.bloodGroup;
  late String? _genotype = p?.genotype;
  late bool _alerts = p?.caregiverAlertsEnabled ?? true;
  late int _delay = p?.caregiverDelayMinutes ?? 20;
  late String? _avatar = p?.avatarPath;

  @override
  void dispose() {
    for (final c in [_title, _name, _allergies, _cgName, _cgRelation, _cgPhone]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _t(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();

  Future<void> _save() async {
    await ref.read(healthRepoProvider).saveProfile(ProfilesCompanion(
      fullName: Value(_name.text.trim()),
      title: Value(_t(_title)),
      dateOfBirth: Value(_dob),
      sex: Value(_sex),
      bloodGroup: Value(_blood),
      genotype: Value(_genotype),
      allergies: Value(_t(_allergies)),
      avatarPath: Value(_avatar),
      caregiverName: Value(_t(_cgName)),
      caregiverRelation: Value(_t(_cgRelation)),
      caregiverPhone: Value(_t(_cgPhone)),
      caregiverAlertsEnabled: Value(_alerts),
      caregiverDelayMinutes: Value(_delay),
    ));
    if (mounted) showToast(context, context.l10n.changesSaved);
  }

  Future<void> _pickAvatar() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 512, imageQuality: 85);
    if (file == null) return;
    final dir = await getApplicationDocumentsDirectory();
    final dest = pathlib.join(dir.path, 'avatar${pathlib.extension(file.path)}');
    await File(file.path).copy(dest);
    // Bust the image cache for the reused path.
    imageCache.evict(FileImage(File(dest)));
    setState(() => _avatar = dest);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return PageBody(
      bottomPadding: 40,
      children: [
        Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickAvatar,
                child: Stack(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryFixed,
                        image: _avatar != null && File(_avatar!).existsSync()
                            ? DecorationImage(image: FileImage(File(_avatar!)), fit: BoxFit.cover)
                            : null,
                      ),
                      child: _avatar == null ? const Icon(Symbols.person, size: 44, color: AppColors.onPrimaryFixed) : null,
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconTile(icon: Symbols.photo_camera, size: 30, iconSize: 16, circle: true, background: AppColors.primary, foreground: AppColors.onPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _Group(
          title: l.aboutYouTitle,
          icon: Symbols.person,
          children: [
            Row(
              children: [
                SizedBox(width: 96, child: TextField(controller: _title, decoration: InputDecoration(labelText: l.titleLabel, hintText: 'Mrs.'))),
                const SizedBox(width: Space.sm),
                Expanded(child: TextField(controller: _name, textCapitalization: TextCapitalization.words, decoration: InputDecoration(labelText: l.yourName))),
              ],
            ),
            const SizedBox(height: Space.sm),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _dob ?? DateTime(1970),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => _dob = picked);
              },
              child: InputDecorator(
                decoration: InputDecoration(labelText: l.dateOfBirth, suffixIcon: const Icon(Symbols.calendar_month)),
                child: Text(_dob == null ? '—' : formatDate(context, _dob!), style: AppText.bodyLg),
              ),
            ),
            const SizedBox(height: Space.sm),
            _ChoiceRow(label: l.sex, value: _sex, options: {'Female': l.female, 'Male': l.male}, onChanged: (v) => setState(() => _sex = v)),
            _ChoiceRow(
              label: l.bloodGroup,
              value: _blood,
              options: {for (final g in const ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-']) g: g},
              onChanged: (v) => setState(() => _blood = v),
            ),
            _ChoiceRow(
              label: l.genotype,
              value: _genotype,
              options: {for (final g in const ['AA', 'AS', 'AC', 'SS', 'SC']) g: g},
              onChanged: (v) => setState(() => _genotype = v),
            ),
            TextField(controller: _allergies, decoration: InputDecoration(labelText: l.allergies, hintText: l.allergiesHint)),
          ],
        ),
        _Group(
          title: l.caregiverFailSafe,
          icon: Symbols.contact_phone,
          children: [
            Text(l.caregiverWhy, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: Space.sm),
            TextField(controller: _cgName, textCapitalization: TextCapitalization.words, decoration: InputDecoration(labelText: l.caregiverName)),
            const SizedBox(height: Space.sm),
            TextField(controller: _cgRelation, textCapitalization: TextCapitalization.words, decoration: InputDecoration(labelText: l.caregiverRelation, hintText: l.caregiverRelationHint)),
            const SizedBox(height: Space.sm),
            TextField(controller: _cgPhone, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: l.caregiverPhone)),
            const SizedBox(height: Space.sm),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _alerts,
              onChanged: (v) => setState(() => _alerts = v),
              title: Text(l.caregiverAlertsToggle, style: AppText.labelLg),
              subtitle: Text(l.caregiverAlertsToggleHint, style: AppText.bodySm),
            ),
            if (_alerts)
              _ChoiceRow(
                label: l.alertAfter,
                value: '$_delay',
                options: {for (final m in const [10, 20, 30, 60]) '$m': l.minutesShort(m.toString())},
                onChanged: (v) => setState(() => _delay = int.parse(v!)),
              ),
          ],
        ),
        _Group(
          title: l.appSettings,
          icon: Symbols.settings,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Symbols.language, color: AppColors.primary),
              title: Text(l.changeLanguage, style: AppText.labelLg),
              subtitle: Text(languageNativeNames[ref.watch(localeProvider).languageCode]!),
              trailing: const Icon(Symbols.chevron_right),
              onTap: () => showLanguageSheet(context),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Symbols.notifications_active, color: AppColors.primary),
              title: Text(l.alarmPermissions, style: AppText.labelLg),
              subtitle: Text(l.alarmPermissionsHint),
              trailing: const Icon(Symbols.chevron_right),
              onTap: () async {
                final ok = await ref.read(notificationServiceProvider).requestPermissions(fullScreen: true);
                await ref.read(alarmSyncProvider).resync();
                if (context.mounted) showToast(context, ok ? l.alarmsArmed : l.alarmsBlocked, icon: ok ? Symbols.check_circle : Symbols.error);
              },
            ),
          ],
        ),
        AppButton(label: l.saveChanges, icon: Symbols.check, onPressed: _save),
        Text(l.medicalDisclaimer, textAlign: TextAlign.center, style: AppText.labelSm.copyWith(color: AppColors.outline, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.title, required this.icon, required this.children});
  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
              const SizedBox(width: Space.sm),
              Text(title, style: AppText.headlineSm),
            ],
          ),
          const SizedBox(height: Space.md),
          ...children,
        ],
      ),
    );
  }
}

class _ChoiceRow extends StatelessWidget {
  const _ChoiceRow({required this.label, required this.value, required this.options, required this.onChanged});
  final String label;
  final String? value;
  final Map<String, String> options;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.labelMd),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final e in options.entries)
                ChoiceChip(
                  selected: value == e.key,
                  showCheckmark: false,
                  label: Text(e.value),
                  labelStyle: AppText.labelMd.copyWith(color: value == e.key ? AppColors.onPrimary : AppColors.onSurface),
                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceContainerLow,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  onSelected: (s) => onChanged(s ? e.key : null),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
