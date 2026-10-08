import '../models/enums.dart';

/// Symptom keys used by side-effect watchlists and symptom logs. Each has a
/// localized label (`symptom_<key>` in the ARB files).
const symptomKeys = [
  'nausea',
  'dizziness',
  'dryCough',
  'fatigue',
  'headache',
  'swelling',
  'musclePain',
  'diarrhea',
  'lowSugar',
  'rash',
  'stomachPain',
];

class DrugInteraction {
  const DrugInteraction(this.withGeneric, this.note, {this.severe = false});
  final String withGeneric;
  final String note;
  final bool severe;
}

class CatalogDrug {
  const CatalogDrug({
    required this.generic,
    required this.drugClass,
    required this.strengths,
    required this.form,
    this.brands = const [],
    this.frequency = Frequency.once,
    this.meal = MealRelation.any,
    this.sideEffects = const [],
    this.interactions = const [],
    this.dietWarning,
    this.missedDose =
        'Take it as soon as you remember. If it is almost time for the next dose, skip the missed one. Never take a double dose.',
    this.storage = 'Store at room temperature, away from moisture and direct sunlight.',
  });

  final String generic;
  final List<String> brands;
  final String drugClass;
  final List<String> strengths;
  final DoseForm form;
  final Frequency frequency;
  final MealRelation meal;
  final List<String> sideEffects;
  final List<DrugInteraction> interactions;
  final String? dietWarning;
  final String missedDose;
  final String storage;

  Iterable<String> get searchTerms => [generic, ...brands].map((e) => e.toLowerCase());
}

