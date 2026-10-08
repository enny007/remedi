// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Igbo (`ig`).
class AppLocalizationsIg extends AppLocalizations {
  AppLocalizationsIg([String locale = 'ig']) : super(locale);

  @override
  String get appName => 'Remedi';

  @override
  String get notifChannelDoses => 'Mkpu ncheta ọgwụ';

  @override
  String get notifChannelDosesDesc => 'Ncheta dị ụda mgbe oge ọgwụ ruru';

  @override
  String get notifChannelCare => 'Ọkwa nlekọta';

  @override
  String get notifChannelCareDesc =>
      'Ọkwa nchekwa onye nlekọta na ịdọ aka ná ntị maka ịzụkwa ọgwụ';

  @override
  String get notifDoseTitle => 'Oge ọgwụ gị eruola';

  @override
  String get notifSnoozeTitle => 'Ncheta e yigharịrị';

  @override
  String notifDoseBody(String medication, String amount) {
    return '$medication • were $amount';
  }

  @override
  String get notifCaregiverTitle => 'E kwadobeghị ọgwụ a';

  @override
  String notifCaregiverBody(String medication, String caregiver) {
    return 'E kwadobeghị $medication ka ugbu a. Pịa ka i zipu $caregiver ọkwa SMS.';
  }

  @override
  String get notifRefillTitle => 'Ọgwụ fọrọ nke nta ka ọ gwụ';

  @override
  String notifRefillBody(String count, String medication) {
    return 'Naanị $count $medication fọdụrụ.';
  }

  @override
  String get actionMarkTaken => 'Eweela m ya';

  @override
  String get actionSnooze15 => 'Yigharịa 15m';

  @override
  String get offlineReady => 'Dị njikere n\'enweghị ịntanetị';

  @override
  String get offline => 'Enweghị ịntanetị';

  @override
  String get changeLanguage => 'Gbanwee asụsụ';

  @override
  String get chooseLanguage => 'Họrọ asụsụ gị';

  @override
  String get chooseLanguageHint =>
      'Ncheta, mkpu na ntụziaka ga-eji asụsụ a, ọbụlagodi n\'enweghị ịntanetị.';

  @override
  String get profileTitle => 'Profaịlụ & Ntọala';

  @override
  String get formTablet => 'Mkpụrụ ọgwụ';

  @override
  String get formCapsule => 'Kapsul';

  @override
  String get formCaplet => 'Kaplet';

  @override
  String get formSoftgel => 'Softgel';

  @override
  String get formLiquid => 'Mmiri ọgwụ / Sirọp';

  @override
  String get formDrops => 'Ọgwụ ntụpọ';

  @override
  String get formInjection => 'Ọgwụ ntụtụ';

  @override
  String get formInhaler => 'Ọgwụ ekuru (Inhaler)';

  @override
  String get formCream => 'Ude / Ọgwụ ite';

  @override
  String get formSachet => 'Sachet';

  @override
  String get unitMl => 'ml';

  @override
  String get unitDrops => 'ntụpọ';

  @override
  String get unitInjection => 'ntụtụ';

  @override
  String get unitPuffs => 'nkuru';

  @override
  String get unitApplication => 'ntehịa';

  @override
  String get unitSachet => 'sachet';

  @override
  String get unitPills => 'mkpụrụ';

  @override
  String get freqOnce => 'Otu ugboro kwa ụbọchị';

  @override
  String get freqTwice => 'Ugboro abụọ kwa ụbọchị';

  @override
  String get freqThrice => 'Ugboro 3 kwa ụbọchị';

  @override
  String get freqPrn => 'Mgbe ọ dị mkpa';

  @override
  String get freqOnceHint => 'N\'ụtụtụ';

  @override
  String get freqTwiceHint => 'Kwa awa 12';

  @override
  String get freqThriceHint => 'Ya na nri';

  @override
  String get freqPrnHint => 'Maka ọrịa bịara na mberede';

  @override
  String get mealWith => 'Ya na nri';

  @override
  String get mealBefore => 'Tupu nri';

  @override
  String get mealAfter => 'Mgbe nri gasịrị';

  @override
  String get mealEmpty => 'Afọ efu';

  @override
  String get mealWater => 'Naanị mmiri';

  @override
  String get mealAny => 'Enweghị iwu nri';

  @override
  String get mealWithHint => 'N\'oge nri ma ọ bụ ozugbo e risịrị';

  @override
  String get mealBeforeHint => 'Nkeji 30 tupu nri';

  @override
  String get mealAfterHint => 'N\'ime otu awa';

  @override
  String get mealEmptyHint => 'Iko mmiri zuru ezu';

  @override
  String get mealWaterHint => 'Oge ọ bụla, ya na mmiri';

  @override
  String get mealAnyHint => 'Nri adịghị mkpa';

  @override
  String get skipStomach => 'Afọ ọjọọ, ọchịchọ ịgbọ agbọ ma ọ bụ ịgbọ agbọ';

  @override
  String get skipStock => 'Ọgwụ agwụla ma ọ bụ efuola';

  @override
  String get skipDoctor => 'Dọkịta m gwara m kwụsịtụ ya';

  @override
  String get skipOther => 'Ihe ọzọ kpatara ya';

  @override
  String get slotBreakfast => 'Nri ụtụtụ';

  @override
  String get slotLunch => 'Nri ehihie';

  @override
  String get slotDinner => 'Nri abalị';

  @override
  String get slotBedtime => 'Oge ụra';

  @override
  String get slotCustom => 'Ncheta';

  @override
  String get symptomNausea => 'Ọchịchọ ịgbọ agbọ';

  @override
  String get symptomDizziness => 'Isi ịgba gburugburu';

  @override
  String get symptomDryCough => 'Ụkwara nkụ';

  @override
  String get symptomFatigue => 'Ike ọgwụgwụ';

  @override
  String get symptomHeadache => 'Isi ọwụwa';

  @override
  String get symptomSwelling => 'Ọzịza nkwonkwo ụkwụ';

  @override
  String get symptomMusclePain => 'Mgbu anụ ahụ';

  @override
  String get symptomDiarrhea => 'Afọ ọsịsa';

  @override
  String get symptomLowSugar => 'Shuga dị ala (ịma jijiji, ọsụsọ)';

  @override
  String get symptomRash => 'Ọkụkụ n\'akpụkpọ ahụ';

  @override
  String get symptomStomachPain => 'Afọ mgbu';

  @override
  String get partMorning => 'Ụtụtụ';

  @override
  String get partAfternoon => 'Ehihie';

  @override
  String get partEvening => 'Mgbede';

  @override
  String get partNight => 'Abalị';

  @override
  String get navSchedule => 'Oge ọgwụ';

  @override
  String get navFastLog => 'Ndekọ ngwa ngwa';

  @override
  String get navMyMeds => 'Ọgwụ m';

  @override
  String get navHealth => 'Ahụike';

  @override
  String toastDoseLogged(String medication) {
    return 'E dekọọla na i weere $medication.';
  }

  @override
  String toastSnoozedUntil(String time) {
    return 'E yigharịala. Anyị ga-akpọ ọzọ na $time.';
  }

  @override
  String get snoozeLimitReached =>
      'Ị gafeela oke iyigharị. Biko were ọgwụ a ma ọ bụ wụfee ya.';

  @override
  String get sosTitle => 'Ọkwa Mberede';

