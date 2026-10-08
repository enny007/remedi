import 'package:flutter_test/flutter_test.dart';
import 'package:remedi/data/catalog/drug_catalog.dart';
import 'package:remedi/features/health/vital_widgets.dart';

void main() {
  group('parseMedicationText', () {
    test('finds a generic name and strength in OCR text', () {
      final r = parseMedicationText('LAGOON HOSPITAL\nRx: Metformin HCl 500 mg tabs\n1 bd with meals');
      expect(r.drug?.generic, 'Metformin');
      expect(r.strength, '500mg');
    });

    test('maps a brand name to its generic', () {
      final r = parseMedicationText('Panadol Extra 500mg');
      expect(r.drug?.generic, 'Paracetamol');
    });

    test('handles combination strengths', () {
      final r = parseMedicationText('Coartem 80/480 mg');
      expect(r.drug?.generic, 'Artemether/Lumefantrine');
      expect(r.strength, '80/480mg');
    });

    test('falls back to a capitalised word for unknown drugs', () {
      final r = parseMedicationText('Take Zinnatab 250mg twice');
      expect(r.drug, isNull);
      expect(r.name, 'Zinnatab');
      expect(r.strength, '250mg');
    });
  });

  test('interaction lookup is symmetric', () {
    expect(interactionsFor('Lisinopril', ['Spironolactone']).single.interaction.severe, isTrue);
    expect(interactionsFor('Spironolactone', ['Lisinopril']), hasLength(1));
    expect(interactionsFor('Metformin', ['Amlodipine']), isEmpty);
  });

  test('blood pressure categories', () {
    expect(classifyBp(115, 75), BpCategory.normal);
    expect(classifyBp(125, 78), BpCategory.elevated);
    expect(classifyBp(128, 84), BpCategory.stage1);
    expect(classifyBp(145, 85), BpCategory.stage2);
    expect(classifyBp(185, 100), BpCategory.crisis);
  });
}
