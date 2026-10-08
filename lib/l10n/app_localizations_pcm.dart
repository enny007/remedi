// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nigerian Pidgin (`pcm`).
class AppLocalizationsPcm extends AppLocalizations {
  AppLocalizationsPcm([String locale = 'pcm']) : super(locale);

  @override
  String get appName => 'Remedi';

  @override
  String get notifChannelDoses => 'Medicine alarm';

  @override
  String get notifChannelDosesDesc =>
      'Loud reminder wen time reach to take dose';

  @override
  String get notifChannelCare => 'Caregiver alert';

  @override
  String get notifChannelCareDesc =>
      'Caregiver backup alert and refill warning';

  @override
  String get notifDoseTitle => 'Time don reach to take your medicine';

  @override
  String get notifSnoozeTitle => 'Reminder wey you snooze';

  @override
  String notifDoseBody(String medication, String amount) {
    return '$medication • take $amount';
  }

  @override
  String get notifCaregiverTitle => 'Dose never confirm';

  @override
  String notifCaregiverBody(String medication, String caregiver) {
    return 'You never confirm $medication yet. Tap am to alert $caregiver by SMS.';
  }

  @override
  String get notifRefillTitle => 'You go need refill soon';

  @override
  String notifRefillBody(String count, String medication) {
    return 'Na only $count of $medication remain.';
  }

  @override
  String get actionMarkTaken => 'I don take am';

  @override
  String get actionSnooze15 => 'Snooze 15m';

  @override
  String get offlineReady => 'E dey work offline';

  @override
  String get offline => 'Offline';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get chooseLanguage => 'Choose your language';

  @override
  String get chooseLanguageHint =>
      'Reminder, alarm and instruction go dey show for dis language, even wen network no dey.';

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
  String get unitApplication => 'rub';

  @override
  String get unitSachet => 'sachet';

  @override
  String get unitPills => 'pills';

  @override
  String get freqOnce => 'One time every day';

  @override
  String get freqTwice => 'Two times every day';

  @override
  String get freqThrice => '3 times every day';

  @override
  String get freqPrn => 'Wen you need am';

  @override
  String get freqOnceHint => 'For morning';

  @override
  String get freqTwiceHint => 'Every 12 hours';

  @override
  String get freqThriceHint => 'With food';

  @override
  String get freqPrnHint => 'Wen e start sudden';

  @override
  String get mealWith => 'With food';

  @override
  String get mealBefore => 'Before food';

  @override
  String get mealAfter => 'After food';

  @override
  String get mealEmpty => 'Empty belle';

  @override
  String get mealWater => 'With water only';

  @override
  String get mealAny => 'Food no matter';

  @override
  String get mealWithHint => 'As you dey chop or just after';

  @override
  String get mealBeforeHint => '30 min before';

  @override
  String get mealAfterHint => 'Inside 1 hour after';

  @override
  String get mealEmptyHint => 'Full glass of water';

  @override
  String get mealWaterHint => 'Any time, with water';

  @override
  String get mealAnyHint => 'Food no matter for dis one';

  @override
  String get skipStomach => 'Belle dey upset, I dey feel like vomit or I vomit';

  @override
  String get skipStock => 'Medicine don finish or I no see am';

  @override
  String get skipDoctor => 'My doctor talk say make I hold am';

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
  String get symptomNausea => 'Feeling like to vomit';

  @override
  String get symptomDizziness => 'Head dey turn';

  @override
  String get symptomDryCough => 'Dry cough';

  @override
  String get symptomFatigue => 'Body dey weak';

  @override
  String get symptomHeadache => 'Headache';

  @override
  String get symptomSwelling => 'Ankle dey swell';

  @override
  String get symptomMusclePain => 'Body pain';

  @override
  String get symptomDiarrhea => 'Running stomach';

  @override
  String get symptomLowSugar => 'Sugar don low (shaking, sweating)';

  @override
  String get symptomRash => 'Skin rash';

  @override
  String get symptomStomachPain => 'Belle pain';

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
  String get navFastLog => 'Quick Log';

  @override
  String get navMyMeds => 'My Medicine';

  @override
  String get navHealth => 'Health';

  @override
  String toastDoseLogged(String medication) {
    return 'We don record say you take $medication.';
  }

  @override
  String toastSnoozedUntil(String time) {
    return 'Snooze don set. We go ring again by $time.';
  }

  @override
  String get snoozeLimitReached =>
      'You don finish your snooze. Abeg take dis dose or skip am.';

  @override
  String get sosTitle => 'Emergency Alert';

  @override
  String get sosNoCaregiver =>
      'You never add caregiver yet. Add person wey we fit text or call for you if emergency happen.';

  @override
  String get addCaregiver => 'Add caregiver';

  @override
  String sosBody(String name) {
    return 'Send SMS or call $name. SMS dey work even without data.';
  }

  @override
  String sosMessage(String patient) {
    return 'URGENT from Remedi: $patient need help. Abeg call or go check am now.';
  }