  @override
  String get sosNoCaregiver =>
      'Ị tinyebeghị onye nlekọta. Tinye onye anyị nwere ike iziga ozi ma ọ bụ kpọọ maka gị n\'oge mberede.';

  @override
  String get addCaregiver => 'Tinye onye nlekọta';

  @override
  String sosBody(String name) {
    return 'Zipu SMS ma ọ bụ kpọọ $name. SMS na-arụ ọrụ n\'enweghị data ekwentị.';
  }

  @override
  String sosMessage(String patient) {
    return 'NGWA NGWA site na Remedi: $patient chọrọ enyemaka. Biko kpọọ ma ọ bụ gaa lee ya ugbu a.';
  }

  @override
  String sosDoseMessage(String patient, String medication, String time) {
    return 'Ọkwa Remedi: $patient egosibeghị na o weere $medication nke kwesịrị na $time. Biko gaa lee ya.';
  }

  @override
  String sosSendSms(String name) {
    return 'Zipu $name SMS';
  }

  @override
  String sosCall(String name) {
    return 'Kpọọ $name';
  }

  @override
  String get skipTitle => 'Họrọ ihe kpatara iwụfe ọgwụ';

  @override
  String get skipAuditNote =>
      'A na-edekọ ọgwụ niile a wụfere n\'ndekọ dị n\'ekwentị gị ka dọkịta gị nyochaa ọgwụ gị.';

  @override
  String skipAuditNoteDoctor(String doctor) {
    return 'A na-edekọ ọgwụ niile a wụfere n\'ndekọ dị n\'ekwentị gị ka $doctor nyochaa ọgwụ gị.';
  }

  @override
  String get confirmSkip => 'Kwado iwụfe a';

  @override
  String get skipRecorded => 'E dekọọla iwụfe a n\'ekwentị gị.';

  @override
  String get logSymptomTitle => 'Kedu ka ahụ dị gị?';

  @override
  String get logSymptomHint =>
      'Họrọ ihe ị hụrụ. A ga-etinye ya na nchịkọta nleta dọkịta gị.';

  @override
  String symptomLogged(String symptom) {
    return 'E dekọọla $symptom.';
  }

  @override
  String goodMorning(String name) {
    return 'Ụtụtụ ọma, $name';
  }

  @override
  String goodAfternoon(String name) {
    return 'Ehihie ọma, $name';
  }

  @override
  String goodEvening(String name) {
    return 'Mgbede ọma, $name';
  }

  @override
  String get emptyScheduleTitle => 'Enwebeghị ọgwụ';

  @override
  String get emptyScheduleBody =>
      'Tinye ọgwụ mbụ gị, Remedi ga-akpọ mkpu n\'oge, ọbụlagodi n\'enweghị netwọk.';

  @override
  String get addMedicine => 'Tinye Ọgwụ';

  @override
  String get laterToday => 'Ma emechaa taa';

  @override
  String dosesPending(String count) {
    return '$count na-eche';
  }

  @override
  String get sosButton => 'SOS Mberede / Kpọtụrụ Onye Nlekọta (SMS)';

  @override
  String get moodAllDone => 'Emechaala ya niile!';

  @override
  String get moodGood => 'Ọ na-aga nke ọma!';

  @override
  String get moodStart => 'Ka anyị malite.';

  @override
  String get noDosesToday => 'Enweghị ọgwụ a haziri maka taa.';

  @override
  String dosesDoneOf(String done, String total) {
    return 'Ị weerela $done n\'ime ọgwụ $total taa.';
  }

  @override
  String snoozedUntil(String time) {
    return 'E yigharịrị ruo $time';
  }

  @override
  String overdueBy(String minutes) {
    return 'Oge agafeela nkeji $minutes';
  }

  @override
  String get dueNow => 'Oge eruola';

  @override
  String dueInMinutes(String minutes) {
    return 'Ọ ga-eru n\'ime nkeji $minutes';
  }

  @override
  String dueAt(String time) {
    return 'Oge ya: $time';
  }

  @override
  String get upNext => 'Nke na-esote';

  @override
  String get undo => 'Weghachi';

  @override
  String routineOf(String slot) {
    return 'Usoro $slot';
  }

  @override
  String get fullGlassWater => 'Iko mmiri zuru ezu';

  @override
  String get markAsTaken => 'Eweela m ya';

  @override
  String get snooze15 => 'Yigharịa 15m';

  @override
  String get noSnoozesLeft => 'Enweghị iyigharị fọdụrụ';

  @override
  String get skipOrSideEffect => 'Mmetụta ọjọọ / Wụfee';

  @override
  String get allDoneTitle => 'E weela ọgwụ niile taa';

  @override
  String get allDoneBody =>
      'Ị mere nke ọma. Ịgbaso ya kwa ụbọchị na-echekwa ahụike gị.';

  @override
  String get completedEarlier => 'Emechara na mbụ';

  @override
  String takenCount(String count) {
    return 'E weere $count';
  }

  @override
  String get statusDone => 'Emechaala';

  @override
  String get statusSkipped => 'A wụfere';

  @override
  String get statusMissed => 'Atụfuru';

  @override
  String get tookItLate => 'Eweela m ya';

  @override
  String get doctorDirective => 'Ntụziaka Dọkịta';

  @override
  String forMedication(String medication) {
    return 'Maka $medication';
  }

  @override
  String get viewDetails => 'Lee nkọwa';

  @override
  String get asNeededMeds => 'Ọgwụ mgbe ọ dị mkpa';

  @override
  String tookPrn(String medication) {
    return 'E weere $medication';
  }

  @override
  String get alarmAlert => 'Mkpu Ncheta';

  @override
  String get doseNotFound => 'Achọtaghị ọgwụ a';

  @override
  String get doseNotFoundBody =>
      'Ọ ga-abụ na a gbanweela ma ọ bụ wepụ ncheta a.';

  @override
  String get scheduledDose => 'Ọgwụ a haziri';

  @override
  String doseXofY(String index, String total) {
    return 'Ọgwụ $index n\'ime $total taa';
  }

  @override
  String get prescribedFor => 'E dere ya maka:';

  @override
  String get routeOral => 'Site n\'ọnụ';

  @override
  String get criticalDirective => 'Ntụziaka Dọkịta Dị Oke Mkpa';

  @override
  String get directiveWithMeal =>
      'Were ya ya na nri gị ma ọ bụ ozugbo i risịrị nri';

  @override
  String get directiveAfterFood => 'Were ya n\'ime otu awa mgbe i risịrị nri';

  @override
  String get directiveBeforeFood => 'Were ya nkeji 30 tupu i rie nri';

  @override
  String get directiveEmpty => 'Were ya n\'afọ efu, ya na iko mmiri zuru ezu';

  @override
  String get directiveWater => 'Were ya ya na ọtụtụ mmiri dị ọcha';

  @override
  String get accountabilityTitle => 'Nkwenye Na I Weere Ya';

  @override
  String get accountabilityBody =>
      'Kwado na i weere ya n\'ezie tupu i mechie ọgwụ a.';

  @override
  String confirmSwallowed(String units) {
    return 'Eloola m $units ya na iko mmiri zuru ezu';
  }

  @override
  String confirmApplied(String units) {
    return 'Etehịala m $units';
  }

  @override
  String confirmInjected(String units) {
    return 'Eweela m $units';
  }

  @override
  String confirmInhaled(String units) {
    return 'Ekurula m $units site na inhaler m';
  }

  @override
  String get preventsEscalation => 'Na-akwụsị ọkwa onye nlekọta maka ọgwụ a';

