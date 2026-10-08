import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/catalog/drug_catalog.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../widgets/common.dart';

/// Edit name, strength and dose form. When a new medicine's name matches the
/// offline catalog, its safe defaults (food rule, frequency, side effects) are
/// applied.
Future<MedicationDraft?> showMedicineEditSheet(BuildContext context, MedicationDraft draft, {String? title}) {
  return showModalBottomSheet<MedicationDraft>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _MedicineEditSheet(draft: draft, title: title),
  );
}

class _MedicineEditSheet extends StatefulWidget {
  const _MedicineEditSheet({required this.draft, this.title});
  final MedicationDraft draft;
  final String? title;

  @override
  State<_MedicineEditSheet> createState() => _MedicineEditSheetState();
}

class _MedicineEditSheetState extends State<_MedicineEditSheet> {
  late final _name = TextEditingController(text: widget.draft.name);
  late final _strength = TextEditingController(text: widget.draft.strength);
  late DoseForm _form = widget.draft.form;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _strength.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    var d = widget.draft;
    final name = _name.text.trim();
    final catalog = d.id == null && name.toLowerCase() != d.name.toLowerCase() ? findCatalogDrug(name) : null;
    if (catalog != null) {
      d = MedicationDraft.fromCatalog(catalog, strength: _strength.text.trim()).copyWith(
        prescriptionImagePath: d.prescriptionImagePath,
      );
    }
    Navigator.pop(context, d.copyWith(name: name, strength: _strength.text.trim(), form: _form));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.title ?? l.editMedicine, style: AppText.headlineMd),
                const SizedBox(height: Space.md),
                _Label(l.drugNameLabel, required: true),
                TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  style: AppText.bodyLg,
                  decoration: InputDecoration(hintText: l.drugNameHint),
                  validator: (v) => (v ?? '').trim().isEmpty ? l.requiredField : null,
                ),
                const SizedBox(height: Space.md),
                _Label(l.strengthLabel, required: true),
                TextFormField(
                  controller: _strength,
                  style: AppText.bodyLg.copyWith(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(hintText: l.strengthHint),
                  validator: (v) => (v ?? '').trim().isEmpty ? l.requiredField : null,
                ),
                const SizedBox(height: Space.md),
                _Label(l.doseFormLabel),
                Wrap(
                  spacing: Space.sm,
                  runSpacing: Space.sm,
                  children: [
                    for (final f in DoseForm.values)
                      ChoiceChip(
                        selected: f == _form,
                        showCheckmark: false,
                        avatar: Icon(formIcon(f), size: 16, color: f == _form ? AppColors.onPrimary : AppColors.primary),
                        label: Text(l.doseForm(f)),
                        labelStyle: AppText.labelMd.copyWith(color: f == _form ? AppColors.onPrimary : AppColors.onSurface),
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.surfaceContainerLow,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                        onSelected: (_) => setState(() => _form = f),
                      ),
                  ],
                ),
                const SizedBox(height: Space.lg),
                AppButton(label: l.saveContinue, icon: Symbols.check, onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, {this.required = false});
  final String text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(child: Text(text, style: AppText.labelMd)),
          if (required) Text(context.l10n.required, style: AppText.labelSm.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}