/// A small offline reference of medicines commonly prescribed for chronic care
/// in Nigeria. Guidance is general patient information, not a substitute for a
/// pharmacist; clinical text should be reviewed by a licensed pharmacist before
/// release.
const drugCatalog = <CatalogDrug>[
  CatalogDrug(
    generic: 'Metformin',
    brands: ['Glucophage', 'Metformin HCl'],
    drugClass: 'Anti-diabetic (biguanide)',
    strengths: ['500mg', '850mg', '1000mg'],
    form: DoseForm.tablet,
    frequency: Frequency.twice,
    meal: MealRelation.withMeal,
    sideEffects: ['nausea', 'diarrhea', 'stomachPain', 'fatigue'],
    dietWarning:
        'Avoid excess alcohol. Take with food to reduce stomach upset and the rare risk of lactic acidosis.',
  ),
  CatalogDrug(
    generic: 'Glibenclamide',
    brands: ['Daonil'],
    drugClass: 'Anti-diabetic (sulfonylurea)',
    strengths: ['2.5mg', '5mg'],
    form: DoseForm.tablet,
    meal: MealRelation.withMeal,
    sideEffects: ['lowSugar', 'dizziness', 'nausea'],
    dietWarning: 'Do not skip meals after taking. Alcohol increases the risk of low blood sugar.',
  ),
  CatalogDrug(
    generic: 'Glimepiride',
    brands: ['Amaryl'],
    drugClass: 'Anti-diabetic (sulfonylurea)',
    strengths: ['1mg', '2mg', '4mg'],
    form: DoseForm.tablet,
    meal: MealRelation.withMeal,
    sideEffects: ['lowSugar', 'dizziness'],
    dietWarning: 'Take with breakfast. Do not skip meals.',
  ),
  CatalogDrug(
    generic: 'Amlodipine',
    brands: ['Norvasc', 'Amlovar'],
    drugClass: 'Antihypertensive (calcium channel blocker)',
    strengths: ['5mg', '10mg'],
    form: DoseForm.tablet,
    sideEffects: ['swelling', 'headache', 'dizziness', 'fatigue'],
    interactions: [
      DrugInteraction('Simvastatin', 'Keep simvastatin at 20mg or less a day with amlodipine (muscle pain risk).'),
    ],
  ),
  CatalogDrug(
    generic: 'Lisinopril',
    brands: ['Zestril', 'Prinivil'],
    drugClass: 'Antihypertensive (ACE inhibitor)',
    strengths: ['5mg', '10mg', '20mg'],
    form: DoseForm.tablet,
    sideEffects: ['dryCough', 'dizziness', 'headache', 'fatigue'],
    interactions: [
      DrugInteraction('Spironolactone', 'Can raise potassium to unsafe levels.', severe: true),
      DrugInteraction('Ibuprofen', 'Pain killers like ibuprofen can weaken the effect and strain the kidneys.'),
      DrugInteraction('Diclofenac', 'Pain killers like diclofenac can weaken the effect and strain the kidneys.'),
    ],
    dietWarning: 'Avoid potassium salt substitutes unless your doctor approves.',
  ),
  CatalogDrug(
    generic: 'Losartan',
    brands: ['Cozaar'],
    drugClass: 'Antihypertensive (ARB)',
    strengths: ['25mg', '50mg', '100mg'],
    form: DoseForm.tablet,
    sideEffects: ['dizziness', 'fatigue'],
    interactions: [
      DrugInteraction('Spironolactone', 'Can raise potassium to unsafe levels.', severe: true),
      DrugInteraction('Ibuprofen', 'Pain killers like ibuprofen can weaken the effect and strain the kidneys.'),
    ],
  ),
  CatalogDrug(
    generic: 'Nifedipine',
    brands: ['Adalat'],
    drugClass: 'Antihypertensive (calcium channel blocker)',
    strengths: ['20mg', '30mg'],
    form: DoseForm.tablet,
    frequency: Frequency.twice,
    sideEffects: ['swelling', 'headache', 'dizziness'],
    dietWarning: 'Avoid grapefruit juice.',
  ),
  CatalogDrug(
    generic: 'Hydrochlorothiazide',
    brands: ['HCTZ'],
    drugClass: 'Diuretic (thiazide)',
    strengths: ['12.5mg', '25mg'],
    form: DoseForm.tablet,
    sideEffects: ['dizziness', 'fatigue'],
    storage: 'Take in the morning so you are not woken at night to urinate.',
  ),
  CatalogDrug(
    generic: 'Spironolactone',
    brands: ['Aldactone'],
    drugClass: 'Diuretic (potassium-sparing)',
    strengths: ['25mg', '50mg'],
    form: DoseForm.tablet,
    meal: MealRelation.withMeal,
    sideEffects: ['dizziness', 'nausea'],
    interactions: [
      DrugInteraction('Lisinopril', 'Can raise potassium to unsafe levels.', severe: true),
      DrugInteraction('Losartan', 'Can raise potassium to unsafe levels.', severe: true),
    ],
  ),
  CatalogDrug(
    generic: 'Atorvastatin',
    brands: ['Lipitor'],
    drugClass: 'Cholesterol-lowering (statin)',
    strengths: ['10mg', '20mg', '40mg'],
    form: DoseForm.tablet,
    sideEffects: ['musclePain', 'headache', 'diarrhea'],
    interactions: [
      DrugInteraction('Clarithromycin', 'Raises statin levels and the risk of muscle damage.', severe: true),
    ],
    dietWarning: 'Avoid large amounts of grapefruit juice.',
  ),
  CatalogDrug(
    generic: 'Simvastatin',
    brands: ['Zocor'],
    drugClass: 'Cholesterol-lowering (statin)',
    strengths: ['10mg', '20mg', '40mg'],
    form: DoseForm.tablet,
    sideEffects: ['musclePain', 'headache'],
    interactions: [
      DrugInteraction('Amlodipine', 'Keep simvastatin at 20mg or less a day with amlodipine (muscle pain risk).'),
      DrugInteraction('Clarithromycin', 'Do not combine: high risk of muscle damage.', severe: true),
    ],
    storage: 'Usually taken in the evening.',
  ),
  CatalogDrug(
    generic: 'Aspirin',
    brands: ['Cardiprin', 'Aspirin Low Dose'],
    drugClass: 'Antiplatelet',
    strengths: ['75mg', '81mg'],
    form: DoseForm.tablet,
    meal: MealRelation.afterFood,
    sideEffects: ['stomachPain', 'nausea'],
    interactions: [
      DrugInteraction('Warfarin', 'Greatly increases bleeding risk.', severe: true),
      DrugInteraction('Ibuprofen', 'Raises stomach bleeding risk and may block aspirin\'s heart protection.'),
    ],
  ),
  CatalogDrug(
    generic: 'Warfarin',
    brands: ['Coumadin'],
    drugClass: 'Anticoagulant',
    strengths: ['1mg', '2mg', '5mg'],
    form: DoseForm.tablet,
    sideEffects: ['rash'],
    interactions: [
      DrugInteraction('Aspirin', 'Greatly increases bleeding risk.', severe: true),
      DrugInteraction('Ibuprofen', 'Greatly increases bleeding risk.', severe: true),
      DrugInteraction('Diclofenac', 'Greatly increases bleeding risk.', severe: true),
    ],
    dietWarning: 'Keep leafy green vegetable intake steady. Avoid alcohol binges.',
  ),
  CatalogDrug(
    generic: 'Paracetamol',
    brands: ['Panadol', 'Emzor Paracetamol', 'Acetaminophen'],
    drugClass: 'Pain reliever / fever reducer',
    strengths: ['500mg', '1000mg'],
    form: DoseForm.caplet,
    frequency: Frequency.prn,
    sideEffects: ['rash'],
    dietWarning: 'Do not take more than 4g in 24 hours. Avoid alcohol.',
  ),
  CatalogDrug(
    generic: 'Ibuprofen',
    brands: ['Brufen', 'Advil'],
    drugClass: 'Pain reliever (NSAID)',
    strengths: ['200mg', '400mg'],
    form: DoseForm.tablet,
    frequency: Frequency.prn,
    meal: MealRelation.afterFood,
    sideEffects: ['stomachPain', 'nausea'],
    interactions: [
      DrugInteraction('Lisinopril', 'Can weaken blood pressure control and strain the kidneys.'),
      DrugInteraction('Losartan', 'Can weaken blood pressure control and strain the kidneys.'),
      DrugInteraction('Warfarin', 'Greatly increases bleeding risk.', severe: true),
      DrugInteraction('Aspirin', 'Raises stomach bleeding risk.'),
    ],
  ),
  CatalogDrug(
    generic: 'Diclofenac',
    brands: ['Voltaren', 'Cataflam'],
    drugClass: 'Pain reliever (NSAID)',
    strengths: ['50mg', '75mg'],
    form: DoseForm.tablet,
    frequency: Frequency.prn,
    meal: MealRelation.afterFood,
    sideEffects: ['stomachPain', 'nausea', 'dizziness'],
    interactions: [
      DrugInteraction('Lisinopril', 'Can weaken blood pressure control and strain the kidneys.'),
      DrugInteraction('Warfarin', 'Greatly increases bleeding risk.', severe: true),
    ],
  ),
  CatalogDrug(
    generic: 'Omeprazole',
    brands: ['Losec', 'Prilosec'],
    drugClass: 'Stomach acid reducer (PPI)',
    strengths: ['20mg', '40mg'],
    form: DoseForm.capsule,
    meal: MealRelation.beforeFood,
    sideEffects: ['headache', 'diarrhea', 'stomachPain'],
    storage: 'Swallow whole 30 minutes before breakfast.',
  ),
  CatalogDrug(
    generic: 'Artemether/Lumefantrine',
    brands: ['Coartem', 'Lonart', 'Amatem'],
    drugClass: 'Antimalarial (ACT)',
    strengths: ['20/120mg', '80/480mg'],
    form: DoseForm.tablet,
    frequency: Frequency.twice,
    meal: MealRelation.withMeal,
    sideEffects: ['headache', 'dizziness', 'fatigue', 'nausea'],
    dietWarning: 'Take with fatty food or milk so the medicine is absorbed. Finish the full 3-day course.',
  ),
  CatalogDrug(
    generic: 'Clarithromycin',
    brands: ['Klacid'],
    drugClass: 'Antibiotic (macrolide)',
    strengths: ['250mg', '500mg'],
    form: DoseForm.tablet,
    frequency: Frequency.twice,
    sideEffects: ['nausea', 'diarrhea', 'stomachPain'],
    interactions: [
      DrugInteraction('Atorvastatin', 'Raises statin levels and the risk of muscle damage.', severe: true),
      DrugInteraction('Simvastatin', 'Do not combine: high risk of muscle damage.', severe: true),
    ],
  ),
  CatalogDrug(
    generic: 'Amoxicillin',
    brands: ['Amoxil'],
    drugClass: 'Antibiotic (penicillin)',
    strengths: ['250mg', '500mg'],
    form: DoseForm.capsule,
    frequency: Frequency.thrice,
    sideEffects: ['diarrhea', 'rash', 'nausea'],
    dietWarning: 'Finish the full course even if you feel better.',
  ),
  CatalogDrug(
    generic: 'Folic Acid',
    drugClass: 'Vitamin supplement',
    strengths: ['5mg'],
    form: DoseForm.tablet,
  ),
  CatalogDrug(
    generic: 'Vitamin C & Zinc',
    drugClass: 'Vitamin supplement',
    strengths: ['1 tab'],
    form: DoseForm.tablet,
    meal: MealRelation.afterFood,
  ),
];