  @override
  String get iHaveTakenThisDose => 'Eweela m Ọgwụ A';

  @override
  String snoozeWithRemaining(String count) {
    return 'Yigharịa nkeji 15 ($count ga-afọdụ)';
  }

  @override
  String get skipDoseRequiresReason => 'Wụfee ọgwụ (chọrọ ihe kpatara ya)';

  @override
  String get overdueAlarm => 'Oge ọgwụ agafeela';

  @override
  String get urgentAlarm => 'Mkpu ngwa ngwa';

  @override
  String get offlineVerified => 'Enyochaala • na-arụ n\'enweghị netwọk';

  @override
  String get ringing => 'Ọ na-akpọ mkpu';

  @override
  String get alreadyTaken => 'E dekọọla na e weere ọgwụ a';

  @override
  String get alreadySkipped => 'A wụfere ọgwụ a';

  @override
  String loggedAt(String time) {
    return 'E dekọrọ na $time';
  }

  @override
  String get caregiverSetupPrompt =>
      'Tinye onye nlekọta ka a gwa mmadụ ma ọ bụrụ na i chefuo ọgwụ.';

  @override
  String get caregiverFailSafe => 'Nchekwa Onye Nlekọta';

  @override
  String minutesQueue(String minutes) {
    return 'Ichere ${minutes}m';
  }

  @override
  String caregiverFailSafeBody(String time) {
    return 'Ọ bụrụ na e kwadoghị ya tupu $time, Remedi ga-agwa gị ka i zipu ọkwa SMS (na-enweghị ịntanetị) nye:';
  }

  @override
  String get caregiverAlertsOff =>
      'Ọkwa onye nlekọta gbanyụrụ. Ị ka nwere ike iziga ha ozi:';

  @override
  String get cameraUnavailable => 'Kamera adịghị n\'ekwentị a.';

  @override
  String get analyzingPrescription => 'Ọ na-agụ ederede n\'ekwentị gị…';

  @override
  String scanFound(String medication) {
    return 'Achọtara $medication. Lelee nkọwa dị n\'okpuru.';
  }

  @override
  String get scanNotRecognized => 'Anyị amataghị ọgwụ a. Biko kwado aha ya.';

  @override
  String get confirmMedicine => 'Kwado ọgwụ';

  @override
  String get instantIntake => 'Ntinye Ngwa Ngwa';

  @override
  String get addNewMedicine => 'Tinye Ọgwụ Ọhụrụ';

  @override
  String get addNewMedicineHint =>
      'Sere foto akwụkwọ ọgwụ gị, sere igbe ọgwụ, ma ọ bụ gwa anyị aha ya.';

  @override
  String get smartScan => 'Nyocha Ngwa Ngwa';

  @override
  String get works100Offline => 'Na-arụ 100% n\'enweghị ịntanetị';

  @override
  String get onDeviceOcr => 'N\'ekwentị';

  @override
  String get snapAutoFill => 'Sere Foto & Dejupụta';

  @override
  String get chooseFromGallery => 'Họrọ n\'ebe foto';

  @override
  String get voiceNote => 'Ozi Olu';

  @override
  String get voiceNoteHint => 'Kwuo aha ọgwụ na ike ya';

  @override
  String get tapToSpeak => 'Pịa ka i kwuo okwu';

  @override
  String get typeName => 'Dee Aha';

  @override
  String get typeNameHint => 'Chọọ aha ahịa ma ọ bụ aha nkịtị';

  @override
  String get manualEntry => 'Ntinye aka';

  @override
  String get quickPick => 'Họrọ Ọgwụ A Na-ejikarị';

  @override
  String get oneTapAdd => 'Tinye n\'otu mpị';

  @override
  String get readingText => 'Ọ na-agụ…';

  @override
  String get lensReady => 'Kamera Dị Njikere';

  @override
  String get aimInsideBox => 'Tinye ya n\'ime igbe';

  @override
  String get aimHint =>
      'Tụọ ya n\'igbe ọgwụ, mpempe mkpụrụ ọgwụ, ma ọ bụ akwụkwọ ọgwụ dọkịta';

  @override
  String get searchMedicineHint => 'd.m. Metformin, Panadol, Amlodipine';

  @override
  String useCustomMedicine(String name) {
    return 'Tinye \"$name\"';
  }

  @override
  String get useCustomMedicineHint =>
      'Ọ nọghị na ndepụta? Tinye ya na nkọwa nke gị.';

  @override
  String get voiceSheetHint =>
      'Dịka ọmụmaatụ: \"Metformin miligram narị ise\".';

  @override
  String get voiceUnavailable => 'Nghọta olu adịghị. Biko dee aha ya kama.';

  @override
  String get listening => 'Ọ na-ege ntị…';

  @override
  String get tapMicToSpeak => 'Pịa maikrofon ma kwuo okwu.';

  @override
  String useThisMedicine(String medication) {
    return 'Jiri $medication';
  }

  @override
  String get editMedicine => 'Dezie ọgwụ';

  @override
  String get drugNameLabel => 'Aha ọgwụ';

  @override
  String get drugNameHint => 'Aha ahịa ma ọ bụ aha nkịtị';

  @override
  String get strengthLabel => 'Ike ọgwụ & ọnụọgụ';

  @override
  String get strengthHint => 'd.m. 500mg, 5ml';

  @override
  String get doseFormLabel => 'Ụdị ọgwụ';

  @override
  String get requiredField => 'A chọrọ nke a';

  @override
  String get required => 'Dị mkpa';

  @override
  String get saveContinue => 'Chekwaa & gaa n\'ihu';

  @override
  String get addAtLeastOneTime => 'Tinye opekata mpe otu oge ncheta.';

  @override
  String remindersSet(String medication) {
    return 'Edozila ncheta maka $medication.';
  }

  @override
  String get changesSaved => 'Echekwala mgbanwe.';

  @override
  String get editRoutine => 'Dezie Usoro';

  @override
  String get stepScheduleFood => 'Nzọụkwụ 1 n\'ime 2 • Oge & Nri';

  @override
  String get unnamedMedicine => 'Ọgwụ enweghị aha';

  @override
  String get edit => 'Dezie';

  @override
  String get howOften => '1. Ugboro ole ka ị na-ewe ya?';

  @override
  String get tapToSelect => 'Pịa ka ị họrọ';

  @override
  String get foodRoutine => '2. Usoro Nri';

  @override
  String get preventsNausea => 'Na-egbochi ọchịchọ ịgbọ agbọ';

  @override
  String get prnNoReminders =>
      'Ọgwụ mgbe ọ dị mkpa enweghị mkpu. Dekọọ ọgwụ ọ bụla site na taabụ Oge ọgwụ mgbe i weere ya.';

  @override
  String get reminderTimes => '3. Oge Ncheta';

  @override
  String get basedOnRoutine => 'Dabere n\'usoro gị';

  @override
  String get addReminderTime => 'Tinye oge ncheta';

  @override
  String get offlineAlarmsTitle => 'Mkpu Na-enweghị Ịntanetị';

  @override
  String get offlineAlarmsBody =>
      'Mkpu na-akpọ n\'oge ọbụlagodi n\'enweghị netwọk ekwentị ma ọ bụ ịntanetị.';

  @override
  String get saveChanges => 'Chekwaa Mgbanwe';

  @override
  String get saveSetReminders => 'Chekwaa & Dozie Ncheta';

  @override
  String get moreClinicalDetails => 'Nkọwa ahụike ndị ọzọ';

