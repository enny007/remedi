// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Remedi';

  @override
  String get notifChannelDoses => 'Medication alarms';

  @override
  String get notifChannelDosesDesc => 'Loud reminders when a dose is due';

  @override
  String get notifChannelCare => 'Care alerts';

  @override
  String get notifChannelCareDesc => 'Caregiver fail-safe and refill warnings';

  @override
  String get notifDoseTitle => 'Time for your medicine';

  @override
  String get notifSnoozeTitle => 'Snoozed reminder';

  @override
  String notifDoseBody(String medication, String amount) {
    return '$medication • take $amount';
  }

  @override
  String get notifCaregiverTitle => 'Dose not confirmed';

  @override
  String notifCaregiverBody(String medication, String caregiver) {
    return '$medication is still unconfirmed. Tap to alert $caregiver by SMS.';
  }

  @override
  String get notifRefillTitle => 'Refill needed soon';

  @override
  String notifRefillBody(String count, String medication) {
    return 'Only $count of $medication left.';
  }

  @override
  String get actionMarkTaken => 'Mark as taken';

  @override
  String get actionSnooze15 => 'Snooze 15m';

  @override
  String get offlineReady => 'Offline Ready';

  @override
  String get offline => 'Offline';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get chooseLanguage => 'Choose your language';

  @override
  String get chooseLanguageHint =>
      'Reminders, alarms and instructions will use this language, even offline.';

  @override
  String get profileTitle => 'Profile & Settings';

  @override
  String get formTablet => 'Tablet';

  @override
  String get formCapsule => 'Capsule';

  @override
  String get formCaplet => 'Caplet';

  @override
  String get formSoftgel => 'Softgel';

  @override
  String get formLiquid => 'Liquid / Syrup';

  @override
  String get formDrops => 'Drops';

  @override
  String get formInjection => 'Injection';

  @override
  String get formInhaler => 'Inhaler';

  @override
  String get formCream => 'Cream / Ointment';

  @override
  String get formSachet => 'Sachet';

  @override
  String get unitMl => 'ml';

  @override
  String get unitDrops => 'drops';

  @override
  String get unitInjection => 'injection';

  @override
  String get unitPuffs => 'puffs';

  @override
  String get unitApplication => 'application';

  @override
  String get unitSachet => 'sachet';

  @override
  String get unitPills => 'pills';

  @override
  String get freqOnce => 'Once daily';

  @override
  String get freqTwice => 'Twice daily';

  @override
  String get freqThrice => '3 times daily';

  @override
  String get freqPrn => 'As needed';

  @override
  String get freqOnceHint => 'Morning focus';

  @override
  String get freqTwiceHint => 'Every 12 hours';

  @override
  String get freqThriceHint => 'With meals';

  @override
  String get freqPrnHint => 'For sudden flares';

  @override
  String get mealWith => 'With meal';

  @override
  String get mealBefore => 'Before food';

  @override
  String get mealAfter => 'After food';

  @override
  String get mealEmpty => 'Empty stomach';

  @override
  String get mealWater => 'With water only';

  @override
  String get mealAny => 'No food rule';

  @override
  String get mealWithHint => 'During or right after';

  @override
  String get mealBeforeHint => '30 min prior';

  @override
  String get mealAfterHint => 'Within 1 hour';

  @override
  String get mealEmptyHint => 'Full glass of water';

  @override
  String get mealWaterHint => 'Any time, with water';

  @override
  String get mealAnyHint => 'Food does not matter';

  @override
  String get skipStomach => 'Stomach upset, nausea or vomiting';

  @override
  String get skipStock => 'Medication out of stock or misplaced';

  @override
  String get skipDoctor => 'Instructed by my doctor to hold';

  @override
  String get skipOther => 'Another reason';

  @override
  String get slotBreakfast => 'Breakfast';

  @override
  String get slotLunch => 'Lunch';

  @override
  String get slotDinner => 'Dinner';

  @override
  String get slotBedtime => 'Bedtime';

  @override
  String get slotCustom => 'Reminder';

  @override
  String get symptomNausea => 'Nausea';

  @override
  String get symptomDizziness => 'Dizziness';

  @override
  String get symptomDryCough => 'Dry cough';

  @override
  String get symptomFatigue => 'Fatigue';

  @override
  String get symptomHeadache => 'Headache';

  @override
  String get symptomSwelling => 'Ankle swelling';

  @override
  String get symptomMusclePain => 'Muscle pain';

  @override
  String get symptomDiarrhea => 'Diarrhoea';

  @override
  String get symptomLowSugar => 'Low sugar (shaky, sweaty)';

  @override
  String get symptomRash => 'Skin rash';

  @override
  String get symptomStomachPain => 'Stomach pain';

  @override
  String get partMorning => 'Morning';

  @override
  String get partAfternoon => 'Afternoon';

  @override
  String get partEvening => 'Evening';

  @override
  String get partNight => 'Night';

  @override
  String get navSchedule => 'Schedule';

  @override
  String get navFastLog => 'Fast Log';

  @override
  String get navMyMeds => 'My Meds';

  @override
  String get navHealth => 'Health';

  @override
  String toastDoseLogged(String medication) {
    return '$medication logged as taken.';
  }

  @override
  String toastSnoozedUntil(String time) {
    return 'Snoozed. We\'ll ring again at $time.';
  }

  @override
  String get snoozeLimitReached =>
      'Snooze limit reached. Please take or skip this dose.';

  @override
  String get sosTitle => 'Emergency Alert';

  @override
  String get sosNoCaregiver =>
      'You have not added a caregiver yet. Add someone we can text or call for you in an emergency.';

  @override
  String get addCaregiver => 'Add a caregiver';

  @override
  String sosBody(String name) {
    return 'Send an SMS or call $name. SMS works without mobile data.';
  }

  @override
  String sosMessage(String patient) {
    return 'URGENT from Remedi: $patient needs help. Please call or check on them now.';
  }

  @override
  String sosDoseMessage(String patient, String medication, String time) {
    return 'Remedi alert: $patient has not confirmed $medication due at $time. Please check on them.';
  }

  @override
  String sosSendSms(String name) {
    return 'Send SMS to $name';
  }

  @override
  String sosCall(String name) {
    return 'Call $name';
  }

  @override
  String get skipTitle => 'Select Clinical Skip Reason';

  @override
  String get skipAuditNote =>
      'All skipped doses are recorded in your offline log for your doctor\'s medication review.';

  @override
  String skipAuditNoteDoctor(String doctor) {
    return 'All skipped doses are recorded in your offline log for $doctor\'s medication review.';
  }

  @override
  String get confirmSkip => 'Confirm Recorded Skip';

  @override
  String get skipRecorded => 'Skip recorded in your offline log.';

  @override
  String get logSymptomTitle => 'How are you feeling?';

  @override
  String get logSymptomHint =>
      'Pick what you noticed. It will be shared in your doctor visit summary.';

  @override
  String symptomLogged(String symptom) {
    return '$symptom recorded.';
  }

  @override
  String goodMorning(String name) {
    return 'Good morning, $name';
  }

  @override
  String goodAfternoon(String name) {
    return 'Good afternoon, $name';
  }

  @override
  String goodEvening(String name) {
    return 'Good evening, $name';
  }

  @override
  String get emptyScheduleTitle => 'No medicines yet';

  @override
  String get emptyScheduleBody =>
      'Add your first medicine and Remedi will ring on time, even with no network.';

  @override
  String get addMedicine => 'Add Medicine';

  @override
  String get laterToday => 'Later Today';

  @override
  String dosesPending(String count) {
    return '$count pending';
  }

  @override
  String get sosButton => 'Emergency SOS / Alert Caregiver (SMS)';

  @override
  String get moodAllDone => 'All done!';

  @override
  String get moodGood => 'Feeling good!';

  @override
  String get moodStart => 'Let\'s begin.';

  @override
  String get noDosesToday => 'No scheduled doses today.';

  @override
  String dosesDoneOf(String done, String total) {
    return '$done of $total doses done today.';
  }

  @override
  String snoozedUntil(String time) {
    return 'Snoozed until $time';
  }

  @override
  String overdueBy(String minutes) {
    return 'Overdue by $minutes min';
  }

  @override
  String get dueNow => 'Due now';

  @override
  String dueInMinutes(String minutes) {
    return 'Due in $minutes mins';
  }

  @override
  String dueAt(String time) {
    return 'Due at $time';
  }

  @override
  String get upNext => 'Up Next';

  @override
  String get undo => 'Undo';

  @override
  String routineOf(String slot) {
    return '$slot routine';
  }

  @override
  String get fullGlassWater => 'Full glass of water';

  @override
  String get markAsTaken => 'Mark as Taken';

  @override
  String get snooze15 => 'Snooze 15m';

  @override
  String get noSnoozesLeft => 'No snoozes left';

  @override
  String get skipOrSideEffect => 'Side effect / Skip';

  @override
  String get allDoneTitle => 'All doses done today';

  @override
  String get allDoneBody => 'Well done. Consistency protects your health.';

  @override
  String get completedEarlier => 'Completed Earlier';

  @override
  String takenCount(String count) {
    return '$count taken';
  }

  @override
  String get statusDone => 'Done';

  @override
  String get statusSkipped => 'Skipped';

  @override
  String get statusMissed => 'Missed';

  @override
  String get tookItLate => 'I took it';

  @override
  String get doctorDirective => 'Doctor\'s Clinical Directive';

  @override
  String forMedication(String medication) {
    return 'For $medication';
  }

  @override
  String get viewDetails => 'View details';

  @override
  String get asNeededMeds => 'As-needed medicines';

  @override
  String tookPrn(String medication) {
    return 'Took $medication';
  }

  @override
  String get alarmAlert => 'Alarm Alert';

  @override
  String get doseNotFound => 'Dose not found';

  @override
  String get doseNotFoundBody =>
      'This reminder may have been changed or removed.';

  @override
  String get scheduledDose => 'Scheduled Dose';

  @override
  String doseXofY(String index, String total) {
    return 'Dose $index of $total today';
  }

  @override
  String get prescribedFor => 'Prescribed for:';

  @override
  String get routeOral => 'Oral';

  @override
  String get criticalDirective => 'Critical Clinical Directive';

  @override
  String get directiveWithMeal => 'Take with your meal or right after eating';

  @override
  String get directiveAfterFood => 'Take within 1 hour after food';

  @override
  String get directiveBeforeFood => 'Take 30 minutes before food';

  @override
  String get directiveEmpty =>
      'Take on an empty stomach with a full glass of water';

  @override
  String get directiveWater => 'Take with plenty of clean water';

  @override
  String get accountabilityTitle => 'Accountability Confirmation';

  @override
  String get accountabilityBody =>
      'Confirm you have actually taken it before completing this dose.';

  @override
  String confirmSwallowed(String units) {
    return 'I have swallowed $units with a full cup of water';
  }

  @override
  String confirmApplied(String units) {
    return 'I have applied $units';
  }

  @override
  String confirmInjected(String units) {
    return 'I have taken $units';
  }

  @override
  String confirmInhaled(String units) {
    return 'I have taken $units from my inhaler';
  }

  @override
  String get preventsEscalation => 'Stops the caregiver alert for this dose';

  @override
  String get iHaveTakenThisDose => 'I Have Taken This Dose';

  @override
  String snoozeWithRemaining(String count) {
    return 'Snooze 15 Minutes ($count left after this)';
  }

  @override
  String get skipDoseRequiresReason => 'Skip Dose (requires a clinical reason)';

  @override
  String get overdueAlarm => 'Overdue dose';

  @override
  String get urgentAlarm => 'Urgent alarm';

  @override
  String get offlineVerified => 'Offline verified • works without network';

  @override
  String get ringing => 'Ringing';

  @override
  String get alreadyTaken => 'This dose is logged as taken';

  @override
  String get alreadySkipped => 'This dose was skipped';

  @override
  String loggedAt(String time) {
    return 'Logged at $time';
  }

  @override
  String get caregiverSetupPrompt =>
      'Add a caregiver so someone can be alerted if you miss a dose.';

  @override
  String get caregiverFailSafe => 'Caregiver Fail-Safe';

  @override
  String minutesQueue(String minutes) {
    return '${minutes}m queue';
  }

  @override
  String caregiverFailSafeBody(String time) {
    return 'If not confirmed by $time, Remedi will prompt you to send an offline SMS alert to:';
  }

  @override
  String get caregiverAlertsOff =>
      'Caregiver alerts are turned off. You can still text them:';

  @override
  String get cameraUnavailable => 'Camera is not available on this device.';

  @override
  String get analyzingPrescription => 'Reading text on your device…';

  @override
  String scanFound(String medication) {
    return 'Found $medication. Check the details below.';
  }

  @override
  String get scanNotRecognized =>
      'We couldn\'t recognise the medicine. Please confirm the name.';

  @override
  String get confirmMedicine => 'Confirm medicine';

  @override
  String get instantIntake => 'Instant Intake';

  @override
  String get addNewMedicine => 'Add New Medicine';

  @override
  String get addNewMedicineHint =>
      'Snap your prescription sheet, scan the pill box, or tell us the name.';

  @override
  String get smartScan => 'Smart Instant Scan';

  @override
  String get works100Offline => 'Works 100% Offline';

  @override
  String get onDeviceOcr => 'On-device';

  @override
  String get snapAutoFill => 'Snap & Auto-Fill';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get voiceNote => 'Voice Note';

  @override
  String get voiceNoteHint => 'Say the medicine name and strength';

  @override
  String get tapToSpeak => 'Tap to speak';

  @override
  String get typeName => 'Type Name';

  @override
  String get typeNameHint => 'Search brand or generic name';

  @override
  String get manualEntry => 'Manual entry';

  @override
  String get quickPick => 'Quick Pick Common Medicines';

  @override
  String get oneTapAdd => '1-Tap Add';

  @override
  String get readingText => 'Reading…';

  @override
  String get lensReady => 'Lens Ready';

  @override
  String get aimInsideBox => 'Aim inside box';

  @override
  String get aimHint =>
      'Aim at pill box, blister pack, or doctor\'s paper script';

  @override
  String get searchMedicineHint => 'e.g. Metformin, Panadol, Amlodipine';

  @override
  String useCustomMedicine(String name) {
    return 'Add \"$name\"';
  }

  @override
  String get useCustomMedicineHint =>
      'Not in the list? Add it with your own details.';

  @override
  String get voiceSheetHint =>
      'For example: \"Metformin five hundred milligrams\".';

  @override
  String get voiceUnavailable =>
      'Speech recognition is not available. Please type the name instead.';

  @override
  String get listening => 'Listening…';

  @override
  String get tapMicToSpeak => 'Tap the microphone and speak.';

  @override
  String useThisMedicine(String medication) {
    return 'Use $medication';
  }

  @override
  String get editMedicine => 'Edit medicine';

  @override
  String get drugNameLabel => 'Medicine name';

  @override
  String get drugNameHint => 'Brand or generic name';

  @override
  String get strengthLabel => 'Strength & unit';

  @override
  String get strengthHint => 'e.g. 500mg, 5ml';

  @override
  String get doseFormLabel => 'Dose form';

  @override
  String get requiredField => 'This is required';

  @override
  String get required => 'Required';

  @override
  String get saveContinue => 'Save & continue';

  @override
  String get addAtLeastOneTime => 'Add at least one reminder time.';

  @override
  String remindersSet(String medication) {
    return 'Reminders set for $medication.';
  }

  @override
  String get changesSaved => 'Changes saved.';

  @override
  String get editRoutine => 'Edit Routine';

  @override
  String get stepScheduleFood => 'Step 1 of 2 • Schedule & Food';

  @override
  String get unnamedMedicine => 'Unnamed medicine';

  @override
  String get edit => 'Edit';

  @override
  String get howOften => '1. How often do you take it?';

  @override
  String get tapToSelect => 'Tap to select';

  @override
  String get foodRoutine => '2. Food Routine';

  @override
  String get preventsNausea => 'Prevents nausea';

  @override
  String get prnNoReminders =>
      'As-needed medicines have no alarms. Log each dose from the Schedule tab when you take it.';

  @override
  String get reminderTimes => '3. Reminder Times';

  @override
  String get basedOnRoutine => 'Based on your routine';

  @override
  String get addReminderTime => 'Add reminder time';

  @override
  String get offlineAlarmsTitle => 'Offline Alarms';

  @override
  String get offlineAlarmsBody =>
      'Alerts ring reliably even without cell reception or internet connection.';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get saveSetReminders => 'Save & Set Reminders';

  @override
  String get moreClinicalDetails => 'More clinical details';

  @override
  String get moreClinicalDetailsHint => '(optional doctor notes, refills)';

  @override
  String doseSlotLabel(String number, String slot) {
    return 'Dose $number • $slot';
  }

  @override
  String get adjustTime => 'Adjust time';

  @override
  String get doseAmount => 'Dose amount';

  @override
  String get removeTime => 'Remove time';

  @override
  String get nameStrengthRequired => 'Medicine name and strength are required.';

  @override
  String get clinicalDetails => 'Clinical Details';

  @override
  String get safeIntakeProtocol => 'Safe Offline Intake Protocol';

  @override
  String get clinicalDetailsTitle => 'Ailment & Prescription Details';

  @override
  String clinicalDetailsStep(String medication) {
    return 'Step 2 of 2: Clinical context for $medication';
  }

  @override
  String get whyExtraTime => 'Why this takes extra time';

  @override
  String get whyExtraTimeBody =>
      'Entering exact diagnoses, doctor instructions and supply details makes your offline alarms, refill warnings and doctor summary accurate, even with zero network signal.';

  @override
  String get diagnosedContext => 'Diagnosed Ailment Context';

  @override
  String get conditionLabel => 'Diagnosed condition';

  @override
  String get conditionHint => 'e.g. Hypertension, Type 2 Diabetes';

  @override
  String get facilityLabel => 'Hospital / Facility';

  @override
  String get facilityHint => 'e.g. Lagoon Hospital, Ikoyi';

  @override
  String get prescriberLabel => 'Prescribing doctor';

  @override
  String get prescriberHint => 'e.g. Dr. Adeleke';

  @override
  String get specialtyLabel => 'Specialty';

  @override
  String get specialtyHint => 'e.g. Cardiology';

  @override
  String get doctorPhoneLabel => 'Doctor / clinic phone';

  @override
  String get prescriptionDetails => 'Prescription Details';

  @override
  String get doctorInstructionsLabel => 'Doctor\'s instructions';

  @override
  String get doctorInstructionsHint =>
      'e.g. Drink 2 full glasses of water with it';

  @override
  String get pillDescriptionLabel => 'What the pill looks like';

  @override
  String get pillDescriptionHint => 'e.g. White oblong tablet marked \'M 500\'';

  @override
  String get rxNumberLabel => 'Prescription number';

  @override
  String get prescriptionBackup => 'Prescription Paper Backup';

  @override
  String get noPrescriptionPhoto => 'No photo yet';

  @override
  String get prescriptionSaved => 'Prescription photo saved';

  @override
  String get storedOnDevice => 'Stored only on this phone';

  @override
  String get attachPhoto => 'Attach photo';

  @override
  String get supplyTracking => 'Supply & Refill Tracking';

  @override
  String stockLabel(String unit) {
    return '$unit in stock';
  }

  @override
  String get refillAlertAt => 'Refill alert at';

  @override
  String get refillExplainer =>
      'Remedi counts down with every dose you log and warns you offline when supply runs low.';

  @override
  String get sideEffectWatchlist => 'Known Side Effects Watchlist';

  @override
  String sideEffectWatchlistHint(String medication) {
    return 'Select symptoms your doctor flagged for $medication. You can log them from your health journal.';
  }

  @override
  String get encryptedLocal => 'Saved only in your phone\'s private storage';

  @override
  String get saveMedicineSetReminders => 'Save Medicine & Set Reminders';

  @override
  String get backToRoutine => 'Back to Schedule & Food';

  @override
  String get medicineCabinet => 'Medicine Cabinet';

  @override
  String activeCount(String count) {
    return '$count Active';
  }

  @override
  String get search => 'Search';

  @override
  String get cabinetHint =>
      'Your prescribed medicines, safe-use guides and refill trackers.';

  @override
  String get searchCabinet => 'Search your medicines';

  @override
  String filterAll(String count) {
    return 'All ($count)';
  }

  @override
  String get emptyCabinetTitle => 'Your cabinet is empty';

  @override
  String get noMedsInCategory => 'No medicines in this category';

  @override
  String get noMedsInCategoryBody =>
      'Tap \'All\' to view your list or add a medicine for this time of day.';

  @override
  String get offlineSynchronized => 'Saved Offline';

  @override
  String get offlineSynchronizedBody =>
      'Prescription safety cards are stored on your phone for review even without cell service.';

  @override
  String get supplyNotTracked => 'Stock not tracked';

  @override
  String get lowSupply => 'Low supply';

  @override
  String daysLeft(String days) {
    return '$days days left';
  }

  @override
  String get goodSupply => 'Good supply';

  @override
  String get savedOnDevice => 'Saved on this device';

  @override
  String get details => 'Details';

  @override
  String refillMessage(String medication, String rx, String patient) {
    return 'Hello, I would like a refill of $medication$rx for $patient. Thank you.';
  }

  @override
  String refillSubject(String medication) {
    return 'Refill request: $medication';
  }

  @override
  String get activeRx => 'Active Rx';

  @override
  String get supplyTracker => 'Supply Tracker';

  @override
  String daysRemaining(String days) {
    return '$days days remaining';
  }

  @override
  String refillBy(String date) {
    return 'Refill by $date';
  }

  @override
  String get prescriber => 'Prescriber';

  @override
  String get clinicalInstructions => 'Clinical Instructions';

  @override
  String get requestRefill => 'Request Pharmacy Refill';

  @override
  String get openFullDetails => 'Open full details';

  @override
  String get editMedicationDetails => 'Edit Medication Details';

  @override
  String get medicationDetail => 'Medication Detail';

  @override
  String get medicineNotFound => 'Medicine not found';

  @override
  String get updateStock => 'Update stock';

  @override
  String get updateStockHint =>
      'How many do you have now? Tap a refill amount to add it.';

  @override
  String get save => 'Save';

  @override
  String get stockUpdated => 'Stock updated.';

  @override
  String stopMedicineTitle(String medication) {
    return 'Stop $medication?';
  }

  @override
  String get stopMedicineBody =>
      'Reminders will stop. Your dose history is kept for your doctor\'s review. Only stop a medicine if your doctor told you to.';

  @override
  String get stopMedicine => 'Stop medicine';

  @override
  String medicineStopped(String medication) {
    return '$medication stopped. Reminders cancelled.';
  }

  @override
  String get backToCabinet => 'Back to Cabinet';

  @override
  String get encryptedLocalRecord => 'Private local record';

  @override
  String get remainingSupply => 'Remaining Supply';

  @override
  String get notTracked => 'Not tracked';

  @override
  String get pillIdentifier => 'Pill Identifier';

  @override
  String get seePrescriptionPhoto => 'See prescription photo';

  @override
  String get dosageRoutine => 'Dosage Routine';

  @override
  String perIntake(String units) {
    return '$units per intake';
  }

  @override
  String perDay(String amount) {
    return '$amount/day';
  }

  @override
  String get safetyInteractions => 'Safety & Interactions';

  @override
  String get offlineSafetyDb => 'Offline reference, no internet needed';

  @override
  String get notInReference => 'Not in the offline reference';

  @override
  String get noKnownClash => 'No known clash found';

  @override
  String get noOtherMeds => 'You have no other active medicines.';

  @override
  String checkedAgainst(String medications) {
    return 'Checked against: $medications';
  }

  @override
  String get checked => 'Checked';

  @override
  String interactionWith(String medication) {
    return 'Interaction with $medication';
  }

  @override
  String get askDoctor => 'Ask doctor';

  @override
  String get caution => 'Caution';

  @override
  String get dietWarning => 'Diet & Alcohol Warning';

  @override
  String get missedDoseTitle => 'What to do if a dose is missed?';

  @override
  String get missedDoseGeneric =>
      'Take it as soon as you remember. If it is almost time for the next dose, skip the missed one. Never take a double dose.';

  @override
  String get storageUse => 'Storage & use';

  @override
  String get referenceDisclaimer =>
      'General guidance only. Always follow your doctor or pharmacist.';

  @override
  String get prescriptionOrigin => 'Prescription Origin';

  @override
  String get prescriberUnknown => 'Prescriber not added';

  @override
  String get callClinic => 'Call clinic';

  @override
  String get add => 'Add';

  @override
  String get emergencyResponder => 'Emergency Responder';

  @override
  String get smsLinked => 'SMS Linked';

  @override
  String logDoseNow(String units) {
    return 'Log Dose Now ($units)';
  }

  @override
  String get refillSms => 'Offline Refill SMS';

  @override
  String get editRoutineBtn => 'Edit Routine';

  @override
  String get logSideEffect => 'Log side effect';

  @override
  String get bpNormal => 'Normal';

  @override
  String get bpElevated => 'Elevated';

  @override
  String get bpStage1 => 'High • Stage 1';

  @override
  String get bpStage2 => 'High • Stage 2';

  @override
  String get bpCrisis => 'Crisis level';

  @override
  String get bpCrisisAdvice =>
      'This reading is very high. Rest 5 minutes and re-check. If it stays high or you feel unwell, seek emergency care now.';

  @override
  String get enterBothValues => 'Enter both numbers.';

  @override
  String get enterValue => 'Enter a value.';

  @override
  String get valueLooksWrong =>
      'That value looks wrong. Please check and try again.';

  @override
  String get vitalSaved => 'Reading saved.';

  @override
  String get logVitalTitle => 'Log a reading';

  @override
  String get systolic => 'Top (systolic)';

  @override
  String get diastolic => 'Bottom (diastolic)';

  @override
  String get saveReading => 'Save reading';

  @override
  String get bloodPressure => 'Blood pressure';

  @override
  String get bloodSugar => 'Blood sugar';

  @override
  String get heartRate => 'Heart rate';

  @override
  String get weight => 'Weight';

  @override
  String get steps => 'Steps';

  @override
  String get myHealth => 'My Health';

  @override
  String get doctorVisitTitle => 'Doctor Visit Summary';

  @override
  String get doctorVisitBody =>
      'Take your full medicine and vitals log to your next appointment. No mobile data needed.';

  @override
  String get generateSummary => 'Generate Doctor Visit Summary (PDF / QR)';

  @override
  String get offlineDataVault => 'Offline Data Vault';

  @override
  String get localAndPrivate => 'Private & stored on this phone';

  @override
  String pendingCount(String count) {
    return '$count pending';
  }

  @override
  String vaultBody(String count) {
    return 'All medication and vitals logs are stored on this phone. $count changes are queued for cloud backup once it is enabled.';
  }

  @override
  String get attemptSync => 'Sync Now';

  @override
  String get cloudSyncNotConfigured =>
      'Cloud backup is not switched on yet. Your data is safe on this phone.';

  @override
  String get noDataYet => 'No data yet';

  @override
  String get excellent => 'Excellent';

  @override
  String get good => 'Good';

  @override
  String get needsAttention => 'Needs attention';

  @override
  String get adherence30 => '30-day adherence';

  @override
  String get target90 => 'target ≥90%';

  @override
  String get currentStreak => 'Current streak';

  @override
  String get days => 'days';

  @override
  String onTimeRate(String percent) {
    return '$percent% taken on time';
  }

  @override
  String get weeklyRoutine => 'Weekly Routine';

  @override
  String missedThisWeek(String count) {
    return '$count missed doses this week';
  }

  @override
  String get last7Days => 'Last 7 days';

  @override
  String get legendOnTime => 'On time';

  @override
  String get legendLate => 'Late';

  @override
  String get legendMissed => 'Missed / skipped';

  @override
  String get languageCardTitle => 'Language & Voice';

  @override
  String get languageCardBody =>
      'Reminders and alarms use your selected language, even when completely offline.';

  @override
  String get vitalsQuickLogger => 'Vitals Quick Logger';

  @override
  String get seeTrends => 'See trends';

  @override
  String get noVitalsYet =>
      'No readings yet. Log your blood pressure or sugar to track trends.';

  @override
  String get logBpOrSugar => 'Log Blood Pressure or Sugar';

  @override
  String get otherMedicines => 'Other medicines';

  @override
  String get activeConditions => 'Active Conditions & Regimens';

  @override
  String conditionsCount(String count) {
    return '$count groups';
  }

  @override
  String since(String date) {
    return 'Since $date';
  }

  @override
  String refillInDays(String days) {
    return 'Refill in ${days}d';
  }

  @override
  String lowSupplyNotice(String medication, String amount) {
    return 'Low supply: $medication, only $amount left';
  }

  @override
  String get orderRefill => 'Order Refill';

  @override
  String get symptomsNotes => 'Symptoms & Notes';

  @override
  String get noSymptoms => 'No symptoms logged in the last 30 days.';

  @override
  String get healthSynced => 'Health data synced to this phone.';

  @override
  String get healthConnectMissing =>
      'Health Connect is not installed. Opening the store…';

  @override
  String get healthUnavailable =>
      'Health data is not available on this device.';

  @override
  String get healthDenied =>
      'Permission was not granted. You can allow it in your phone\'s settings.';

  @override
  String bpAfterDose(String minutes, String medication) {
    return 'Recorded $minutes min after your $medication dose.';
  }

  @override
  String get vitalsAndSync => 'Vitals & Health Sync';

  @override
  String get connectedActive => 'Connected & Active';

  @override
  String get notConnected => 'Not connected';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get connect => 'Connect';

  @override
  String get onDeviceOnly => 'Processed on your phone only • no cloud';

  @override
  String get restingHeartRate => 'Resting Heart Rate';

  @override
  String bpmRange(String min, String max) {
    return '$min – $max BPM';
  }

  @override
  String get bpmAvg7d => 'BPM avg (7 days)';

  @override
  String get noHeartData => 'No heart rate readings in the last 7 days.';

  @override
  String get connectToSeeHeart =>
      'Connect your health app to see heart rate from your watch or phone.';

  @override
  String get dailyMobility => 'Daily Mobility';

  @override
  String goalSteps(String steps) {
    return 'Goal $steps';
  }

  @override
  String stepsDistance(String km) {
    return 'About $km km today';
  }

  @override
  String get pillVitalsHarmony => 'Pill & Vitals Harmony';

  @override
  String get harmonyPrivacy =>
      'Readings are matched with your dose log on this phone. Nothing is uploaded.';

  @override
  String get bloodPressureCheck => 'Blood Pressure Check';

  @override
  String get offlineBiometricCache => 'Offline Health Cache';

  @override
  String biometricPoints(String count) {
    return '$count readings stored securely on this phone.';
  }

  @override
  String get autoSyncOnOpen => 'Auto-sync when I open Remedi';

  @override
  String get autoSyncOnOpenHint =>
      'Pull new readings from your health app each time';

  @override
  String get generateClinicalReport => 'Generate Clinical Report (PDF & QR)';

  @override
  String get exportPrepared => 'Summary prepared on your phone.';

  @override
  String get exportFailed => 'Could not create the summary. Please try again.';

  @override
  String get handoverProtocol => 'Physician Handover';

  @override
  String get summaryTitle => 'Clinical Summary & QR Export';

  @override
  String get summarySubtitle =>
      'Zero-connectivity handover for outpatient visits, triage and emergencies.';

  @override
  String ageYears(String age) {
    return '$age yrs';
  }

  @override
  String bloodGroupValue(String group) {
    return 'Blood: $group';
  }

  @override
  String genotypeValue(String genotype) {
    return 'Genotype: $genotype';
  }

  @override
  String get primaryDiagnoses => 'Primary Diagnoses';

  @override
  String get noneRecorded => 'None recorded';

  @override
  String allergiesValue(String allergies) {
    return 'Allergies: $allergies';
  }

  @override
  String get generatedOnDevice => 'Generated on this phone';

  @override
  String generatedAt(String time) {
    return '$time generated';
  }

  @override
  String get qrSemantics => 'QR code containing your clinical summary';

  @override
  String get cameraDecodable => 'Scan with any camera';

  @override
  String get cameraDecodableBody =>
      'Contains a compact data snapshot of your medicines, adherence and vitals. No network needed.';

  @override
  String get zeroInternet => 'Zero Internet Required';

  @override
  String get valid48h => 'Valid 48 Hours';

  @override
  String get dossierHighlights => 'Clinical Highlights';

  @override
  String get last30Days => 'Last 30 Days';

  @override
  String get regimenAdherence => '30-Day Regimen Adherence';

  @override
  String percentOnTime(String percent) {
    return '$percent% On-Time';
  }

  @override
  String get takenShort => 'taken';

  @override
  String get vitalsCorrelation => 'Vitals Summary';

  @override
  String get bpAverage => 'Blood Pressure Avg';

  @override
  String readingsCount(String count) {
    return '$count readings';
  }

  @override
  String get systolicTrend => 'Systolic trend (latest readings)';

  @override
  String checksumLabel(String checksum) {
    return 'Integrity checksum: $checksum';
  }

  @override
  String get savePrintPdf => 'Save PDF / Print Summary';

  @override
  String get shareNearby => 'Share via Bluetooth, AirDrop or WhatsApp';

  @override
  String get privacyNotice =>
      'Your health records stay on this phone. Nothing is uploaded unless you choose to share this summary.';

  @override
  String get welcomeTitle => 'Welcome to Remedi';

  @override
  String get welcomeBody =>
      'Medicine reminders that work without network, in your own language.';

  @override
  String get continueLabel => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get aboutYouTitle => 'About you';

  @override
  String get aboutYouBody =>
      'This stays on your phone. It helps your doctor summary and alarms speak to you by name.';

  @override
  String get yourName => 'Your name';

  @override
  String get caregiverOptional => 'Caregiver (optional)';

  @override
  String get caregiverWhy =>
      'If a dose is not confirmed, Remedi prompts you to send them an SMS alert. SMS works without mobile data.';

  @override
  String get caregiverName => 'Caregiver\'s name';

  @override
  String get caregiverRelation => 'Relationship';

  @override
  String get caregiverRelationHint => 'e.g. Son, Daughter, Nurse';

  @override
  String get caregiverPhone => 'Caregiver\'s phone number';

  @override
  String get readyTitle => 'Let Remedi ring for you';

  @override
  String get readyBody =>
      'Allow notifications and alarms so reminders ring on time, even with your phone locked.';

  @override
  String get readyPoint1 => 'Loud alarms at each dose time, with snooze';

  @override
  String get readyPoint2 => 'Everything works 100% offline';

  @override
  String get readyPoint3 => 'Caregiver SMS alerts if a dose is missed';

  @override
  String get readyPoint4 => 'Doctor visit summary with PDF and QR code';

  @override
  String get enableRemindersStart => 'Enable Reminders & Start';

  @override
  String get exploreSample => 'Explore with sample medicines';

  @override
  String get medicalDisclaimer =>
      'Remedi helps you follow your prescription. It does not replace advice from your doctor or pharmacist.';

  @override
  String get titleLabel => 'Title';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get sex => 'Sex';

  @override
  String get female => 'Female';

  @override
  String get male => 'Male';

  @override
  String get bloodGroup => 'Blood group';

  @override
  String get genotype => 'Genotype';

  @override
  String get allergies => 'Allergies';

  @override
  String get allergiesHint => 'e.g. Penicillin, Sulfa drugs';

  @override
  String get caregiverAlertsToggle => 'Caregiver fail-safe alerts';

  @override
  String get caregiverAlertsToggleHint =>
      'Prompt me to text my caregiver when a dose is not confirmed';

  @override
  String get alertAfter => 'Alert after';

  @override
  String minutesShort(String minutes) {
    return '$minutes min';
  }

  @override
  String get appSettings => 'App settings';

  @override
  String get alarmPermissions => 'Alarm & notification permissions';

  @override
  String get alarmPermissionsHint => 'Make sure reminders can ring on time';

  @override
  String get alarmsArmed => 'Alarms are armed.';

  @override
  String get alarmsBlocked =>
      'Notifications are blocked. Please allow them in phone settings.';

  @override
  String get remiName => 'Remi';

  @override
  String get remiLoading => 'Remi is getting things ready…';

  @override
  String get offlineVault => '100% Offline Vault';

  @override
  String get splashTagline => 'Your caring offline health companion';

  @override
  String get splashVault => 'Private medicine vault';

  @override
  String get splashFormulary => 'Local clinical formulary';

  @override
  String get splashScanner => 'On-device text scanner';

  @override
  String get splashAlarms => 'Offline dose alarms';

  @override
  String get splashReady => 'Everything is ready';

  @override
  String get splashPreparing => 'Preparing your vault…';

  @override
  String get statusReady => 'Ready';

  @override
  String get statusLoading => 'Loading…';

  @override
  String get statusWaiting => 'Waiting';

  @override
  String get zeroTelemetryTitle => 'Zero-Tracking Promise';

  @override
  String get zeroTelemetryBody =>
      'Your routines, prescriptions and dose logs stay on this phone. Remedi works fully without signal or Wi-Fi.';

  @override
  String get openDoseStation => 'Open Daily Dose Station';

  @override
  String get getStarted => 'Get Started';

  @override
  String get worksOffline => 'Works offline';

  @override
  String get skip => 'Skip';

  @override
  String get offlineActive => '100% Offline Active';

  @override
  String get obStep1Label => 'Step 1 of 3';

  @override
  String get obStep2Label => 'Step 2 of 3 • Smart Intake';

  @override
  String get obStep3Label => 'Step 3 of 3 • Security & Setup';

  @override
  String get remiIntroBefore => '“Hi! I’m ';

  @override
  String get remiIntroAfter =>
      '. I’ll make sure you never miss a dose, even when you’re completely offline!”';

  @override
  String get alwaysReady => 'Always Ready';

  @override
  String get obStep1Title =>
      'Medication reminders that understand real human habits.';

  @override
  String get obStep1Body =>
      'No rigid clinical alarm clocks. Your doses are tied to breakfast, lunch and bedtime so taking care of yourself feels effortless.';

  @override
  String get morningRoutine => 'Morning Routine';

  @override
  String get withBreakfast => 'With Breakfast';

  @override
  String get remiVerified => 'Remi Verified';

  @override
  String get offlineReliable => '100% Offline Reliable';

  @override
  String flexibleTime(String time) {
    return '$time • Flexible';
  }

  @override
  String get continueSmartIntake => 'Continue to Smart Intake';

  @override
  String get smartScanVoice => 'Smart Scan & Voice';

  @override
  String get obStep2Title => 'Add medications in seconds, not minutes.';

  @override
  String get obStep2Body =>
      'Tired of typing long medicine names? Remedi reads prescriptions and listens to your voice, privately on your phone.';

  @override
  String get snapScriptTitle => 'Snap Paper Script or Pill Box';

  @override
  String get snapScriptSubtitle => 'Instant label recognition';

  @override
  String get scanDemoSubtitle => '500mg Tablet • Oral';

  @override
  String get recognised => 'Recognised';

  @override
  String get autoFill => 'Auto-fill';

  @override
  String get voiceDictation => 'Voice Dictation';

  @override
  String get voiceDictationLangs => 'English, Pidgin, Yorùbá, Igbo & Hausa';

  @override
  String get voiceDemoQuote =>
      '“One tablet of Lisinopril every morning after pap”';

  @override
  String get understoodInstantly => 'Understood instantly';

  @override
  String get quickPresets => 'One-Tap Quick Presets';

  @override
  String get quickPresetsHint => 'Tap to pre-fill common regimens';

  @override
  String get remisAdvice => 'Remi\'s advice';

  @override
  String get remisAdviceBody =>
      '“Forget typing long drug names! Just snap a photo or speak to me.”';

  @override
  String get nextPeaceOfMind => 'Next: Offline Peace of Mind';

  @override
  String get noPhotosLeave =>
      'Text is read on your phone. No photos leave your device.';

  @override
  String get healthStaysHere => 'Your health stays on this phone.';

  @override
  String get zeroCloudTrackers => 'Zero cloud trackers, ever.';

  @override
  String get obStep3Title => 'Total Privacy & Instant Doctor QR Handover';

  @override
  String get obStep3Body =>
      'Everything stays on your device. When visiting your doctor, share an offline QR code and PDF in one tap.';

  @override
  String get whatShouldRemiCallYou => 'What should Remi call you?';

  @override
  String get criticalAlarms => 'Critical Offline Alarms';

  @override
  String get essential => 'Essential';

  @override
  String get criticalAlarmsBody =>
      'Loud reminders that ring on time, even in airplane mode or with no network.';

  @override
  String healthSyncTitle(String app) {
    return '$app Sync';
  }

  @override
  String get onDevice => 'On-device';

  @override
  String get healthSyncBody =>
      'Show resting heart rate and daily steps next to your doses, processed only on this phone.';

  @override
  String get caregiverSmsAlert => 'Caregiver SMS Alert';

  @override
  String get optional => 'Optional';

  @override
  String get caregiverSmsAlertBody =>
      'If a dose is not confirmed, Remi prompts you to text your caregiver.';

  @override
  String get caregiverSmsNote =>
      'The SMS is sent from your own SIM, only when you tap send.';

  @override
  String get clinicQrMode => 'Clinic QR Handover';

  @override
  String get clinicQrModeBody =>
      'Share your summary with any doctor, no pairing needed';

  @override
  String get enabled => 'Enabled';

  @override
  String get enterRemedi => 'Enter Remedi & Add First Medicine';

  @override
  String get storedPrivately => 'Stored privately on this phone';

  @override
  String get voicePermissionDenied =>
      'Microphone or speech permission is off. Allow it in your phone\'s settings, or type the name instead.';

  @override
  String get voiceNoMatch =>
      'I didn\'t catch that. Tap the microphone and try again.';

  @override
  String get voiceNetwork =>
      'Your phone\'s speech service needs a connection for this language. Try English, or type the name instead.';

  @override
  String get voiceFailed =>
      'Voice input stopped unexpectedly. Please try again.';

  @override
  String get voiceNotRecognised =>
      'I heard you, but couldn\'t find a medicine name. Try again or type it.';

  @override
  String get stopListening => 'Stop listening';

  @override
  String get tapToStop => 'Tap to stop when you\'re done';

  @override
  String get tryAgain => 'Try again';

  @override
  String get typeInstead => 'Type instead';
}