CatalogDrug? findCatalogDrug(String name) {
  final q = name.toLowerCase().trim();
  if (q.isEmpty) return null;
  for (final d in drugCatalog) {
    if (d.searchTerms.any((t) => t == q || q.startsWith(t) || q.contains(t))) return d;
  }
  return null;
}

List<CatalogDrug> searchCatalog(String query) {
  final q = query.toLowerCase().trim();
  if (q.isEmpty) return drugCatalog;
  return drugCatalog.where((d) => d.searchTerms.any((t) => t.contains(q))).toList();
}

/// Interactions between [generic] and any of the [others] currently taken.
List<({String other, DrugInteraction interaction})> interactionsFor(
  String generic,
  Iterable<String> others,
) {
  final me = findCatalogDrug(generic);
  final result = <({String other, DrugInteraction interaction})>[];
  for (final o in others) {
    final od = findCatalogDrug(o);
    if (od == null || me == null || od.generic == me.generic) continue;
    final hit = me.interactions.where((i) => i.withGeneric == od.generic).firstOrNull ??
        od.interactions.where((i) => i.withGeneric == me.generic).firstOrNull;
    if (hit != null) result.add((other: o, interaction: hit));
  }
  return result;
}

final _strengthRe = RegExp(
  r'(\d+(?:[.,]\d+)?(?:\s*/\s*\d+(?:[.,]\d+)?)?)\s*(mg|mcg|µg|g|ml|iu)\b',
  caseSensitive: false,
);

/// Best-effort extraction of a known drug and strength from free text
/// (OCR output from a pill box / prescription, or a voice transcript).
({CatalogDrug? drug, String? name, String? strength}) parseMedicationText(String text) {
  final lower = text.toLowerCase();
  CatalogDrug? match;
  var bestIndex = 1 << 30;
  for (final d in drugCatalog) {
    for (final t in d.searchTerms) {
      final i = lower.indexOf(t);
      if (i >= 0 && i < bestIndex) {
        bestIndex = i;
        match = d;
      }
    }
  }
  String? strength;
  final sm = _strengthRe.firstMatch(text);
  if (sm != null) {
    strength = '${sm.group(1)!.replaceAll(' ', '').replaceAll(',', '.')}${sm.group(2)!.toLowerCase()}';
  }
  String? name = match?.generic;
  if (name == null) {
    // Fall back to the first capitalised word that looks like a drug name.
    final word = RegExp(r'\b([A-Z][a-zA-Z]{4,})\b').firstMatch(text);
    name = word?.group(1);
  }
  return (drug: match, name: name, strength: strength ?? match?.strengths.first);
}