  @override
  String get moreClinicalDetailsHint => '(ndetu dọkịta, ịzụkwa ọgwụ; nhọrọ)';

  @override
  String doseSlotLabel(String number, String slot) {
    return 'Ọgwụ $number • $slot';
  }

  @override
  String get adjustTime => 'Gbanwee oge';

  @override
  String get doseAmount => 'Ọtụtụ ọgwụ';

  @override
  String get removeTime => 'Wepụ oge';

  @override
  String get nameStrengthRequired => 'A chọrọ aha ọgwụ na ike ya.';

  @override
  String get clinicalDetails => 'Nkọwa Ahụike';

  @override
  String get safeIntakeProtocol => 'Usoro Nchekwa Iwere Ọgwụ';

  @override
  String get clinicalDetailsTitle => 'Nkọwa Ọrịa & Akwụkwọ Ọgwụ';

  @override
  String clinicalDetailsStep(String medication) {
    return 'Nzọụkwụ 2 n\'ime 2: Nkọwa ahụike maka $medication';
  }

  @override
  String get whyExtraTime => 'Ihe kpatara nke a ji ewe oge';

  @override
  String get whyExtraTimeBody =>
      'Itinye nchọpụta ọrịa, ntụziaka dọkịta na ọnụọgụ ọgwụ n\'ụzọ ziri ezi na-eme ka mkpu gị, ịdọ aka ná ntị maka ịzụkwa ọgwụ na nchịkọta dọkịta gị ziri ezi, ọbụlagodi mgbe netwọk adịghị ma ọlị.';

  @override
  String get diagnosedContext => 'Ọrịa A Chọpụtara';

  @override
  String get conditionLabel => 'Ọrịa a chọpụtara';

  @override
  String get conditionHint => 'd.m. Ọbara mgbali elu, Ọrịa shuga ụdị 2';

  @override
  String get facilityLabel => 'Ụlọ ọgwụ / Ebe ọgwụgwọ';

  @override
  String get facilityHint => 'd.m. Lagoon Hospital, Ikoyi';

  @override
  String get prescriberLabel => 'Dọkịta nyere ọgwụ';

  @override
  String get prescriberHint => 'd.m. Dr. Adeleke';

  @override
  String get specialtyLabel => 'Ngalaba ọkachamara';

  @override
  String get specialtyHint => 'd.m. Ọrịa obi (Cardiology)';

  @override
  String get doctorPhoneLabel => 'Ekwentị dọkịta / ụlọ ọgwụ';

  @override
  String get prescriptionDetails => 'Nkọwa Akwụkwọ Ọgwụ';

  @override
  String get doctorInstructionsLabel => 'Ntụziaka dọkịta';

  @override
  String get doctorInstructionsHint => 'd.m. Ṅụọ iko mmiri abụọ zuru ezu na ya';

  @override
  String get pillDescriptionLabel => 'Otú ọgwụ ahụ dị';

  @override
  String get pillDescriptionHint =>
      'd.m. Mkpụrụ ọgwụ ọcha dị ogologo nwere \'M 500\'';

  @override
  String get rxNumberLabel => 'Nọmba akwụkwọ ọgwụ';

  @override
  String get prescriptionBackup => 'Nchekwa Akwụkwọ Ọgwụ';

  @override
  String get noPrescriptionPhoto => 'Enwebeghị foto';

  @override
  String get prescriptionSaved => 'Echekwala foto akwụkwọ ọgwụ';

  @override
  String get storedOnDevice => 'Echekwara naanị n\'ekwentị a';

  @override
  String get attachPhoto => 'Tinye foto';

  @override
  String get supplyTracking => 'Nlekọta Ọgwụ Fọdụrụ & Ịzụkwa';

  @override
  String stockLabel(String unit) {
    return '$unit dị n\'aka';
  }

  @override
  String get refillAlertAt => 'Ọkwa ịzụkwa mgbe ọ ruru';

  @override
  String get refillExplainer =>
      'Remedi na-agụda ọnụọgụ n\'ọgwụ ọ bụla i dekọrọ, ma dọọ gị aka ná ntị n\'enweghị ịntanetị mgbe ọgwụ na-agwụ.';

  @override
  String get sideEffectWatchlist => 'Mmetụta Ọjọọ A Ga-ele Anya';

  @override
  String sideEffectWatchlistHint(String medication) {
    return 'Họrọ ihe mgbaàmà dọkịta gị kọwara maka $medication. Ị nwere ike idekọ ha n\'akwụkwọ ahụike gị.';
  }

  @override
  String get encryptedLocal => 'Echekwara naanị n\'ebe nzuzo dị n\'ekwentị gị';

  @override
  String get saveMedicineSetReminders => 'Chekwaa Ọgwụ & Dozie Ncheta';

  @override
  String get backToRoutine => 'Laghachi na Oge & Nri';

  @override
  String get medicineCabinet => 'Igbe Ọgwụ';

  @override
  String activeCount(String count) {
    return '$count a na-ewe';
  }

  @override
  String get search => 'Chọọ';

  @override
  String get cabinetHint =>
      'Ọgwụ dọkịta nyere gị, ntụziaka iji ha nke ọma na nlekọta ịzụkwa.';

  @override
  String get searchCabinet => 'Chọọ ọgwụ gị';

  @override
  String filterAll(String count) {
    return 'Niile ($count)';
  }

  @override
  String get emptyCabinetTitle => 'Igbe ọgwụ gị tọgbọ chakoo';

  @override
  String get noMedsInCategory => 'Enweghị ọgwụ n\'ụdị a';

  @override
  String get noMedsInCategoryBody =>
      'Pịa \'Niile\' ka ị hụ ndepụta gị ma ọ bụ tinye ọgwụ maka oge a n\'ụbọchị.';

  @override
  String get offlineSynchronized => 'Echekwara n\'Ekwentị';

  @override
  String get offlineSynchronizedBody =>
      'Kaadị nchekwa akwụkwọ ọgwụ dị n\'ekwentị gị ka i lee ha ọbụlagodi n\'enweghị netwọk.';

  @override
  String get supplyNotTracked => 'A naghị agụ ọgwụ fọdụrụ';

  @override
  String get lowSupply => 'Ọgwụ na-agwụ';

  @override
  String daysLeft(String days) {
    return 'Ụbọchị $days fọdụrụ';
  }

  @override
  String get goodSupply => 'Ọgwụ zuru ezu';

  @override
  String get savedOnDevice => 'Echekwara n\'ekwentị a';

  @override
  String get details => 'Nkọwa';

  @override
  String refillMessage(String medication, String rx, String patient) {
    return 'Ndewo, achọrọ m ịzụkwa $medication$rx maka $patient. Daalụ.';
  }

  @override
  String refillSubject(String medication) {
    return 'Arịrịọ ịzụkwa ọgwụ: $medication';
  }

  @override
  String get activeRx => 'Rx a na-ewe';

  @override
  String get supplyTracker => 'Nlekọta Ọgwụ Fọdụrụ';

  @override
  String daysRemaining(String days) {
    return 'Ụbọchị $days fọdụrụ';
  }

  @override
  String refillBy(String date) {
    return 'Zụkwaa tupu $date';
  }

  @override
  String get prescriber => 'Dọkịta nyere ọgwụ';

  @override
  String get clinicalInstructions => 'Ntụziaka Ahụike';

  @override
  String get requestRefill => 'Rịọ Ịzụkwa n\'Ụlọ Ahịa Ọgwụ';