  @override
  String sosDoseMessage(String patient, String medication, String time) {
    return 'Remedi alert: $patient never confirm $medication wey suppose take by $time. Abeg check am.';
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
  String get skipTitle => 'Choose why you dey skip';

  @override
  String get skipAuditNote =>
      'Every dose wey you skip go dey recorded for your offline log so your doctor fit review your medicine.';

  @override
  String skipAuditNoteDoctor(String doctor) {
    return 'Every dose wey you skip go dey recorded for your offline log so $doctor fit review your medicine.';
  }

  @override
  String get confirmSkip => 'Confirm say you skip';

  @override
  String get skipRecorded => 'We don record the skip for your offline log.';

  @override
  String get logSymptomTitle => 'How your body dey?';

  @override
  String get logSymptomHint =>
      'Pick wetin you notice. E go dey inside the summary for your doctor visit.';

  @override
  String symptomLogged(String symptom) {
    return 'We don record $symptom.';
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
  String get emptyScheduleTitle => 'No medicine yet';

  @override
  String get emptyScheduleBody =>
      'Add your first medicine and Remedi go ring on time, even if network no dey.';

  @override
  String get addMedicine => 'Add Medicine';

  @override
  String get laterToday => 'Later Today';

  @override
  String dosesPending(String count) {
    return '$count still dey wait';
  }

  @override
  String get sosButton => 'Emergency SOS / Alert Caregiver (SMS)';

  @override
  String get moodAllDone => 'You don finish all!';

  @override
  String get moodGood => 'Body dey fine!';

  @override
  String get moodStart => 'Make we start.';

  @override
  String get noDosesToday => 'No dose for today.';

  @override
  String dosesDoneOf(String done, String total) {
    return 'You don take $done out of $total doses today.';
  }

  @override
  String snoozedUntil(String time) {
    return 'Snooze till $time';
  }

  @override
  String overdueBy(String minutes) {
    return 'E don pass time by $minutes min';
  }

  @override
  String get dueNow => 'Time don reach';

  @override
  String dueInMinutes(String minutes) {
    return 'E remain $minutes mins';
  }

  @override
  String dueAt(String time) {
    return 'Time na $time';
  }

  @override
  String get upNext => 'Next One';

  @override
  String get undo => 'Undo';

  @override
  String routineOf(String slot) {
    return '$slot routine';
  }

  @override
  String get fullGlassWater => 'Full glass of water';

  @override
  String get markAsTaken => 'I Don Take Am';

  @override
  String get snooze15 => 'Snooze 15m';

  @override
  String get noSnoozesLeft => 'Snooze don finish';

  @override
  String get skipOrSideEffect => 'Side effect / Skip';

  @override
  String get allDoneTitle => 'You don take all your dose today';

  @override
  String get allDoneBody =>
      'Well done. To dey take am every time dey protect your health.';

  @override
  String get completedEarlier => 'Wetin You Don Take';

  @override
  String takenCount(String count) {
    return '$count don take';
  }

  @override
  String get statusDone => 'E don do';

  @override
  String get statusSkipped => 'Skipped';

  @override
  String get statusMissed => 'You miss am';

  @override
  String get tookItLate => 'I don take am';

  @override
  String get doctorDirective => 'Wetin Doctor Talk';

  @override
  String forMedication(String medication) {
    return 'For $medication';
  }

  @override
  String get viewDetails => 'See details';

  @override
  String get asNeededMeds => 'Medicine for wen you need am';

  @override
  String tookPrn(String medication) {
    return 'I take $medication';
  }

  @override
  String get alarmAlert => 'Alarm Alert';

  @override
  String get doseNotFound => 'We no see dis dose';

  @override
  String get doseNotFoundBody => 'Maybe dem don change or remove dis reminder.';

  @override
  String get scheduledDose => 'Dose Wey Dey Schedule';

  @override
  String doseXofY(String index, String total) {
    return 'Dose $index out of $total today';
  }

  @override
  String get prescribedFor => 'Dem give am for:';

  @override
  String get routeOral => 'By mouth';

  @override
  String get criticalDirective => 'Important Doctor Instruction';

  @override
  String get directiveWithMeal =>
      'Take am with your food or just after you chop';

  @override
  String get directiveAfterFood => 'Take am inside 1 hour after food';

  @override
  String get directiveBeforeFood => 'Take am 30 minutes before food';

  @override
  String get directiveEmpty =>
      'Take am for empty belle with full glass of water';

  @override
  String get directiveWater => 'Take am with plenty clean water';

  @override
  String get accountabilityTitle => 'Confirm Say You Take Am';

  @override
  String get accountabilityBody =>
      'Confirm say you don really take am before you finish dis dose.';

  @override
  String confirmSwallowed(String units) {
    return 'I don swallow $units with full cup of water';
  }

  @override
  String confirmApplied(String units) {
    return 'I don rub $units';
  }

  @override
  String confirmInjected(String units) {
    return 'I don take $units';
  }

  @override
  String confirmInhaled(String units) {
    return 'I don take $units from my inhaler';
  }

  @override
  String get preventsEscalation => 'E go stop caregiver alert for dis dose';

  @override
  String get iHaveTakenThisDose => 'I Don Take Dis Dose';

  @override
  String snoozeWithRemaining(String count) {
    return 'Snooze 15 Minutes ($count go remain after dis)';
  }

  @override
  String get skipDoseRequiresReason => 'Skip Dose (you must give reason)';

  @override
  String get overdueAlarm => 'Dose don pass time';

  @override
  String get urgentAlarm => 'Urgent alarm';

  @override
  String get offlineVerified =>
      'Offline don confirm • e dey work without network';

  @override
  String get ringing => 'E dey ring';

  @override
  String get alreadyTaken => 'We don record say you take dis dose';

  @override
  String get alreadySkipped => 'You skip dis dose';

  @override
  String loggedAt(String time) {
    return 'Recorded by $time';
  }

  @override
  String get caregiverSetupPrompt =>
      'Add caregiver so person go know if you miss dose.';

  @override
  String get caregiverFailSafe => 'Caregiver Backup';

  @override
  String minutesQueue(String minutes) {
    return '${minutes}m wait';
  }

  @override
  String caregiverFailSafeBody(String time) {
    return 'If you no confirm by $time, Remedi go tell you make you send offline SMS alert to:';
  }

  @override
  String get caregiverAlertsOff =>
      'Caregiver alert don off. You still fit text dem:';

  @override
  String get cameraUnavailable => 'Camera no dey for dis phone.';

  @override
  String get analyzingPrescription => 'We dey read the writing for your phone…';

  @override
  String scanFound(String medication) {
    return 'We see $medication. Check the details wey dey below.';
  }

  @override
  String get scanNotRecognized =>
      'We no fit know the medicine. Abeg confirm the name.';

  @override
  String get confirmMedicine => 'Confirm medicine';

  @override
  String get instantIntake => 'Quick Add';

  @override
  String get addNewMedicine => 'Add New Medicine';

  @override
  String get addNewMedicineHint =>
      'Snap your prescription paper, scan the medicine pack, or tell us the name.';

  @override
  String get smartScan => 'Smart Quick Scan';

  @override
  String get works100Offline => 'E Dey Work 100% Offline';

  @override
  String get onDeviceOcr => 'For your phone';

  @override
  String get snapAutoFill => 'Snap & Auto-Fill';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get voiceNote => 'Voice Note';

  @override
  String get voiceNoteHint => 'Talk the medicine name and strength';

  @override
  String get tapToSpeak => 'Tap to talk';

  @override
  String get typeName => 'Type Name';

  @override
  String get typeNameHint => 'Search brand or generic name';

  @override
  String get manualEntry => 'Type am yourself';

  @override
  String get quickPick => 'Pick Common Medicine Quick';

  @override
  String get oneTapAdd => '1-Tap Add';

  @override
  String get readingText => 'E dey read…';

  @override
  String get lensReady => 'Camera Ready';

  @override
  String get aimInsideBox => 'Put am inside the box';

  @override
  String get aimHint =>
      'Point am for medicine pack, blister pack, or doctor paper';

  @override
  String get searchMedicineHint => 'e.g. Metformin, Panadol, Amlodipine';

  @override
  String useCustomMedicine(String name) {
    return 'Add \"$name\"';
  }

  @override
  String get useCustomMedicineHint =>
      'E no dey the list? Add am with your own details.';

  @override
  String get voiceSheetHint => 'Like: \"Metformin five hundred milligrams\".';

  @override
  String get voiceUnavailable =>
      'Voice no dey work for dis phone. Abeg type the name.';

  @override
  String get listening => 'E dey listen…';

  @override
  String get tapMicToSpeak => 'Tap the microphone and talk.';

  @override
  String useThisMedicine(String medication) {
    return 'Use $medication';
  }

  @override
  String get editMedicine => 'Change medicine';

  @override
  String get drugNameLabel => 'Medicine name';

  @override
  String get drugNameHint => 'Brand or generic name';

  @override
  String get strengthLabel => 'Strength & unit';

  @override
  String get strengthHint => 'e.g. 500mg, 5ml';

  @override
  String get doseFormLabel => 'Medicine type';

  @override
  String get requiredField => 'You must fill dis one';

  @override
  String get required => 'You must fill am';

  @override
  String get saveContinue => 'Save & continue';

  @override
  String get addAtLeastOneTime => 'Add at least one reminder time.';

  @override
  String remindersSet(String medication) {
    return 'Reminder don set for $medication.';
  }

  @override
  String get changesSaved => 'We don save am.';

  @override
  String get editRoutine => 'Change Routine';

  @override
  String get stepScheduleFood => 'Step 1 of 2 • Schedule & Food';

  @override
  String get unnamedMedicine => 'Medicine wey no get name';

  @override
  String get edit => 'Change';

  @override
  String get howOften => '1. How many times you dey take am?';

  @override
  String get tapToSelect => 'Tap to choose';

  @override
  String get foodRoutine => '2. Food Routine';

  @override
  String get preventsNausea => 'E dey stop vomiting feeling';

  @override
  String get prnNoReminders =>
      'Medicine wey you dey take wen you need am no get alarm. Record each dose for Schedule tab wen you take am.';

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
      'Alarm go ring well even if network or internet no dey.';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get saveSetReminders => 'Save & Set Reminders';

  @override
  String get moreClinicalDetails => 'More medical details';

  @override
  String get moreClinicalDetailsHint => '(doctor notes, refill — if you want)';

  @override
  String doseSlotLabel(String number, String slot) {
    return 'Dose $number • $slot';
  }

  @override
  String get adjustTime => 'Change time';

  @override
  String get doseAmount => 'How much to take';

  @override
  String get removeTime => 'Remove time';

  @override
  String get nameStrengthRequired => 'You must put medicine name and strength.';

  @override
  String get clinicalDetails => 'Medical Details';

  @override
  String get safeIntakeProtocol => 'Safe Offline Way to Take Medicine';

  @override
  String get clinicalDetailsTitle => 'Sickness & Prescription Details';

  @override
  String clinicalDetailsStep(String medication) {
    return 'Step 2 of 2: Medical details for $medication';
  }

  @override
  String get whyExtraTime => 'Why dis one dey take extra time';

  @override
  String get whyExtraTimeBody =>
      'If you put the correct sickness, doctor instruction and supply details, your offline alarm, refill warning and doctor summary go correct, even if network no dey at all.';

  @override
  String get diagnosedContext => 'Sickness Wey Doctor Find';

  @override
  String get conditionLabel => 'Sickness wey doctor find';

  @override
  String get conditionHint => 'e.g. Hypertension, Type 2 Diabetes';

  @override
  String get facilityLabel => 'Hospital / Clinic';

  @override
  String get facilityHint => 'e.g. Lagoon Hospital, Ikoyi';

  @override
  String get prescriberLabel => 'Doctor wey give the medicine';

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
  String get doctorInstructionsLabel => 'Wetin doctor talk';

  @override
  String get doctorInstructionsHint =>
      'e.g. Drink 2 full glass of water with am';

  @override
  String get pillDescriptionLabel => 'How the medicine be';

  @override
  String get pillDescriptionHint =>
      'e.g. White long tablet wey get \'M 500\' on top';

  @override
  String get rxNumberLabel => 'Prescription number';

  @override
  String get prescriptionBackup => 'Prescription Paper Backup';

  @override
  String get noPrescriptionPhoto => 'No photo yet';

  @override
  String get prescriptionSaved => 'Prescription photo don save';

  @override
  String get storedOnDevice => 'E dey only for dis phone';

  @override
  String get attachPhoto => 'Add photo';

  @override
  String get supplyTracking => 'Supply & Refill Tracking';

  @override
  String stockLabel(String unit) {
    return '$unit wey remain';
  }

  @override
  String get refillAlertAt => 'Refill alert wen e reach';

  @override
  String get refillExplainer =>
      'Remedi dey count down every dose wey you record, and e go warn you offline wen your medicine wan finish.';

  @override
  String get sideEffectWatchlist => 'Side Effects to Watch';

  @override
  String sideEffectWatchlistHint(String medication) {
    return 'Choose the symptoms wey your doctor warn you about for $medication. You fit record dem for your health journal.';
  }

  @override
  String get encryptedLocal =>
      'E dey saved only for your phone private storage';

  @override
  String get saveMedicineSetReminders => 'Save Medicine & Set Reminders';

  @override
  String get backToRoutine => 'Go back to Schedule & Food';

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
      'Medicine wey doctor give you, how to use dem safe, and refill tracker.';

  @override
  String get searchCabinet => 'Search your medicine';

  @override
  String filterAll(String count) {
    return 'All ($count)';
  }

  @override
  String get emptyCabinetTitle => 'Your cabinet empty';

  @override
  String get noMedsInCategory => 'No medicine for dis group';

  @override
  String get noMedsInCategoryBody =>
      'Tap \'All\' to see your list or add medicine for dis time of day.';

  @override
  String get offlineSynchronized => 'Saved Offline';

  @override
  String get offlineSynchronizedBody =>
      'Prescription safety cards dey saved for your phone, so you fit check dem even without network.';

  @override
  String get supplyNotTracked => 'We no dey track stock';

  @override
  String get lowSupply => 'E don dey finish';

  @override
  String daysLeft(String days) {
    return '$days days remain';
  }

  @override
  String get goodSupply => 'E still plenty';

  @override
  String get savedOnDevice => 'E dey saved for dis phone';

  @override
  String get details => 'Details';

  @override
  String refillMessage(String medication, String rx, String patient) {
    return 'Hello, I wan refill $medication$rx for $patient. Thank you.';
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
    return '$days days remain';
  }

  @override
  String refillBy(String date) {
    return 'Refill before $date';
  }

  @override
  String get prescriber => 'Doctor wey give am';

  @override
  String get clinicalInstructions => 'Doctor Instructions';

  @override
  String get requestRefill => 'Ask Pharmacy for Refill';

  @override
  String get openFullDetails => 'Open full details';

  @override
  String get editMedicationDetails => 'Change Medicine Details';

  @override
  String get medicationDetail => 'Medicine Details';

  @override
  String get medicineNotFound => 'We no see dis medicine';

  @override
  String get updateStock => 'Update stock';

  @override
  String get updateStockHint =>
      'How many you get now? Tap refill amount to add am.';

  @override
  String get save => 'Save';

  @override
  String get stockUpdated => 'Stock don update.';

  @override
  String stopMedicineTitle(String medication) {
    return 'Stop $medication?';
  }

  @override
  String get stopMedicineBody =>
      'Reminder go stop. We go keep your dose history make your doctor fit check am. Only stop medicine if your doctor tell you make you stop.';

  @override
  String get stopMedicine => 'Stop medicine';

  @override
  String medicineStopped(String medication) {
    return '$medication don stop. Reminder don cancel.';
  }

  @override
  String get backToCabinet => 'Go back to Cabinet';

  @override
  String get encryptedLocalRecord => 'Private record for dis phone';

  @override
  String get remainingSupply => 'Wetin Remain';

  @override
  String get notTracked => 'We no dey track am';

  @override
  String get pillIdentifier => 'How to Know the Medicine';

  @override
  String get seePrescriptionPhoto => 'See prescription photo';

  @override
  String get dosageRoutine => 'How to Take Am';

  @override
  String perIntake(String units) {
    return '$units every time';
  }

  @override
  String perDay(String amount) {
    return '$amount/day';
  }

  @override
  String get safetyInteractions => 'Safety & Mixing with Other Drugs';

  @override
  String get offlineSafetyDb => 'Offline guide, you no need internet';

  @override
  String get notInReference => 'E no dey inside the offline guide';

  @override
  String get noKnownClash => 'We no see any known clash';

  @override
  String get noOtherMeds =>
      'You no get any other medicine wey you dey take now.';

  @override
  String checkedAgainst(String medications) {
    return 'We check am with: $medications';
  }

  @override
  String get checked => 'Checked';

  @override
  String interactionWith(String medication) {
    return 'E fit clash with $medication';
  }

  @override
  String get askDoctor => 'Ask doctor';

  @override
  String get caution => 'Be careful';

  @override
  String get dietWarning => 'Food & Alcohol Warning';

  @override
  String get missedDoseTitle => 'Wetin to do if you miss dose?';

  @override
  String get missedDoseGeneric =>
      'Take am as soon as you remember. If e don almost reach time for the next dose, skip the one wey you miss. Never take double dose.';

  @override
  String get storageUse => 'How to keep & use am';

  @override
  String get referenceDisclaimer =>
      'Na general guide only. Always follow wetin your doctor or pharmacist talk.';

  @override
  String get prescriptionOrigin => 'Where Prescription Come From';

  @override
  String get prescriberUnknown => 'You never add doctor';

  @override
  String get callClinic => 'Call clinic';

  @override
  String get add => 'Add';

  @override
  String get emergencyResponder => 'Emergency Person';

  @override
  String get smsLinked => 'SMS Linked';

  @override
  String logDoseNow(String units) {
    return 'Record Dose Now ($units)';
  }

  @override
  String get refillSms => 'Offline Refill SMS';

  @override
  String get editRoutineBtn => 'Change Routine';

  @override
  String get logSideEffect => 'Record side effect';

  @override
  String get bpNormal => 'Normal';

  @override
  String get bpElevated => 'E don rise small';

  @override
  String get bpStage1 => 'High • Stage 1';

  @override
  String get bpStage2 => 'High • Stage 2';

  @override
  String get bpCrisis => 'Danger level';

  @override
  String get bpCrisisAdvice =>
      'Dis reading high well well. Rest for 5 minutes and check am again. If e still high or you no feel well, go emergency (hospital) now now.';

  @override
  String get enterBothValues => 'Put the two numbers.';

  @override
  String get enterValue => 'Put number.';

  @override
  String get valueLooksWrong =>
      'Dis number no look correct. Abeg check am and try again.';

  @override
  String get vitalSaved => 'Reading don save.';

  @override
  String get logVitalTitle => 'Record reading';

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
      'Carry your full medicine and vitals record go your next appointment. You no need data.';

  @override
  String get generateSummary => 'Make Doctor Visit Summary (PDF / QR)';

  @override
  String get offlineDataVault => 'Offline Data Store';

  @override
  String get localAndPrivate => 'Private & e dey saved for dis phone';

  @override
  String pendingCount(String count) {
    return '$count still dey wait';
  }

  @override
  String vaultBody(String count) {
    return 'All your medicine and vitals record dey saved for dis phone. $count changes dey wait for cloud backup wen you on am.';
  }

  @override
  String get attemptSync => 'Sync Now';

  @override
  String get cloudSyncNotConfigured =>
      'Cloud backup never on yet. Your data dey safe for dis phone.';

  @override
  String get noDataYet => 'No data yet';

  @override
  String get excellent => 'Excellent';

  @override
  String get good => 'Good';

  @override
  String get needsAttention => 'E need attention';

  @override
  String get adherence30 => 'How you take am (30 days)';

  @override
  String get target90 => 'target ≥90%';

  @override
  String get currentStreak => 'Days wey you no miss';

  @override
  String get days => 'days';

  @override
  String onTimeRate(String percent) {
    return '$percent% na on time you take am';
  }

  @override
  String get weeklyRoutine => 'Weekly Routine';

  @override
  String missedThisWeek(String count) {
    return '$count doses wey you miss dis week';
  }

  @override
  String get last7Days => 'Last 7 days';

  @override
  String get legendOnTime => 'On time';

  @override
  String get legendLate => 'Late';

  @override
  String get legendMissed => 'Miss / skip';

  @override
  String get languageCardTitle => 'Language & Voice';

  @override
  String get languageCardBody =>
      'Reminder and alarm go use the language wey you choose, even wen network no dey at all.';

  @override
  String get vitalsQuickLogger => 'Quick Vitals Record';

  @override
  String get seeTrends => 'See trends';

  @override
  String get noVitalsYet =>
      'No reading yet. Record your blood pressure or sugar to follow how e dey go.';

  @override
  String get logBpOrSugar => 'Record Blood Pressure or Sugar';

  @override
  String get otherMedicines => 'Other medicines';

  @override
  String get activeConditions => 'Sickness & Medicine Plan';

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
    return 'E don dey finish: $medication, na only $amount remain';
  }

  @override
  String get orderRefill => 'Order Refill';

  @override
  String get symptomsNotes => 'Symptoms & Notes';

  @override
  String get noSymptoms => 'No symptom recorded for the last 30 days.';

  @override
  String get healthSynced => 'Health data don sync to dis phone.';

  @override
  String get healthConnectMissing =>
      'Health Connect no dey installed. We dey open the store…';

  @override
  String get healthUnavailable => 'Health data no dey for dis phone.';

  @override
  String get healthDenied =>
      'You never give permission. You fit allow am for your phone settings.';

  @override
  String bpAfterDose(String minutes, String medication) {
    return 'Recorded $minutes min after your $medication dose.';
  }

  @override
  String get vitalsAndSync => 'Vitals & Health Sync';

  @override
  String get connectedActive => 'E don connect & e dey work';

  @override
  String get notConnected => 'E never connect';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get connect => 'Connect';

  @override
  String get onDeviceOnly => 'Na only your phone dey process am • no cloud';

  @override
  String get restingHeartRate => 'Resting Heart Rate';

  @override
  String bpmRange(String min, String max) {
    return '$min – $max BPM';
  }

  @override
  String get bpmAvg7d => 'BPM average (7 days)';

  @override
  String get noHeartData => 'No heart rate reading for the last 7 days.';

  @override
  String get connectToSeeHeart =>
      'Connect your health app to see heart rate from your watch or phone.';

  @override
  String get dailyMobility => 'Daily Waka';

  @override
  String goalSteps(String steps) {
    return 'Target $steps';
  }

  @override
  String stepsDistance(String km) {
    return 'About $km km today';
  }

  @override
  String get pillVitalsHarmony => 'Medicine & Vitals Together';

  @override
  String get harmonyPrivacy =>
      'We dey match your readings with your dose record for dis phone. Nothing dey go online.';

  @override
  String get bloodPressureCheck => 'Blood Pressure Check';

  @override
  String get offlineBiometricCache => 'Offline Health Store';

  @override
  String biometricPoints(String count) {
    return '$count readings dey saved safe for dis phone.';
  }

  @override
  String get autoSyncOnOpen => 'Sync by itself wen I open Remedi';

  @override
  String get autoSyncOnOpenHint =>
      'Bring new readings from your health app every time';

  @override
  String get generateClinicalReport => 'Make Medical Report (PDF & QR)';

  @override
  String get exportPrepared => 'Summary don ready for your phone.';

  @override
  String get exportFailed => 'We no fit make the summary. Abeg try again.';

  @override
  String get handoverProtocol => 'Give Doctor';

  @override
  String get summaryTitle => 'Medical Summary & QR Export';

  @override
  String get summarySubtitle =>
      'Give doctor your record without network — for clinic visit, triage and emergency.';

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
  String get primaryDiagnoses => 'Main Sickness';

  @override
  String get noneRecorded => 'Nothing recorded';

  @override
  String allergiesValue(String allergies) {
    return 'Allergies: $allergies';
  }

  @override
  String get generatedOnDevice => 'Dis phone make am';

  @override
  String generatedAt(String time) {
    return 'Made by $time';
  }

  @override
  String get qrSemantics => 'QR code wey carry your medical summary';

  @override
  String get cameraDecodable => 'Scan with any camera';

  @override
  String get cameraDecodableBody =>
      'E carry short record of your medicine, how you dey take am, and your vitals. You no need network.';

  @override
  String get zeroInternet => 'You No Need Internet';

  @override
  String get valid48h => 'E Good for 48 Hours';

  @override
  String get dossierHighlights => 'Main Medical Points';

  @override
  String get last30Days => 'Last 30 Days';

  @override
  String get regimenAdherence => 'How You Take Medicine (30 Days)';

  @override
  String percentOnTime(String percent) {
    return '$percent% On Time';
  }

  @override
  String get takenShort => 'taken';

  @override
  String get vitalsCorrelation => 'Vitals Summary';

  @override
  String get bpAverage => 'Blood Pressure Average';

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
  String get shareNearby => 'Share with Bluetooth, AirDrop or WhatsApp';

  @override
  String get privacyNotice =>
      'Your health record dey stay for dis phone. Nothing go online unless you choose to share dis summary.';

  @override
  String get welcomeTitle => 'Welcome to Remedi';

  @override
  String get welcomeBody =>
      'Medicine reminder wey dey work without network, for your own language.';

  @override
  String get continueLabel => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get aboutYouTitle => 'About you';

  @override
  String get aboutYouBody =>
      'Dis one go stay for your phone. E go help your doctor summary and alarm call you by your name.';

  @override
  String get yourName => 'Your name';

  @override
  String get caregiverOptional => 'Caregiver (if you want)';

  @override
  String get caregiverWhy =>
      'If you no confirm dose, Remedi go tell you make you send dem SMS alert. SMS dey work without data.';

  @override
  String get caregiverName => 'Caregiver name';

  @override
  String get caregiverRelation => 'Relationship';

  @override
  String get caregiverRelationHint => 'e.g. Son, Daughter, Nurse';

  @override
  String get caregiverPhone => 'Caregiver phone number';

  @override
  String get readyTitle => 'Make Remedi ring for you';

  @override
  String get readyBody =>
      'Allow notification and alarm so reminder go ring on time, even if your phone lock.';

  @override
  String get readyPoint1 => 'Loud alarm every time wey dose reach, with snooze';

  @override
  String get readyPoint2 => 'Everything dey work 100% offline';

  @override
  String get readyPoint3 => 'Caregiver go get SMS alert if you miss dose';

  @override
  String get readyPoint4 => 'Doctor visit summary with PDF and QR code';

  @override
  String get enableRemindersStart => 'On Reminders & Start';

  @override
  String get exploreSample => 'Try am with sample medicines';

  @override
  String get medicalDisclaimer =>
      'Remedi dey help you follow your prescription. E no replace advice from your doctor or pharmacist.';

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
  String get caregiverAlertsToggle => 'Caregiver backup alert';

  @override
  String get caregiverAlertsToggleHint =>
      'Remind me to text my caregiver wen I no confirm dose';

  @override
  String get alertAfter => 'Alert after';

  @override
  String minutesShort(String minutes) {
    return '$minutes min';
  }

  @override
  String get appSettings => 'App settings';

  @override
  String get alarmPermissions => 'Alarm & notification permission';

  @override
  String get alarmPermissionsHint => 'Make sure say reminder fit ring on time';

  @override
  String get alarmsArmed => 'Alarm don ready.';

  @override
  String get alarmsBlocked =>
      'Notification don block. Abeg allow am for phone settings.';

  @override
  String get remiName => 'Remi';

  @override
  String get remiLoading => 'Remi dey arrange tins for you…';

  @override
  String get offlineVault => '100% Offline Vault';

  @override
  String get splashTagline => 'Your health padi wey dey work without network';

  @override
  String get splashVault => 'Your private medicine vault';

  @override
  String get splashFormulary => 'Medicine list wey dey your phone';

  @override
  String get splashScanner => 'Text scanner wey dey your phone';

  @override
  String get splashAlarms => 'Medicine alarm wey no need network';

  @override
  String get splashReady => 'Everything don ready';

  @override
  String get splashPreparing => 'We dey prepare your vault…';

  @override
  String get statusReady => 'E don ready';

  @override
  String get statusLoading => 'E dey load…';

  @override
  String get statusWaiting => 'E dey wait';

  @override
  String get zeroTelemetryTitle => 'No-Tracking Promise';

  @override
  String get zeroTelemetryBody =>
      'Your medicine routine, prescription and dose record dey only for this phone. Remedi dey work well without network or Wi-Fi.';

  @override
  String get openDoseStation => 'Open Daily Medicine Station';

  @override
  String get getStarted => 'Make we start';

  @override
  String get worksOffline => 'E dey work without network';

  @override
  String get skip => 'Skip';

  @override
  String get offlineActive => '100% Offline Dey Work';

  @override
  String get obStep1Label => 'Step 1 of 3';

  @override
  String get obStep2Label => 'Step 2 of 3 • Quick Add';

  @override
  String get obStep3Label => 'Step 3 of 3 • Security & Setup';

  @override
  String get remiIntroBefore => '“How far! Na me be ';

  @override
  String get remiIntroAfter =>
      '. I go make sure say you no miss any dose, even when network no dey at all!”';

  @override
  String get alwaysReady => 'Always Ready';

  @override
  String get obStep1Title =>
      'Medicine reminder wey understand how you dey live.';

  @override
  String get obStep1Body =>
      'No be strict hospital alarm. We tie your medicine to breakfast, lunch and bedtime so to take care of yourself go dey easy.';

  @override
  String get morningRoutine => 'Morning Routine';

  @override
  String get withBreakfast => 'With Breakfast';

  @override
  String get remiVerified => 'Remi Don Check Am';

  @override
  String get offlineReliable => '100% Reliable Without Network';

  @override
  String flexibleTime(String time) {
    return '$time • You fit change am';
  }

  @override
  String get continueSmartIntake => 'Continue to Quick Add';

  @override
  String get smartScanVoice => 'Smart Scan & Voice';

  @override
  String get obStep2Title => 'Add medicine for seconds, no be minutes.';

  @override
  String get obStep2Body =>
      'You don tire to dey type long medicine name? Remedi fit read prescription and hear your voice, private for your phone.';

  @override
  String get snapScriptTitle => 'Snap Doctor Paper or Medicine Pack';

  @override
  String get snapScriptSubtitle => 'E go read the label sharp sharp';

  @override
  String get scanDemoSubtitle => '500mg Tablet • For Mouth';

  @override
  String get recognised => 'E don know am';

  @override
  String get autoFill => 'E go fill am';

  @override
  String get voiceDictation => 'Talk Am With Voice';

  @override
  String get voiceDictationLangs => 'English, Pidgin, Yorùbá, Igbo & Hausa';

  @override
  String get voiceDemoQuote =>
      '“One Lisinopril tablet every morning after pap”';

  @override
  String get understoodInstantly => 'E don understand sharp sharp';

  @override
  String get quickPresets => 'One-Tap Quick Pick';

  @override
  String get quickPresetsHint => 'Tap am to fill common medicine routine';

  @override
  String get remisAdvice => 'Remi Advice';

  @override
  String get remisAdviceBody =>
      '“Forget to dey type long medicine name! Just snap photo or talk to me.”';

  @override
  String get nextPeaceOfMind => 'Next: Peace of Mind Without Network';

  @override
  String get noPhotosLeave =>
      'Na your phone dey read the text. No photo dey comot from your phone.';

  @override
  String get healthStaysHere => 'Your health info dey only for this phone.';

  @override
  String get zeroCloudTrackers => 'No cloud tracker at all, ever.';

  @override
  String get obStep3Title => 'Full Privacy & Quick Doctor QR Handover';

  @override
  String get obStep3Body =>
      'Everything dey your phone. When you go see doctor, share offline QR code and PDF with one tap.';

  @override
  String get whatShouldRemiCallYou => 'Wetin Remi go dey call you?';

  @override
  String get criticalAlarms => 'Important Offline Alarms';

  @override
  String get essential => 'Important';

  @override
  String get criticalAlarmsBody =>
      'Loud reminder wey go ring on time, even for airplane mode or when network no dey.';

  @override
  String healthSyncTitle(String app) {
    return '$app Sync';
  }

  @override
  String get onDevice => 'For phone';

  @override
  String get healthSyncBody =>
      'See your resting heart rate and daily steps near your medicine, na only this phone dey process am.';

  @override
  String get caregiverSmsAlert => 'Caregiver SMS Alert';

  @override
  String get optional => 'You fit skip am';

  @override
  String get caregiverSmsAlertBody =>
      'If you no confirm one dose, Remi go remind you to text your caregiver.';

  @override
  String get caregiverSmsNote =>
      'The SMS go comot from your own SIM, only when you tap send.';

  @override
  String get clinicQrMode => 'Clinic QR Handover';

  @override
  String get clinicQrModeBody =>
      'Share your summary with any doctor, no need to connect anything';

  @override
  String get enabled => 'E dey on';

  @override
  String get enterRemedi => 'Enter Remedi & Add First Medicine';

  @override
  String get storedPrivately => 'E dey private for this phone';

  @override
  String get voicePermissionDenied =>
      'Microphone or speech permission dey off. Allow am for your phone settings, or type the name instead.';

  @override
  String get voiceNoMatch =>
      'I no hear am well. Tap the microphone make you try again.';

  @override
  String get voiceNetwork =>
      'Your phone speech service need network for this language. Try English, or type the name instead.';

  @override
  String get voiceFailed => 'Voice stop by itself. Abeg try again.';

  @override
  String get voiceNotRecognised =>
      'I hear you, but I no see any medicine name. Try again or type am.';

  @override
  String get stopListening => 'Stop to dey listen';

  @override
  String get tapToStop => 'Tap am to stop when you finish';

  @override
  String get tryAgain => 'Try again';

  @override
  String get typeInstead => 'Type am instead';
}