  @override
  String get openFullDetails => 'Mepee nkọwa zuru ezu';

  @override
  String get editMedicationDetails => 'Dezie Nkọwa Ọgwụ';

  @override
  String get medicationDetail => 'Nkọwa Ọgwụ';

  @override
  String get medicineNotFound => 'Achọtaghị ọgwụ';

  @override
  String get updateStock => 'Melite ọgwụ fọdụrụ';

  @override
  String get updateStockHint =>
      'Ole ka i nwere ugbu a? Pịa ọnụọgụ ịzụkwa ka i tinye ya.';

  @override
  String get save => 'Chekwaa';

  @override
  String get stockUpdated => 'Emeliteela ọgwụ fọdụrụ.';

  @override
  String stopMedicineTitle(String medication) {
    return 'Kwụsị $medication?';
  }

  @override
  String get stopMedicineBody =>
      'Ncheta ga-akwụsị. A ga-echekwa akụkọ ọgwụ gị ka dọkịta gị lee ya. Kwụsị ọgwụ naanị ma ọ bụrụ na dọkịta gị gwara gị.';

  @override
  String get stopMedicine => 'Kwụsị ọgwụ';

  @override
  String medicineStopped(String medication) {
    return 'Akwụsịla $medication. Akagbuola ncheta.';
  }

  @override
  String get backToCabinet => 'Laghachi n\'Igbe Ọgwụ';

  @override
  String get encryptedLocalRecord => 'Ndekọ nzuzo n\'ekwentị';

  @override
  String get remainingSupply => 'Ọgwụ Fọdụrụ';

  @override
  String get notTracked => 'A naghị agụ ya';

  @override
  String get pillIdentifier => 'Njirimara Ọgwụ';

  @override
  String get seePrescriptionPhoto => 'Lee foto akwụkwọ ọgwụ';

  @override
  String get dosageRoutine => 'Usoro Iwere Ọgwụ';

  @override
  String perIntake(String units) {
    return '$units n\'otu oge';
  }

  @override
  String perDay(String amount) {
    return '$amount/ụbọchị';
  }

  @override
  String get safetyInteractions => 'Nchekwa & Mmekọrịta Ọgwụ';

  @override
  String get offlineSafetyDb => 'Ntụaka dị n\'ekwentị, ọ dịghị mkpa ịntanetị';

  @override
  String get notInReference => 'Ọ nọghị na ntụaka dị n\'ekwentị';

  @override
  String get noKnownClash => 'Achọtaghị mmekọrịta ọjọọ a maara';

  @override
  String get noOtherMeds => 'I nweghị ọgwụ ọzọ ị na-ewe ugbu a.';

  @override
  String checkedAgainst(String medications) {
    return 'E lere ya na: $medications';
  }

  @override
  String get checked => 'Enyochaala';

  @override
  String interactionWith(String medication) {
    return 'Mmekọrịta ya na $medication';
  }

  @override
  String get askDoctor => 'Jụọ dọkịta';

  @override
  String get caution => 'Kpachara anya';

  @override
  String get dietWarning => 'Ịdọ Aka Ná Ntị Maka Nri & Mmanya';

  @override
  String get missedDoseTitle => 'Gịnị ka ị ga-eme ma ọ bụrụ na i chefuru ọgwụ?';

  @override
  String get missedDoseGeneric =>
      'Were ya ozugbo i chetara. Ọ bụrụ na oge ọgwụ na-esote eruola nso, hapụ nke i chefuru. Ewela ọgwụ okpukpu abụọ n\'otu mgbe ma ọlị.';

  @override
  String get storageUse => 'Nchekwa & iji ya';

  @override
  String get referenceDisclaimer =>
      'Ndụmọdụ izugbe naanị. Mgbe niile, soro ntụziaka dọkịta gị ma ọ bụ onye ọkachamara ọgwụ.';

  @override
  String get prescriptionOrigin => 'Ebe Akwụkwọ Ọgwụ Si';

  @override
  String get prescriberUnknown => 'E tinyebeghị dọkịta nyere ọgwụ';

  @override
  String get callClinic => 'Kpọọ ụlọ ọgwụ';

  @override
  String get add => 'Tinye';

  @override
  String get emergencyResponder => 'Onye Enyemaka Mberede';

  @override
  String get smsLinked => 'Ejikọọla SMS';

  @override
  String logDoseNow(String units) {
    return 'Dekọọ Ọgwụ Ugbu a ($units)';
  }

  @override
  String get refillSms => 'SMS Ịzụkwa Ọgwụ';

  @override
  String get editRoutineBtn => 'Dezie Usoro';

  @override
  String get logSideEffect => 'Dekọọ mmetụta ọjọọ';

  @override
  String get bpNormal => 'Nkịtị';

  @override
  String get bpElevated => 'Ọ rịgoro elu ntakịrị';

  @override
  String get bpStage1 => 'Elu • Ọkwa 1';

  @override
  String get bpStage2 => 'Elu • Ọkwa 2';

  @override
  String get bpCrisis => 'Ọkwa ihe ize ndụ';

  @override
  String get bpCrisisAdvice =>
      'Ihe a tụrụ dị oke elu. Zuo ike nkeji 5, wee tụgharịa tụọ ya. Ọ bụrụ na ọ ka dị elu ma ọ bụ ahụ adịghị gị mma, chọọ enyemaka ahụike mberede ozugbo.';

  @override
  String get enterBothValues => 'Tinye ọnụọgụ abụọ ahụ.';

  @override
  String get enterValue => 'Tinye ọnụọgụ.';

  @override
  String get valueLooksWrong =>
      'Ọnụọgụ ahụ yiri ka ọ dịghị mma. Biko lelee ma nwaa ọzọ.';

  @override
  String get vitalSaved => 'Echekwala ihe a tụrụ.';

  @override
  String get logVitalTitle => 'Dekọọ ihe a tụrụ';

  @override
  String get systolic => 'Nke elu (systolic)';

  @override
  String get diastolic => 'Nke ala (diastolic)';

  @override
  String get saveReading => 'Chekwaa ihe a tụrụ';

  @override
  String get bloodPressure => 'Mgbali ọbara';

  @override
  String get bloodSugar => 'Shuga ọbara';

  @override
  String get heartRate => 'Ọkụkụ obi';

  @override
  String get weight => 'Ịdị arọ';

  @override
  String get steps => 'Nzọụkwụ';

  @override
  String get myHealth => 'Ahụike m';

  @override
  String get doctorVisitTitle => 'Nchịkọta Nleta Dọkịta';

  @override
  String get doctorVisitBody =>
      'Buru ndekọ ọgwụ na ahụike gị niile gaa nleta gị na-esote. Ọ dịghị mkpa data ekwentị.';

  @override
  String get generateSummary => 'Mepụta Nchịkọta Nleta Dọkịta (PDF / QR)';

  @override
  String get offlineDataVault => 'Ebe Nchekwa Data n\'Ekwentị';

  @override
  String get localAndPrivate => 'Nzuzo & echekwara n\'ekwentị a';

  @override
  String pendingCount(String count) {
    return '$count na-eche';
  }

  @override
  String vaultBody(String count) {
    return 'Ndekọ ọgwụ na ahụike niile dị n\'ekwentị a. Mgbanwe $count na-eche ka e chekwaa ha na cloud ozugbo agbanyere ya.';
  }

  @override
  String get attemptSync => 'Mekọrịta Ugbu a';

  @override
  String get cloudSyncNotConfigured =>
      'Agbanyebeghị nchekwa cloud. Data gị dị mma n\'ekwentị a.';

  @override
  String get noDataYet => 'Enwebeghị data';

  @override
  String get excellent => 'Ọ dị mma nke ukwuu';

  @override
  String get good => 'Ọ dị mma';

  @override
  String get needsAttention => 'Chọrọ nlebara anya';

  @override
  String get adherence30 => 'Ịgbaso ọgwụ ụbọchị 30';

  @override
  String get target90 => 'ebumnuche ≥90%';

  @override
  String get currentStreak => 'Ụbọchị n\'usoro ugbu a';

  @override
  String get days => 'ụbọchị';

  @override
  String onTimeRate(String percent) {
    return 'E weere $percent% n\'oge';
  }

  @override
  String get weeklyRoutine => 'Usoro Izu';

  @override
  String missedThisWeek(String count) {
    return 'Ọgwụ $count atụfuru n\'izu a';
  }

  @override
  String get last7Days => 'Ụbọchị 7 gara aga';

  @override
  String get legendOnTime => 'N\'oge';

  @override
  String get legendLate => 'Oge gafere';

  @override
  String get legendMissed => 'Atụfuru / a wụfere';

  @override
  String get languageCardTitle => 'Asụsụ & Olu';

  @override
  String get languageCardBody =>
      'Ncheta na mkpu na-eji asụsụ i họrọ, ọbụlagodi mgbe ịntanetị adịghị kpam kpam.';

  @override
  String get vitalsQuickLogger => 'Ndekọ Ahụike Ngwa Ngwa';

  @override
  String get seeTrends => 'Lee otú ọ na-aga';

  @override
  String get noVitalsYet =>
      'Enwebeghị ihe a tụrụ. Dekọọ mgbali ọbara ma ọ bụ shuga gị ka i soro otú ọ na-aga.';

  @override
  String get logBpOrSugar => 'Dekọọ Mgbali Ọbara ma ọ bụ Shuga';

  @override
  String get otherMedicines => 'Ọgwụ ndị ọzọ';

  @override
  String get activeConditions => 'Ọrịa & Usoro Ọgwụ Ugbu a';

  @override
  String conditionsCount(String count) {
    return 'Otu $count';
  }

  @override
  String since(String date) {
    return 'Kemgbe $date';
  }

  @override
  String refillInDays(String days) {
    return 'Ịzụkwa: ụbọchị $days';
  }

  @override
  String lowSupplyNotice(String medication, String amount) {
    return 'Ọgwụ na-agwụ: $medication, naanị $amount fọdụrụ';
  }

  @override
  String get orderRefill => 'Zụkwaa Ọgwụ';

  @override
  String get symptomsNotes => 'Ihe Mgbaàmà & Ndetu';

  @override
  String get noSymptoms =>
      'Enweghị ihe mgbaàmà e dekọrọ n\'ime ụbọchị 30 gara aga.';

  @override
  String get healthSynced => 'Emekọrịtala data ahụike n\'ekwentị a.';

  @override
  String get healthConnectMissing =>
      'Etinyeghị Health Connect. A na-emepe ụlọ ahịa…';

  @override
  String get healthUnavailable => 'Data ahụike adịghị n\'ekwentị a.';

  @override
  String get healthDenied =>
      'E nyeghị ikike. Ị nwere ike ikwe ya na ntọala ekwentị gị.';

  @override
  String bpAfterDose(String minutes, String medication) {
    return 'E dekọrọ ya nkeji $minutes mgbe i weresịrị $medication.';
  }

  @override
  String get vitalsAndSync => 'Ahụike & Mmekọrịta';

  @override
  String get connectedActive => 'Ejikọọla & Na-arụ ọrụ';

  @override
  String get notConnected => 'Ejikọghị';

  @override
  String get syncNow => 'Mekọrịta Ugbu a';

  @override
  String get connect => 'Jikọọ';

  @override
  String get onDeviceOnly => 'A na-arụ ya naanị n\'ekwentị gị • enweghị cloud';

  @override
  String get restingHeartRate => 'Ọkụkụ Obi Mgbe Ị Na-ezu Ike';

  @override
  String bpmRange(String min, String max) {
    return '$min – $max BPM';
  }

  @override
  String get bpmAvg7d => 'BPM nkezi (ụbọchị 7)';

  @override
  String get noHeartData =>
      'Enweghị ọkụkụ obi e dekọrọ n\'ime ụbọchị 7 gara aga.';

  @override
  String get connectToSeeHeart =>
      'Jikọọ app ahụike gị ka i hụ ọkụkụ obi site n\'elekere aka ma ọ bụ ekwentị gị.';

  @override
  String get dailyMobility => 'Njegharị Kwa Ụbọchị';

  @override
  String goalSteps(String steps) {
    return 'Ebumnuche $steps';
  }

  @override
  String stepsDistance(String km) {
    return 'Ihe dị ka $km km taa';
  }

  @override
  String get pillVitalsHarmony => 'Ọgwụ & Ahụike Ọnụ';

  @override
  String get harmonyPrivacy =>
      'A na-ejikọ ihe a tụrụ na ndekọ ọgwụ gị n\'ekwentị a. Ọ dịghị ihe a na-ezipụ.';

  @override
  String get bloodPressureCheck => 'Nlele Mgbali Ọbara';

  @override
  String get offlineBiometricCache => 'Nchekwa Ahụike n\'Ekwentị';

  @override
  String biometricPoints(String count) {
    return 'Ihe a tụrụ $count echekwara nke ọma n\'ekwentị a.';
  }

  @override
  String get autoSyncOnOpen => 'Mekọrịta onwe ya mgbe m mepere Remedi';

  @override
  String get autoSyncOnOpenHint =>
      'Wete ihe ọhụrụ a tụrụ site n\'app ahụike gị oge ọ bụla';

  @override
  String get generateClinicalReport => 'Mepụta Akụkọ Ahụike (PDF & QR)';

  @override
  String get exportPrepared => 'Akwadola nchịkọta n\'ekwentị gị.';

  @override
  String get exportFailed => 'Enweghị ike ịmepụta nchịkọta. Biko nwaa ọzọ.';

  @override
  String get handoverProtocol => 'Nnyefe nye Dọkịta';

  @override
  String get summaryTitle => 'Nchịkọta Ahụike & QR';

  @override
  String get summarySubtitle =>
      'Nnyefe na-enweghị ịntanetị maka nleta ụlọ ọgwụ, nlele mbụ na mberede.';

  @override
  String ageYears(String age) {
    return 'Afọ $age';
  }

  @override
  String bloodGroupValue(String group) {
    return 'Ọbara: $group';
  }

  @override
  String genotypeValue(String genotype) {
    return 'Genotype: $genotype';
  }

  @override
  String get primaryDiagnoses => 'Ọrịa Ndị Bụ Isi';

  @override
  String get noneRecorded => 'Ọ dịghị nke e dekọrọ';

  @override
  String allergiesValue(String allergies) {
    return 'Alaji: $allergies';
  }

  @override
  String get generatedOnDevice => 'Emepụtara n\'ekwentị a';

  @override
  String generatedAt(String time) {
    return 'Emepụtara na $time';
  }

  @override
  String get qrSemantics => 'Koodu QR nwere nchịkọta ahụike gị';

  @override
  String get cameraDecodable => 'Jiri kamera ọ bụla gụọ ya';

  @override
  String get cameraDecodableBody =>
      'O nwere obere nchịkọta data banyere ọgwụ gị, ịgbaso ọgwụ na ahụike gị. Ọ dịghị mkpa netwọk.';

  @override
  String get zeroInternet => 'Ọ Dịghị Mkpa Ịntanetị';

  @override
  String get valid48h => 'Ọ Dị Irè Awa 48';

  @override
  String get dossierHighlights => 'Isi Ihe Ahụike';

  @override
  String get last30Days => 'Ụbọchị 30 Gara Aga';

  @override
  String get regimenAdherence => 'Ịgbaso Usoro Ọgwụ Ụbọchị 30';

  @override
  String percentOnTime(String percent) {
    return '$percent% N\'oge';
  }

  @override
  String get takenShort => 'e weere';

  @override
  String get vitalsCorrelation => 'Nchịkọta Ahụike';

  @override
  String get bpAverage => 'Nkezi Mgbali Ọbara';

  @override
  String readingsCount(String count) {
    return 'Ihe a tụrụ $count';
  }

  @override
  String get systolicTrend =>
      'Otú systolic si aga (ihe a tụrụ n\'oge na-adịbeghị anya)';

  @override
  String checksumLabel(String checksum) {
    return 'Nlele izi ezi: $checksum';
  }

  @override
  String get savePrintPdf => 'Chekwaa PDF / Bipụta Nchịkọta';

  @override
  String get shareNearby =>
      'Kekọrịta site na Bluetooth, AirDrop ma ọ bụ WhatsApp';

  @override
  String get privacyNotice =>
      'Ndekọ ahụike gị na-anọ n\'ekwentị a. Ọ dịghị ihe a na-ezipụ ma ọ bụrụ na ị họrọghị ikekọrịta nchịkọta a.';

  @override
  String get welcomeTitle => 'Nnọọ na Remedi';

  @override
  String get welcomeBody =>
      'Ncheta ọgwụ na-arụ ọrụ n\'enweghị netwọk, n\'asụsụ nke gị.';

  @override
  String get continueLabel => 'Gaa n\'ihu';

  @override
  String get back => 'Laghachi';

  @override
  String get aboutYouTitle => 'Banyere gị';

  @override
  String get aboutYouBody =>
      'Nke a na-anọ n\'ekwentị gị. Ọ na-enyere nchịkọta dọkịta gị na mkpu gị aka ịkpọ gị aha.';

  @override
  String get yourName => 'Aha gị';

  @override
  String get caregiverOptional => 'Onye nlekọta (nhọrọ)';

  @override
  String get caregiverWhy =>
      'Ọ bụrụ na e kwadoghị ọgwụ, Remedi ga-agwa gị ka i zipu ha ọkwa SMS. SMS na-arụ ọrụ n\'enweghị data ekwentị.';

  @override
  String get caregiverName => 'Aha onye nlekọta';

  @override
  String get caregiverRelation => 'Mmekọrịta';

  @override
  String get caregiverRelationHint => 'd.m. Nwa nwoke, Nwa nwanyị, Nọọsụ';

  @override
  String get caregiverPhone => 'Nọmba ekwentị onye nlekọta';

  @override
  String get readyTitle => 'Ka Remedi kpọọrọ gị mkpu';

  @override
  String get readyBody =>
      'Kwe ka ọkwa na mkpu rụọ ọrụ ka ncheta kpọọ n\'oge, ọbụlagodi mgbe ekwentị gị kpọchiri.';

  @override
  String get readyPoint1 => 'Mkpu dị ụda n\'oge ọgwụ ọ bụla, ya na iyigharị';

  @override
  String get readyPoint2 => 'Ihe niile na-arụ 100% n\'enweghị ịntanetị';

  @override
  String get readyPoint3 =>
      'Ọkwa SMS nye onye nlekọta ma ọ bụrụ na atụfuru ọgwụ';

  @override
  String get readyPoint4 => 'Nchịkọta nleta dọkịta nwere PDF na koodu QR';

  @override
  String get enableRemindersStart => 'Gbanye Ncheta & Malite';

  @override
  String get exploreSample => 'Nwalee ya na ọgwụ ihe atụ';

  @override
  String get medicalDisclaimer =>
      'Remedi na-enyere gị aka ịgbaso ntụziaka ọgwụ gị. Ọ dịghị anọchi anya ndụmọdụ dọkịta gị ma ọ bụ onye ọkachamara ọgwụ.';

  @override
  String get titleLabel => 'Utu aha';

  @override
  String get dateOfBirth => 'Ụbọchị ọmụmụ';

  @override
  String get sex => 'Okike';

  @override
  String get female => 'Nwanyị';

  @override
  String get male => 'Nwoke';

  @override
  String get bloodGroup => 'Ụdị ọbara';

  @override
  String get genotype => 'Genotype';

  @override
  String get allergies => 'Alaji';

  @override
  String get allergiesHint => 'd.m. Penicillin, ọgwụ Sulfa';

  @override
  String get caregiverAlertsToggle => 'Ọkwa nchekwa onye nlekọta';

  @override
  String get caregiverAlertsToggleHint =>
      'Chetara m iziga onye nlekọta m ozi mgbe e kwadoghị ọgwụ';

  @override
  String get alertAfter => 'Zipu ọkwa mgbe';

  @override
  String minutesShort(String minutes) {
    return 'Nkeji $minutes';
  }

  @override
  String get appSettings => 'Ntọala app';

  @override
  String get alarmPermissions => 'Ikike mkpu & ọkwa';

  @override
  String get alarmPermissionsHint => 'Hụ na ncheta nwere ike ịkpọ n\'oge';

  @override
  String get alarmsArmed => 'Mkpu adịla njikere.';

  @override
  String get alarmsBlocked =>
      'Egbochiri ọkwa. Biko kwe ka ha rụọ ọrụ na ntọala ekwentị.';

  @override
  String get remiName => 'Remi';

  @override
  String get remiLoading => 'Remi na-akwadebe ihe…';

  @override
  String get offlineVault => 'Igbe 100% n\'enweghị ịntanetị';

  @override
  String get splashTagline => 'Enyi ahụike gị na-arụ ọrụ n\'enweghị ịntanetị';

  @override
  String get splashVault => 'Igbe ọgwụ nzuzo gị';

  @override
  String get splashFormulary => 'Ndepụta ọgwụ dị na ekwentị';

  @override
  String get splashScanner => 'Igwe na-agụ ederede na ekwentị';

  @override
  String get splashAlarms => 'Mkpu ọgwụ na-enweghị netwọk';

  @override
  String get splashReady => 'Ihe niile adịla njikere';

  @override
  String get splashPreparing => 'Anyị na-akwadebe igbe gị…';

  @override
  String get statusReady => 'Ọ dị njikere';

  @override
  String get statusLoading => 'Ọ na-ebu…';

  @override
  String get statusWaiting => 'Ọ na-eche';

  @override
  String get zeroTelemetryTitle => 'Nkwa: Enweghị nsochi';

  @override
  String get zeroTelemetryBody =>
      'Usoro ọgwụ gị, akwụkwọ dọkịta na ndekọ ọgwụ gị na-anọ naanị na ekwentị a. Remedi na-arụ ọrụ nke ọma n\'enweghị netwọk ma ọ bụ Wi-Fi.';

  @override
  String get openDoseStation => 'Mepee Ọdụ Ọgwụ Kwa Ụbọchị';

  @override
  String get getStarted => 'Ka anyị malite';

  @override
  String get worksOffline => 'Ọ na-arụ ọrụ n\'enweghị ịntanetị';

  @override
  String get skip => 'Wụfee';

  @override
  String get offlineActive => '100% n\'enweghị ịntanetị';

  @override
  String get obStep1Label => 'Nzọụkwụ 1 n\'ime 3';

  @override
  String get obStep2Label => 'Nzọụkwụ 2 n\'ime 3 • Itinye ngwa ngwa';

  @override
  String get obStep3Label => 'Nzọụkwụ 3 n\'ime 3 • Nchekwa na Nhazi';

  @override
  String get remiIntroBefore => '“Ndewo! Abụ m ';

  @override
  String get remiIntroAfter =>
      '. Aga m ahụ na ị gaghị echefu ọgwụ ọ bụla, ọbụlagodi mgbe ịntanetị adịghị ma ọlị!”';

  @override
  String get alwaysReady => 'Na-adị njikere mgbe niile';

  @override
  String get obStep1Title => 'Ncheta ọgwụ nke ghọtara otu ị si ebi ndụ.';

  @override
  String get obStep1Body =>
      'Ọ bụghị mkpu siri ike nke ụlọ ọgwụ. Anyị na-ejikọ ọgwụ gị na nri ụtụtụ, nri ehihie na oge ụra ka ilekọta onwe gị dị mfe.';

  @override
  String get morningRoutine => 'Usoro Ụtụtụ';

  @override
  String get withBreakfast => 'Ya na nri ụtụtụ';

  @override
  String get remiVerified => 'Remi akwadola ya';

  @override
  String get offlineReliable => '100% a pụrụ ịtụkwasị obi n\'enweghị netwọk';

  @override
  String flexibleTime(String time) {
    return '$time • Ị nwere ike ịgbanwe ya';
  }

  @override
  String get continueSmartIntake => 'Gaa n\'ihu na Itinye ngwa ngwa';

  @override
  String get smartScanVoice => 'Nyocha Amamihe na Olu';

  @override
  String get obStep2Title => 'Tinye ọgwụ n\'ime sekọnd, ọ bụghị nkeji.';

  @override
  String get obStep2Body =>
      'Ike gwụrụ gị ide aha ọgwụ ogologo? Remedi na-agụ akwụkwọ dọkịta ma na-anụ olu gị, na nzuzo n\'ekwentị gị.';

  @override
  String get snapScriptTitle => 'See foto akwụkwọ dọkịta ma ọ bụ igbe ọgwụ';

  @override
  String get snapScriptSubtitle => 'Ọ na-agụ akara ozugbo';

  @override
  String get scanDemoSubtitle => '500mg Tablet • Site n\'ọnụ';

  @override
  String get recognised => 'Ọ matala ya';

  @override
  String get autoFill => 'Mejupụta onwe ya';

  @override
  String get voiceDictation => 'Kwuo ya n\'olu';

  @override
  String get voiceDictationLangs => 'Bekee, Pidgin, Yorùbá, Igbo na Hausa';

  @override
  String get voiceDemoQuote =>
      '“Otu tablet Lisinopril kwa ụtụtụ mgbe m risịrị akamụ”';

  @override
  String get understoodInstantly => 'Ọ ghọtara ozugbo';

  @override
  String get quickPresets => 'Nhọrọ ngwa ngwa (otu mpịaka)';

  @override
  String get quickPresetsHint => 'Pịa ka o mejupụta usoro ọgwụ a na-ahụkarị';

  @override
  String get remisAdvice => 'Ndụmọdụ Remi';

  @override
  String get remisAdviceBody =>
      '“Echefula ide aha ọgwụ ogologo! Naanị see foto ma ọ bụ gwa m okwu.”';

  @override
  String get nextPeaceOfMind => 'Ọzọ: Udo obi n\'enweghị ịntanetị';

  @override
  String get noPhotosLeave =>
      'Ekwentị gị na-agụ ederede ahụ. Foto ọ bụla anaghị apụ n\'ekwentị gị.';

  @override
  String get healthStaysHere => 'Ahụike gị na-anọ na ekwentị a.';

  @override
  String get zeroCloudTrackers => 'Enweghị ihe nsochi cloud, ma ọlị.';

  @override
  String get obStep3Title => 'Nzuzo zuru oke na QR maka dọkịta ozugbo';

  @override
  String get obStep3Body =>
      'Ihe niile na-anọ na ekwentị gị. Mgbe ị gara ịhụ dọkịta, kesaa QR na PDF n\'enweghị ịntanetị n\'otu mpịaka.';

  @override
  String get whatShouldRemiCallYou => 'Gịnị ka Remi ga-akpọ gị?';

  @override
  String get criticalAlarms => 'Mkpu dị mkpa n\'enweghị ịntanetị';

  @override
  String get essential => 'Dị mkpa';

  @override
  String get criticalAlarmsBody =>
      'Ncheta na-ada ụda n\'oge, ọbụlagodi n\'airplane mode ma ọ bụ mgbe netwọk adịghị.';

  @override
  String healthSyncTitle(String app) {
    return 'Njikọ $app';
  }

  @override
  String get onDevice => 'Na ekwentị';

  @override
  String get healthSyncBody =>
      'Hụ ọkụkụ obi gị na nzọụkwụ kwa ụbọchị n\'akụkụ ọgwụ gị, naanị na ekwentị a.';

  @override
  String get caregiverSmsAlert => 'SMS Ọkwa nye Onye Nlekọta';

  @override
  String get optional => 'Ọ bụghị iwu';

  @override
  String get caregiverSmsAlertBody =>
      'Ọ bụrụ na ị kwadoghị otu ọgwụ, Remi ga-echetara gị izigara onye nlekọta gị SMS.';

  @override
  String get caregiverSmsNote =>
      'SMS ahụ si na SIM gị, naanị mgbe ị pịara ziga.';

  @override
  String get clinicQrMode => 'QR maka ụlọ ọgwụ';

  @override
  String get clinicQrModeBody =>
      'Kesaa nchịkọta gị na dọkịta ọ bụla, na-enweghị njikọ';

  @override
  String get enabled => 'Ọ gbanyere';

  @override
  String get enterRemedi => 'Banye Remedi ma tinye ọgwụ mbụ';

  @override
  String get storedPrivately => 'E chekwara ya na nzuzo na ekwentị a';

  @override
  String get voicePermissionDenied =>
      'Ikike maikrofon ma ọ bụ olu agbanyụọla. Kwe ya na ntọala ekwentị gị, ma ọ bụ dee aha ya kama.';

  @override
  String get voiceNoMatch => 'Anụghị m nke ọma. Pịa maikrofon ma nwaa ọzọ.';

  @override
  String get voiceNetwork =>
      'Ọrụ olu ekwentị gị chọrọ netwọk maka asụsụ a. Nwaa Bekee, ma ọ bụ dee aha ya kama.';

  @override
  String get voiceFailed => 'Olu kwụsịrị na mberede. Biko nwaa ọzọ.';

  @override
  String get voiceNotRecognised =>
      'Anụrụ m gị, mana ahụghị m aha ọgwụ. Nwaa ọzọ ma ọ bụ dee ya.';

  @override
  String get stopListening => 'Kwụsị ige ntị';

  @override
  String get tapToStop => 'Pịa ka ọ kwụsị mgbe ị gwụchara';

  @override
  String get tryAgain => 'Nwaa ọzọ';

  @override
  String get typeInstead => 'Dee ya kama';
}
