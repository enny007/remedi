// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([String locale = 'yo']) : super(locale);

  @override
  String get appName => 'Remedi';

  @override
  String get notifChannelDoses => 'Ìdágìrì oògùn';

  @override
  String get notifChannelDosesDesc =>
      'Ìránnilétí aláriwo nígbà tí àkókò oògùn bá tó';

  @override
  String get notifChannelCare => 'Ìkìlọ̀ ìtọ́jú';

  @override
  String get notifChannelCareDesc => 'Ààbò olùtọ́jú àti ìkìlọ̀ àtúnrà oògùn';

  @override
  String get notifDoseTitle => 'Àkókò oògùn yín ti tó';

  @override
  String get notifSnoozeTitle => 'Ìránnilétí tí a sún síwájú';

  @override
  String notifDoseBody(String medication, String amount) {
    return '$medication • ẹ lo $amount';
  }

  @override
  String get notifCaregiverTitle => 'A kò tíì jẹ́rìí oògùn yìí';

  @override
  String notifCaregiverBody(String medication, String caregiver) {
    return 'A kò tíì jẹ́rìí $medication. Ẹ tẹ̀ ẹ́ láti fi SMS kìlọ̀ fún $caregiver.';
  }

  @override
  String get notifRefillTitle => 'Ẹ ó nílò láti tún oògùn rà láìpẹ́';

  @override
  String notifRefillBody(String count, String medication) {
    return '$count péré ló kù nínú $medication.';
  }

  @override
  String get actionMarkTaken => 'Mo ti lò ó';

  @override
  String get actionSnooze15 => 'Sún síwájú 15m';

  @override
  String get offlineReady => 'Ó ṣetán láìsí íńtánẹ́ẹ̀tì';

  @override
  String get offline => 'Láìsí íńtánẹ́ẹ̀tì';

  @override
  String get changeLanguage => 'Yí èdè padà';

  @override
  String get chooseLanguage => 'Ẹ yan èdè yín';

  @override
  String get chooseLanguageHint =>
      'Ìránnilétí, ìdágìrì àti àwọn ìtọ́sọ́nà yóò lo èdè yìí, kódà láìsí íńtánẹ́ẹ̀tì.';

  @override
  String get profileTitle => 'Profaili & Ètò';

  @override
  String get formTablet => 'Tablet (kóró)';

  @override
  String get formCapsule => 'Capsule';

  @override
  String get formCaplet => 'Caplet';

  @override
  String get formSoftgel => 'Softgel';

  @override
  String get formLiquid => 'Omi oògùn / Síróọ̀pù';

  @override
  String get formDrops => 'Oògùn ìkán';

  @override
  String get formInjection => 'Abẹ́rẹ́';

  @override
  String get formInhaler => 'Inhaler';

  @override
  String get formCream => 'Ìpara / Òróró';

  @override
  String get formSachet => 'Sachet';

  @override
  String get unitMl => 'ml';

  @override
  String get unitDrops => 'ìkán';

  @override
  String get unitInjection => 'abẹ́rẹ́';

  @override
  String get unitPuffs => 'ìfà';

  @override
  String get unitApplication => 'ìpara';

  @override
  String get unitSachet => 'sachet';

  @override
  String get unitPills => 'kóró';

  @override
  String get freqOnce => 'Ẹ̀ẹ̀kan lójúmọ́';

  @override
  String get freqTwice => 'Ẹ̀ẹ̀mejì lójúmọ́';

  @override
  String get freqThrice => 'Ẹ̀ẹ̀mẹ́ta lójúmọ́';

  @override
  String get freqPrn => 'Nígbà tí ó bá yẹ';

  @override
  String get freqOnceHint => 'Ní òwúrọ̀';

  @override
  String get freqTwiceHint => 'Ní gbogbo wákàtí 12';

  @override
  String get freqThriceHint => 'Pẹ̀lú oúnjẹ';

  @override
  String get freqPrnHint => 'Fún àìsàn tó bá dé lójijì';

  @override
  String get mealWith => 'Pẹ̀lú oúnjẹ';

  @override
  String get mealBefore => 'Ṣáájú oúnjẹ';

  @override
  String get mealAfter => 'Lẹ́yìn oúnjẹ';

  @override
  String get mealEmpty => 'Lórí ikùn òfìfo';

  @override
  String get mealWater => 'Pẹ̀lú omi nìkan';

  @override
  String get mealAny => 'Kò sí òfin oúnjẹ';

  @override
  String get mealWithHint => 'Nígbà oúnjẹ tàbí lẹ́sẹ̀kẹsẹ̀ lẹ́yìn rẹ̀';

  @override
  String get mealBeforeHint => 'Ìṣẹ́jú 30 ṣáájú';

  @override
  String get mealAfterHint => 'Láàárín wákàtí 1';

  @override
  String get mealEmptyHint => 'Ife omi kíkún';

  @override
  String get mealWaterHint => 'Ìgbàkígbà, pẹ̀lú omi';

  @override
  String get mealAnyHint => 'Oúnjẹ kò ṣe nǹkan kan';

  @override
  String get skipStomach => 'Inú rírun, ìríra tàbí èébì';

  @override
  String get skipStock => 'Oògùn ti tán tàbí ó sọnù';

  @override
  String get skipDoctor => 'Dókítà mi ní kí n dá a dúró';

  @override
  String get skipOther => 'Ìdí mìíràn';

  @override
  String get slotBreakfast => 'Oúnjẹ àárọ̀';

  @override
  String get slotLunch => 'Oúnjẹ ọ̀sán';

  @override
  String get slotDinner => 'Oúnjẹ alẹ́';

  @override
  String get slotBedtime => 'Àkókò oorun';

  @override
  String get slotCustom => 'Ìránnilétí';

  @override
  String get symptomNausea => 'Ìríra (ìfẹ́ láti bì)';

  @override
  String get symptomDizziness => 'Òòyì';

  @override
  String get symptomDryCough => 'Ikọ́ gbígbẹ';

  @override
  String get symptomFatigue => 'Àárẹ̀';

  @override
  String get symptomHeadache => 'Ẹ̀fọ́rí';

  @override
  String get symptomSwelling => 'Wíwú ọrùn ẹsẹ̀';

  @override
  String get symptomMusclePain => 'Ìrora iṣan';

  @override
  String get symptomDiarrhea => 'Ìgbẹ́ gbuuru';

  @override
  String get symptomLowSugar => 'Ṣúgà ẹ̀jẹ̀ tó lọ sílẹ̀ (gbígbọ̀n, òógùn)';

  @override
  String get symptomRash => 'Èèlá ara';

  @override
  String get symptomStomachPain => 'Ìrora inú';

  @override
  String get partMorning => 'Òwúrọ̀';

  @override
  String get partAfternoon => 'Ọ̀sán';

  @override
  String get partEvening => 'Ìrọ̀lẹ́';

  @override
  String get partNight => 'Alẹ́';

  @override
  String get navSchedule => 'Ètò oògùn';

  @override
  String get navFastLog => 'Àkọsílẹ̀ kíákíá';

  @override
  String get navMyMeds => 'Oògùn mi';

  @override
  String get navHealth => 'Ìlera';

  @override
  String toastDoseLogged(String medication) {
    return 'A ti kọ ọ́ sílẹ̀ pé ẹ ti lo $medication.';
  }

  @override
  String toastSnoozedUntil(String time) {
    return 'A ti sún un síwájú. A ó tún dún ní $time.';
  }

  @override
  String get snoozeLimitReached =>
      'Ẹ ti sún un síwájú tó. Ẹ jọ̀wọ́ ẹ lo oògùn yìí tàbí kí ẹ fò ó.';

  @override
  String get sosTitle => 'Ìkìlọ̀ pàjáwìrì';

  @override
  String get sosNoCaregiver =>
      'Ẹ kò tíì fi olùtọ́jú kún un. Ẹ fi ẹnìkan kún un tí a lè fi ọ̀rọ̀ ránṣẹ́ sí tàbí pè fún yín nígbà pàjáwìrì.';

  @override
  String get addCaregiver => 'Fi olùtọ́jú kún un';

  @override
  String sosBody(String name) {
    return 'Ẹ fi SMS ránṣẹ́ tàbí ẹ pe $name. SMS ń ṣiṣẹ́ láìsí data.';
  }

  @override
  String sosMessage(String patient) {
    return 'PÀJÁWÌRÌ láti Remedi: $patient nílò ìrànlọ́wọ́. Ẹ jọ̀wọ́ ẹ pè é tàbí ẹ lọ wò ó báyìí.';
  }

  @override
  String sosDoseMessage(String patient, String medication, String time) {
    return 'Ìkìlọ̀ Remedi: $patient kò tíì jẹ́rìí pé òun ti lo $medication tí ó yẹ ní $time. Ẹ jọ̀wọ́ ẹ bẹ̀ ẹ́ wò.';
  }

  @override
  String sosSendSms(String name) {
    return 'Fi SMS ránṣẹ́ sí $name';
  }

  @override
  String sosCall(String name) {
    return 'Pe $name';
  }

  @override
  String get skipTitle => 'Ẹ yan ìdí tí ẹ fi fo oògùn';

  @override
  String get skipAuditNote =>
      'Gbogbo oògùn tí ẹ bá fò la ó kọ sílẹ̀ nínú àkọsílẹ̀ yín (láìsí íńtánẹ́ẹ̀tì) fún àyẹ̀wò oògùn dókítà yín.';

  @override
  String skipAuditNoteDoctor(String doctor) {
    return 'Gbogbo oògùn tí ẹ bá fò la ó kọ sílẹ̀ nínú àkọsílẹ̀ yín (láìsí íńtánẹ́ẹ̀tì) fún àyẹ̀wò oògùn $doctor.';
  }

  @override
  String get confirmSkip => 'Jẹ́rìí pé mo fò ó';

  @override
  String get skipRecorded => 'A ti kọ ọ́ sílẹ̀ pé ẹ fo oògùn yìí.';

  @override
  String get logSymptomTitle => 'Báwo lara yín ṣe rí?';

  @override
  String get logSymptomHint =>
      'Ẹ yan ohun tí ẹ ṣàkíyèsí. A ó fi hàn nínú àkópọ̀ fún ìbẹ̀wò dókítà yín.';

  @override
  String symptomLogged(String symptom) {
    return 'A ti kọ $symptom sílẹ̀.';
  }

  @override
  String goodMorning(String name) {
    return 'Ẹ káàárọ̀, $name';
  }

  @override
  String goodAfternoon(String name) {
    return 'Ẹ káàsán, $name';
  }

  @override
  String goodEvening(String name) {
    return 'Ẹ kúùrọ̀lẹ́, $name';
  }

  @override
  String get emptyScheduleTitle => 'Kò sí oògùn kankan síbẹ̀';

  @override
  String get emptyScheduleBody =>
      'Ẹ fi oògùn àkọ́kọ́ yín kún un, Remedi yóò sì dún lásìkò, kódà láìsí nẹ́tíwọ̀ọ̀kì.';

  @override
  String get addMedicine => 'Fi oògùn kún un';

  @override
  String get laterToday => 'Lẹ́yìn-ọ̀-rẹyìn lónìí';

  @override
  String dosesPending(String count) {
    return '$count ló kù';
  }

  @override
  String get sosButton => 'Pàjáwìrì SOS / Kìlọ̀ fún olùtọ́jú (SMS)';

  @override
  String get moodAllDone => 'Gbogbo rẹ̀ ti parí!';

  @override
  String get moodGood => 'Ara mi le!';

  @override
  String get moodStart => 'Ẹ jẹ́ ká bẹ̀rẹ̀.';

  @override
  String get noDosesToday => 'Kò sí oògùn tí a ṣètò fún òní.';

  @override
  String dosesDoneOf(String done, String total) {
    return 'Ẹ ti lo $done nínú $total oògùn lónìí.';
  }

  @override
  String snoozedUntil(String time) {
    return 'A sún un síwájú di $time';
  }

  @override
  String overdueBy(String minutes) {
    return 'Ó ti kọjá àkókò ní ìṣẹ́jú $minutes';
  }

  @override
  String get dueNow => 'Àkókò rẹ̀ ti tó';

  @override
  String dueInMinutes(String minutes) {
    return 'Ní ìṣẹ́jú $minutes sí i';
  }

  @override
  String dueAt(String time) {
    return 'Ní $time';
  }

  @override
  String get upNext => 'Èyí tó kàn';

  @override
  String get undo => 'Dá a padà';

  @override
  String routineOf(String slot) {
    return 'Ètò $slot';
  }

  @override
  String get fullGlassWater => 'Ife omi kíkún';

  @override
  String get markAsTaken => 'Mo ti lò ó';

  @override
  String get snooze15 => 'Sún síwájú 15m';

  @override
  String get noSnoozesLeft => 'Kò sí àǹfààní ìsúnsíwájú mọ́';

  @override
  String get skipOrSideEffect => 'Àbájáde búburú / Fò ó';

  @override
  String get allDoneTitle => 'Ẹ ti lo gbogbo oògùn òní';

  @override
  String get allDoneBody =>
      'Ẹ ṣeun gan-an. Ìtẹ̀síwájú ló ń dáàbò bo ìlera yín.';

  @override
  String get completedEarlier => 'Èyí tí ẹ ti parí';

  @override
  String takenCount(String count) {
    return 'Ẹ ti lo $count';
  }

  @override
  String get statusDone => 'Ó ti parí';

  @override
  String get statusSkipped => 'A fò ó';

  @override
  String get statusMissed => 'Ó kọjá';

  @override
  String get tookItLate => 'Mo ti lò ó';

  @override
  String get doctorDirective => 'Ìlànà dókítà';

  @override
  String forMedication(String medication) {
    return 'Fún $medication';
  }

  @override
  String get viewDetails => 'Wo kúlẹ̀kúlẹ̀';

  @override
  String get asNeededMeds => 'Oògùn tí a ń lò nígbà tó bá yẹ';

  @override
  String tookPrn(String medication) {
    return 'Mo lo $medication';
  }

  @override
  String get alarmAlert => 'Ìdágìrì';

  @override
  String get doseNotFound => 'A kò rí oògùn yìí';

  @override
  String get doseNotFoundBody =>
      'Ó ṣeé ṣe kí a ti yí ìránnilétí yìí padà tàbí kí a ti yọ ọ́ kúrò.';

  @override
  String get scheduledDose => 'Oògùn tí a ṣètò';

  @override
  String doseXofY(String index, String total) {
    return 'Oògùn $index nínú $total lónìí';
  }

  @override
  String get prescribedFor => 'Tí a kọ fún:';

  @override
  String get routeOral => 'Ẹnu (gbé mì)';

  @override
  String get criticalDirective => 'Ìlànà dókítà pàtàkì';

  @override
  String get directiveWithMeal =>
      'Ẹ lò ó pẹ̀lú oúnjẹ tàbí lẹ́sẹ̀kẹsẹ̀ lẹ́yìn tí ẹ bá jẹun';

  @override
  String get directiveAfterFood => 'Ẹ lò ó láàárín wákàtí 1 lẹ́yìn oúnjẹ';

  @override
  String get directiveBeforeFood => 'Ẹ lò ó ní ìṣẹ́jú 30 ṣáájú oúnjẹ';

  @override
  String get directiveEmpty => 'Ẹ lò ó lórí ikùn òfìfo pẹ̀lú ife omi kíkún';

  @override
  String get directiveWater => 'Ẹ lò ó pẹ̀lú omi mímọ́ tó pọ̀';

  @override
  String get accountabilityTitle => 'Ìjẹ́rìí lílo oògùn';

  @override
  String get accountabilityBody =>
      'Ẹ jẹ́rìí pé ẹ ti lò ó lóòótọ́ kí ẹ tó parí oògùn yìí.';

  @override
  String confirmSwallowed(String units) {
    return 'Mo ti gbé $units mì pẹ̀lú ife omi kíkún';
  }

  @override
  String confirmApplied(String units) {
    return 'Mo ti pa $units';
  }

  @override
  String confirmInjected(String units) {
    return 'Mo ti gba $units';
  }

  @override
  String confirmInhaled(String units) {
    return 'Mo ti fa $units láti inú inhaler mi';
  }

  @override
  String get preventsEscalation => 'Ó dá ìkìlọ̀ olùtọ́jú dúró fún oògùn yìí';

  @override
  String get iHaveTakenThisDose => 'Mo ti lo oògùn yìí';

  @override
  String snoozeWithRemaining(String count) {
    return 'Sún síwájú ìṣẹ́jú 15 ($count ló kù lẹ́yìn èyí)';
  }

  @override
  String get skipDoseRequiresReason => 'Fo oògùn (ẹ gbọ́dọ̀ fún ìdí)';

  @override
  String get overdueAlarm => 'Oògùn tó ti kọjá àkókò';

  @override
  String get urgentAlarm => 'Ìdágìrì kánjúkánjú';

  @override
  String get offlineVerified =>
      'Ó dájú láìsí íńtánẹ́ẹ̀tì • ń ṣiṣẹ́ láìsí nẹ́tíwọ̀ọ̀kì';

  @override
  String get ringing => 'Ó ń dún';

  @override
  String get alreadyTaken => 'A ti kọ ọ́ sílẹ̀ pé ẹ ti lo oògùn yìí';

  @override
  String get alreadySkipped => 'A ti fo oògùn yìí';

  @override
  String loggedAt(String time) {
    return 'A kọ ọ́ sílẹ̀ ní $time';
  }

  @override
  String get caregiverSetupPrompt =>
      'Ẹ fi olùtọ́jú kún un kí ẹnìkan lè gbọ́ bí ẹ bá ṣàì lo oògùn.';

  @override
  String get caregiverFailSafe => 'Ààbò olùtọ́jú';

  @override
  String minutesQueue(String minutes) {
    return 'Ìdúró ${minutes}m';
  }

  @override
  String caregiverFailSafeBody(String time) {
    return 'Bí ẹ kò bá jẹ́rìí rẹ̀ ní $time, Remedi yóò rán yín létí láti fi SMS ìkìlọ̀ ránṣẹ́ sí:';
  }

  @override
  String get caregiverAlertsOff =>
      'Ìkìlọ̀ olùtọ́jú ti wà ní pípa. Ẹ ṣì lè fi ọ̀rọ̀ ránṣẹ́ sí wọn:';

  @override
  String get cameraUnavailable => 'Kámẹ́rà kò sí lórí fóònù yìí.';

  @override
  String get analyzingPrescription => 'À ń ka ọ̀rọ̀ lórí fóònù yín…';

  @override
  String scanFound(String medication) {
    return 'A rí $medication. Ẹ yẹ àwọn kúlẹ̀kúlẹ̀ ìsàlẹ̀ wò.';
  }

  @override
  String get scanNotRecognized =>
      'A kò mọ oògùn náà. Ẹ jọ̀wọ́ ẹ jẹ́rìí orúkọ rẹ̀.';

  @override
  String get confirmMedicine => 'Jẹ́rìí oògùn';

  @override
  String get instantIntake => 'Ìforúkọsílẹ̀ kíákíá';

  @override
  String get addNewMedicine => 'Fi oògùn tuntun kún un';

  @override
  String get addNewMedicineHint =>
      'Ẹ ya fọ́tò ìwé oògùn yín, ẹ ṣàyẹ̀wò páálí oògùn, tàbí ẹ sọ orúkọ rẹ̀ fún wa.';

  @override
  String get smartScan => 'Ṣàyẹ̀wò kíákíá';

  @override
  String get works100Offline => 'Ń ṣiṣẹ́ 100% láìsí íńtánẹ́ẹ̀tì';

  @override
  String get onDeviceOcr => 'Lórí fóònù';

  @override
  String get snapAutoFill => 'Ya fọ́tò & Kún un fúnra rẹ̀';

  @override
  String get chooseFromGallery => 'Yan láti inú Gallery';

  @override
  String get voiceNote => 'Ohùn';

  @override
  String get voiceNoteHint => 'Ẹ sọ orúkọ oògùn àti agbára rẹ̀';

  @override
  String get tapToSpeak => 'Tẹ̀ ẹ́ láti sọ̀rọ̀';

  @override
  String get typeName => 'Tẹ orúkọ';

  @override
  String get typeNameHint => 'Wá orúkọ ọjà tàbí orúkọ gbogbogbò';

  @override
  String get manualEntry => 'Kíkọ fúnra ẹni';

  @override
  String get quickPick => 'Àwọn oògùn tí a sábà ń lò';

  @override
  String get oneTapAdd => 'Fi kún un pẹ̀lú ìtẹ̀ kan';

  @override
  String get readingText => 'À ń kà á…';

  @override
  String get lensReady => 'Kámẹ́rà ti ṣetán';

  @override
  String get aimInsideBox => 'Ẹ dojú rẹ̀ kọ inú àpótí';

  @override
  String get aimHint =>
      'Ẹ dojú kámẹ́rà kọ páálí oògùn, pákẹ́ẹ̀tì oògùn, tàbí ìwé oògùn dókítà';

  @override
  String get searchMedicineHint => 'àpẹẹrẹ: Metformin, Panadol, Amlodipine';

  @override
  String useCustomMedicine(String name) {
    return 'Fi \"$name\" kún un';
  }

  @override
  String get useCustomMedicineHint =>
      'Kò sí nínú àkójọ? Ẹ fi kún un pẹ̀lú àlàyé tiyín.';

  @override
  String get voiceSheetHint => 'Àpẹẹrẹ: \"Metformin five hundred milligrams\".';

  @override
  String get voiceUnavailable =>
      'Ìdámọ̀ ohùn kò sí. Ẹ jọ̀wọ́ ẹ tẹ orúkọ náà dípò bẹ́ẹ̀.';

  @override
  String get listening => 'À ń gbọ́…';

  @override
  String get tapMicToSpeak => 'Ẹ tẹ gbohùngbohùn kí ẹ sì sọ̀rọ̀.';

  @override
  String useThisMedicine(String medication) {
    return 'Lo $medication';
  }

  @override
  String get editMedicine => 'Ṣàtúnṣe oògùn';

  @override
  String get drugNameLabel => 'Orúkọ oògùn';

  @override
  String get drugNameHint => 'Orúkọ ọjà tàbí orúkọ gbogbogbò';

  @override
  String get strengthLabel => 'Agbára & ìwọ̀n';

  @override
  String get strengthHint => 'àpẹẹrẹ: 500mg, 5ml';

  @override
  String get doseFormLabel => 'Irú oògùn';

  @override
  String get requiredField => 'Èyí jẹ́ dandan';

  @override
  String get required => 'Dandan';

  @override
  String get saveContinue => 'Fi pamọ́ & tẹ̀síwájú';

  @override
  String get addAtLeastOneTime =>
      'Ẹ fi àkókò ìránnilétí kan kún un, ó kéré tán.';

  @override
  String remindersSet(String medication) {
    return 'A ti ṣètò ìránnilétí fún $medication.';
  }

  @override
  String get changesSaved => 'A ti fi àwọn àyípadà pamọ́.';

  @override
  String get editRoutine => 'Ṣàtúnṣe ètò';

  @override
  String get stepScheduleFood => 'Ìgbésẹ̀ 1 nínú 2 • Àkókò & Oúnjẹ';

  @override
  String get unnamedMedicine => 'Oògùn aláìlórúkọ';

  @override
  String get edit => 'Ṣàtúnṣe';

  @override
  String get howOften => '1. Ìgbà mélòó lẹ ń lò ó?';

  @override
  String get tapToSelect => 'Tẹ̀ ẹ́ láti yàn';

  @override
  String get foodRoutine => '2. Ètò oúnjẹ';

  @override
  String get preventsNausea => 'Ó ń dènà ìríra';

  @override
  String get prnNoReminders =>
      'Oògùn tí a ń lò nígbà tó bá yẹ kò ní ìdágìrì. Ẹ kọ oògùn kọ̀ọ̀kan sílẹ̀ láti ojú-ìwé Ètò oògùn nígbà tí ẹ bá lò ó.';

  @override
  String get reminderTimes => '3. Àkókò ìránnilétí';

  @override
  String get basedOnRoutine => 'Gẹ́gẹ́ bí ètò yín';

  @override
  String get addReminderTime => 'Fi àkókò ìránnilétí kún un';

  @override
  String get offlineAlarmsTitle => 'Ìdágìrì láìsí íńtánẹ́ẹ̀tì';

  @override
  String get offlineAlarmsBody =>
      'Ìkìlọ̀ máa ń dún dáadáa kódà láìsí nẹ́tíwọ̀ọ̀kì fóònù tàbí íńtánẹ́ẹ̀tì.';

  @override
  String get saveChanges => 'Fi àyípadà pamọ́';

  @override
  String get saveSetReminders => 'Fi pamọ́ & Ṣètò ìránnilétí';

  @override
  String get moreClinicalDetails => 'Àlàyé ìṣègùn síwájú sí i';

  @override
  String get moreClinicalDetailsHint =>
      '(àkọsílẹ̀ dókítà, àtúnrà — kò pọn dandan)';

  @override
  String doseSlotLabel(String number, String slot) {
    return 'Oògùn $number • $slot';
  }

  @override
  String get adjustTime => 'Yí àkókò padà';

  @override
  String get doseAmount => 'Ìwọ̀n oògùn';

  @override
  String get removeTime => 'Yọ àkókò kúrò';

  @override
  String get nameStrengthRequired => 'Orúkọ oògùn àti agbára rẹ̀ jẹ́ dandan.';

  @override
  String get clinicalDetails => 'Àlàyé ìṣègùn';

  @override
  String get safeIntakeProtocol => 'Ìlànà ààbò lílo oògùn láìsí íńtánẹ́ẹ̀tì';

  @override
  String get clinicalDetailsTitle => 'Àlàyé àìsàn & ìwé oògùn';

  @override
  String clinicalDetailsStep(String medication) {
    return 'Ìgbésẹ̀ 2 nínú 2: Àlàyé ìṣègùn fún $medication';
  }

  @override
  String get whyExtraTime => 'Ìdí tí èyí fi ń gba àkókò díẹ̀ sí i';

  @override
  String get whyExtraTimeBody =>
      'Kíkọ àyẹ̀wò àìsàn gan-an, ìlànà dókítà àti iye oògùn tí ẹ ní sílẹ̀ ń jẹ́ kí ìdágìrì, ìkìlọ̀ àtúnrà àti àkópọ̀ fún dókítà péye, kódà láìsí nẹ́tíwọ̀ọ̀kì rárá.';

  @override
  String get diagnosedContext => 'Àìsàn tí dókítà ṣàwárí';

  @override
  String get conditionLabel => 'Àìsàn tí a ṣàwárí';

  @override
  String get conditionHint => 'àpẹẹrẹ: Ẹ̀jẹ̀ ríru, Àtọ̀gbẹ Type 2';

  @override
  String get facilityLabel => 'Ilé-ìwòsàn';

  @override
  String get facilityHint => 'àpẹẹrẹ: Lagoon Hospital, Ikoyi';

  @override
  String get prescriberLabel => 'Dókítà tó kọ oògùn';

  @override
  String get prescriberHint => 'àpẹẹrẹ: Dr. Adeleke';

  @override
  String get specialtyLabel => 'Ẹ̀ka ìṣègùn';

  @override
  String get specialtyHint => 'àpẹẹrẹ: Cardiology (ọkàn)';

  @override
  String get doctorPhoneLabel => 'Fóònù dókítà / ilé-ìwòsàn';

  @override
  String get prescriptionDetails => 'Àlàyé ìwé oògùn';

  @override
  String get doctorInstructionsLabel => 'Ìlànà dókítà';

  @override
  String get doctorInstructionsHint => 'àpẹẹrẹ: Ẹ mu ife omi kíkún 2 pẹ̀lú rẹ̀';

  @override
  String get pillDescriptionLabel => 'Bí oògùn náà ṣe rí';

  @override
  String get pillDescriptionHint =>
      'àpẹẹrẹ: Tablet funfun gígùn tí a kọ \'M 500\' sí';

  @override
  String get rxNumberLabel => 'Nọ́ńbà ìwé oògùn';

  @override
  String get prescriptionBackup => 'Ẹ̀dà ìwé oògùn';

  @override
  String get noPrescriptionPhoto => 'Kò sí fọ́tò síbẹ̀';

  @override
  String get prescriptionSaved => 'A ti fi fọ́tò ìwé oògùn pamọ́';

  @override
  String get storedOnDevice => 'Ó wà lórí fóònù yìí nìkan';

  @override
  String get attachPhoto => 'So fọ́tò mọ́ ọn';

  @override
  String get supplyTracking => 'Ìtọpinpin iye oògùn & àtúnrà';

  @override
  String stockLabel(String unit) {
    return '$unit tó wà nílé';
  }

  @override
  String get refillAlertAt => 'Ìkìlọ̀ àtúnrà ní';

  @override
  String get refillExplainer =>
      'Remedi ń yọ iye kúrò pẹ̀lú oògùn kọ̀ọ̀kan tí ẹ bá kọ sílẹ̀, yóò sì kìlọ̀ fún yín láìsí íńtánẹ́ẹ̀tì nígbà tí oògùn bá ń tán.';

  @override
  String get sideEffectWatchlist => 'Àbájáde búburú tí a mọ̀ láti ṣọ́';

  @override
  String sideEffectWatchlistHint(String medication) {
    return 'Ẹ yan àwọn àmì àìsàn tí dókítà yín sọ pé kí ẹ ṣọ́ fún $medication. Ẹ lè kọ wọ́n sílẹ̀ nínú ìwé ìlera yín.';
  }

  @override
  String get encryptedLocal => 'A fi pamọ́ sí ibi ìkọ̀kọ̀ fóònù yín nìkan';

  @override
  String get saveMedicineSetReminders => 'Fi oògùn pamọ́ & Ṣètò ìránnilétí';

  @override
  String get backToRoutine => 'Padà sí Àkókò & Oúnjẹ';

  @override
  String get medicineCabinet => 'Àpótí oògùn';

  @override
  String activeCount(String count) {
    return '$count ń lọ lọ́wọ́';
  }

  @override
  String get search => 'Wá';

  @override
  String get cabinetHint =>
      'Àwọn oògùn tí dókítà kọ fún yín, ìtọ́sọ́nà lílo wọn láìléwu àti ìtọpinpin àtúnrà.';

  @override
  String get searchCabinet => 'Wá oògùn yín';

  @override
  String filterAll(String count) {
    return 'Gbogbo ($count)';
  }

  @override
  String get emptyCabinetTitle => 'Àpótí oògùn yín ṣófo';

  @override
  String get noMedsInCategory => 'Kò sí oògùn nínú ẹ̀ka yìí';

  @override
  String get noMedsInCategoryBody =>
      'Ẹ tẹ \'Gbogbo\' láti wo àkójọ yín tàbí kí ẹ fi oògùn kún un fún àkókò yìí lójúmọ́.';

  @override
  String get offlineSynchronized => 'A fi pamọ́ láìsí íńtánẹ́ẹ̀tì';

  @override
  String get offlineSynchronizedBody =>
      'Káàdì ààbò oògùn wà lórí fóònù yín fún àyẹ̀wò kódà láìsí nẹ́tíwọ̀ọ̀kì.';

  @override
  String get supplyNotTracked => 'A kò ka iye oògùn';

  @override
  String get lowSupply => 'Oògùn ti ń tán';

  @override
  String daysLeft(String days) {
    return 'Ọjọ́ $days ló kù';
  }

  @override
  String get goodSupply => 'Oògùn tó pọ̀ tó wà';

  @override
  String get savedOnDevice => 'A fi pamọ́ sórí fóònù yìí';

  @override
  String get details => 'Kúlẹ̀kúlẹ̀';

  @override
  String refillMessage(String medication, String rx, String patient) {
    return 'Ẹ n lẹ́ o, mo fẹ́ tún $medication$rx rà fún $patient. Ẹ ṣeun.';
  }

  @override
  String refillSubject(String medication) {
    return 'Ìbéèrè àtúnrà: $medication';
  }

  @override
  String get activeRx => 'Rx tó ń lọ lọ́wọ́';

  @override
  String get supplyTracker => 'Ìtọpinpin iye oògùn';

  @override
  String daysRemaining(String days) {
    return 'Ọjọ́ $days ló kù';
  }

  @override
  String refillBy(String date) {
    return 'Ẹ tún un rà ṣáájú $date';
  }

  @override
  String get prescriber => 'Dókítà tó kọ ọ́';

  @override
  String get clinicalInstructions => 'Ìlànà ìṣègùn';

  @override
  String get requestRefill => 'Béèrè àtúnrà ní ilé oògùn';

  @override
  String get openFullDetails => 'Ṣí gbogbo kúlẹ̀kúlẹ̀';

  @override
  String get editMedicationDetails => 'Ṣàtúnṣe àlàyé oògùn';

  @override
  String get medicationDetail => 'Àlàyé oògùn';

  @override
  String get medicineNotFound => 'A kò rí oògùn náà';

  @override
  String get updateStock => 'Ṣàtúnṣe iye oògùn';

  @override
  String get updateStockHint =>
      'Mélòó lẹ ní báyìí? Ẹ tẹ iye àtúnrà kan láti fi kún un.';

  @override
  String get save => 'Fi pamọ́';

  @override
  String get stockUpdated => 'A ti ṣàtúnṣe iye oògùn.';

  @override
  String stopMedicineTitle(String medication) {
    return 'Dá $medication dúró?';
  }

  @override
  String get stopMedicineBody =>
      'Ìránnilétí yóò dúró. A ó pa àkọsílẹ̀ oògùn yín mọ́ fún àyẹ̀wò dókítà. Ẹ má ṣe dá oògùn dúró àyàfi tí dókítà yín bá sọ bẹ́ẹ̀.';

  @override
  String get stopMedicine => 'Dá oògùn dúró';

  @override
  String medicineStopped(String medication) {
    return 'A ti dá $medication dúró. A ti fagi lé ìránnilétí.';
  }

  @override
  String get backToCabinet => 'Padà sí Àpótí oògùn';

  @override
  String get encryptedLocalRecord => 'Àkọsílẹ̀ àṣírí lórí fóònù';

  @override
  String get remainingSupply => 'Oògùn tó kù';

  @override
  String get notTracked => 'A kò kà á';

  @override
  String get pillIdentifier => 'Ìdámọ̀ oògùn';

  @override
  String get seePrescriptionPhoto => 'Wo fọ́tò ìwé oògùn';

  @override
  String get dosageRoutine => 'Ètò ìwọ̀n oògùn';

  @override
  String perIntake(String units) {
    return '$units ní ìgbà kọ̀ọ̀kan';
  }

  @override
  String perDay(String amount) {
    return '$amount/ọjọ́';
  }

  @override
  String get safetyInteractions => 'Ààbò & Ìkọlù oògùn';

  @override
  String get offlineSafetyDb => 'Ìtọ́kasí tí kò nílò íńtánẹ́ẹ̀tì';

  @override
  String get notInReference => 'Kò sí nínú ìtọ́kasí wa';

  @override
  String get noKnownClash => 'A kò rí ìkọlù kankan tí a mọ̀';

  @override
  String get noOtherMeds => 'Ẹ kò ní oògùn mìíràn tí ẹ ń lò lọ́wọ́.';

  @override
  String checkedAgainst(String medications) {
    return 'A ṣàyẹ̀wò rẹ̀ pẹ̀lú: $medications';
  }

  @override
  String get checked => 'A ti ṣàyẹ̀wò';

  @override
  String interactionWith(String medication) {
    return 'Ìkọlù pẹ̀lú $medication';
  }

  @override
  String get askDoctor => 'Béèrè lọ́wọ́ dókítà';

  @override
  String get caution => 'Ẹ ṣọ́ra';

  @override
  String get dietWarning => 'Ìkìlọ̀ oúnjẹ & ọtí';

  @override
  String get missedDoseTitle => 'Kí ni kí ẹ ṣe tí ẹ bá ṣàì lo oògùn?';

  @override
  String get missedDoseGeneric =>
      'Ẹ lò ó ní kété tí ẹ bá rántí. Bí àkókò oògùn tó kàn bá ti fẹ́rẹ̀ tó, ẹ fo èyí tí ẹ gbàgbé. Ẹ MÁ ṢE lo oògùn ní ìlọ́po méjì láé.';

  @override
  String get storageUse => 'Ìtọ́jú & lílò';

  @override
  String get referenceDisclaimer =>
      'Ìtọ́sọ́nà gbogbogbò nìkan ni. Ẹ máa tẹ̀lé ìmọ̀ràn dókítà tàbí apòògùn yín nígbà gbogbo.';

  @override
  String get prescriptionOrigin => 'Ibi tí ìwé oògùn ti wá';

  @override
  String get prescriberUnknown => 'A kò tíì fi dókítà kún un';

  @override
  String get callClinic => 'Pe ilé-ìwòsàn';

  @override
  String get add => 'Fi kún un';

  @override
  String get emergencyResponder => 'Olùrànlọ́wọ́ pàjáwìrì';

  @override
  String get smsLinked => 'SMS ti so pọ̀';

  @override
  String logDoseNow(String units) {
    return 'Kọ oògùn sílẹ̀ báyìí ($units)';
  }

  @override
  String get refillSms => 'SMS àtúnrà láìsí íńtánẹ́ẹ̀tì';

  @override
  String get editRoutineBtn => 'Ṣàtúnṣe ètò';

  @override
  String get logSideEffect => 'Kọ àbájáde búburú sílẹ̀';

  @override
  String get bpNormal => 'Ó wà déédé';

  @override
  String get bpElevated => 'Ó ga díẹ̀';

  @override
  String get bpStage1 => 'Ó ga • Ìpele 1';

  @override
  String get bpStage2 => 'Ó ga • Ìpele 2';

  @override
  String get bpCrisis => 'Ó ga lọ́nà ewu';

  @override
  String get bpCrisisAdvice =>
      'Ìwọ̀n yìí ga jù. Ẹ sinmi fún ìṣẹ́jú 5 kí ẹ sì tún un wọ̀n. Bí ó bá ṣì ga tàbí ara yín kò yá, ẹ lọ gba ìtọ́jú pàjáwìrì báyìí.';

  @override
  String get enterBothValues => 'Ẹ tẹ nọ́ńbà méjèèjì.';

  @override
  String get enterValue => 'Ẹ tẹ iye kan.';

  @override
  String get valueLooksWrong =>
      'Iye yẹn dà bí ẹni pé kò tọ̀nà. Ẹ jọ̀wọ́ ẹ yẹ̀ ẹ́ wò kí ẹ sì tún gbìyànjú.';

  @override
  String get vitalSaved => 'A ti fi ìwọ̀n pamọ́.';

  @override
  String get logVitalTitle => 'Kọ ìwọ̀n sílẹ̀';

  @override
  String get systolic => 'Òkè (systolic)';

  @override
  String get diastolic => 'Ìsàlẹ̀ (diastolic)';

  @override
  String get saveReading => 'Fi ìwọ̀n pamọ́';

  @override
  String get bloodPressure => 'Ìfúnpá ẹ̀jẹ̀ (BP)';

  @override
  String get bloodSugar => 'Ṣúgà ẹ̀jẹ̀';

  @override
  String get heartRate => 'Ìlù ọkàn';

  @override
  String get weight => 'Ìwúwo';

  @override
  String get steps => 'Ìṣísẹ̀';

  @override
  String get myHealth => 'Ìlera mi';

  @override
  String get doctorVisitTitle => 'Àkópọ̀ fún ìbẹ̀wò dókítà';

  @override
  String get doctorVisitBody =>
      'Ẹ mú gbogbo àkọsílẹ̀ oògùn àti ìwọ̀n ara yín lọ sí ìpàdé yín tó kàn. Kò nílò data.';

  @override
  String get generateSummary => 'Ṣe àkópọ̀ fún dókítà (PDF / QR)';

  @override
  String get offlineDataVault => 'Ibi ìpamọ́ data láìsí íńtánẹ́ẹ̀tì';

  @override
  String get localAndPrivate => 'Àṣírí & ó wà lórí fóònù yìí';

  @override
  String pendingCount(String count) {
    return '$count ń dúró';
  }

  @override
  String vaultBody(String count) {
    return 'Gbogbo àkọsílẹ̀ oògùn àti ìwọ̀n ara wà lórí fóònù yìí. Àyípadà $count ń dúró de ìpamọ́ lórí cloud nígbà tí a bá tàn án.';
  }

  @override
  String get attemptSync => 'Múṣiṣẹ́pọ̀ báyìí';

  @override
  String get cloudSyncNotConfigured =>
      'A kò tíì tan ìpamọ́ cloud. Data yín wà láìléwu lórí fóònù yìí.';

  @override
  String get noDataYet => 'Kò sí data síbẹ̀';

  @override
  String get excellent => 'Ó dára jù';

  @override
  String get good => 'Ó dára';

  @override
  String get needsAttention => 'Ó nílò àkíyèsí';

  @override
  String get adherence30 => 'Ìtẹ̀lé oògùn ọjọ́ 30';

  @override
  String get target90 => 'àfojúsùn ≥90%';

  @override
  String get currentStreak => 'Ọjọ́ tí ẹ ti ń lò ó léraléra';

  @override
  String get days => 'ọjọ́';

  @override
  String onTimeRate(String percent) {
    return '$percent% ni ẹ lò lásìkò';
  }

  @override
  String get weeklyRoutine => 'Ètò ọ̀sẹ̀';

  @override
  String missedThisWeek(String count) {
    return 'Oògùn $count ló kọjá lọ́sẹ̀ yìí';
  }

  @override
  String get last7Days => 'Ọjọ́ 7 sẹ́yìn';

  @override
  String get legendOnTime => 'Lásìkò';

  @override
  String get legendLate => 'Pẹ́';

  @override
  String get legendMissed => 'Kọjá / A fò ó';

  @override
  String get languageCardTitle => 'Èdè & Ohùn';

  @override
  String get languageCardBody =>
      'Ìránnilétí àti ìdágìrì ń lo èdè tí ẹ yàn, kódà láìsí íńtánẹ́ẹ̀tì rárá.';

  @override
  String get vitalsQuickLogger => 'Kíkọ ìwọ̀n ara kíákíá';

  @override
  String get seeTrends => 'Wo bí ó ṣe ń lọ';

  @override
  String get noVitalsYet =>
      'Kò sí ìwọ̀n síbẹ̀. Ẹ kọ ìfúnpá ẹ̀jẹ̀ tàbí ṣúgà yín sílẹ̀ láti máa tọpinpin rẹ̀.';

  @override
  String get logBpOrSugar => 'Kọ ìfúnpá ẹ̀jẹ̀ tàbí ṣúgà sílẹ̀';

  @override
  String get otherMedicines => 'Àwọn oògùn mìíràn';

  @override
  String get activeConditions => 'Àwọn àìsàn & ètò oògùn lọ́wọ́lọ́wọ́';

  @override
  String conditionsCount(String count) {
    return 'Ẹgbẹ́ $count';
  }

  @override
  String since(String date) {
    return 'Láti $date';
  }

  @override
  String refillInDays(String days) {
    return 'Àtúnrà ní ọjọ́ $days';
  }

  @override
  String lowSupplyNotice(String medication, String amount) {
    return 'Oògùn ń tán: $medication, $amount péré ló kù';
  }

  @override
  String get orderRefill => 'Béèrè àtúnrà';

  @override
  String get symptomsNotes => 'Àmì àìsàn & àkọsílẹ̀';

  @override
  String get noSymptoms => 'Kò sí àmì àìsàn tí a kọ sílẹ̀ ní ọjọ́ 30 sẹ́yìn.';

  @override
  String get healthSynced => 'Data ìlera ti wọlé sí fóònù yìí.';

  @override
  String get healthConnectMissing =>
      'Health Connect kò sí lórí fóònù yìí. À ń ṣí store…';

  @override
  String get healthUnavailable => 'Data ìlera kò sí lórí fóònù yìí.';

  @override
  String get healthDenied =>
      'A kò rí àṣẹ gbà. Ẹ lè fún un láṣẹ nínú ètò fóònù yín.';

  @override
  String bpAfterDose(String minutes, String medication) {
    return 'A wọ̀n ọ́n ní ìṣẹ́jú $minutes lẹ́yìn tí ẹ lo $medication.';
  }

  @override
  String get vitalsAndSync => 'Ìwọ̀n ara & Ìmúṣiṣẹ́pọ̀ ìlera';

  @override
  String get connectedActive => 'Ó ti so pọ̀ & ń ṣiṣẹ́';

  @override
  String get notConnected => 'Kò so pọ̀';

  @override
  String get syncNow => 'Múṣiṣẹ́pọ̀ báyìí';

  @override
  String get connect => 'So pọ̀';

  @override
  String get onDeviceOnly => 'Lórí fóònù yín nìkan • kò sí cloud';

  @override
  String get restingHeartRate => 'Ìlù ọkàn nígbà ìsinmi';

  @override
  String bpmRange(String min, String max) {
    return '$min – $max BPM';
  }

  @override
  String get bpmAvg7d => 'Àròpín BPM (ọjọ́ 7)';

  @override
  String get noHeartData => 'Kò sí ìwọ̀n ìlù ọkàn ní ọjọ́ 7 sẹ́yìn.';

  @override
  String get connectToSeeHeart =>
      'Ẹ so app ìlera yín pọ̀ láti rí ìlù ọkàn láti aago ọwọ́ tàbí fóònù yín.';

  @override
  String get dailyMobility => 'Ìrìn ojoojúmọ́';

  @override
  String goalSteps(String steps) {
    return 'Àfojúsùn $steps';
  }

  @override
  String stepsDistance(String km) {
    return 'Nǹkan bí $km km lónìí';
  }

  @override
  String get pillVitalsHarmony => 'Oògùn & Ìwọ̀n ara pọ̀';

  @override
  String get harmonyPrivacy =>
      'A ń fi ìwọ̀n wé àkọsílẹ̀ oògùn yín lórí fóònù yìí. A kò gbé nǹkan kan sórí íńtánẹ́ẹ̀tì.';

  @override
  String get bloodPressureCheck => 'Àyẹ̀wò ìfúnpá ẹ̀jẹ̀';

  @override
  String get offlineBiometricCache => 'Ìpamọ́ ìlera láìsí íńtánẹ́ẹ̀tì';

  @override
  String biometricPoints(String count) {
    return 'Ìwọ̀n $count wà ní ìpamọ́ láìléwu lórí fóònù yìí.';
  }

  @override
  String get autoSyncOnOpen => 'Múṣiṣẹ́pọ̀ fúnra rẹ̀ nígbà tí mo bá ṣí Remedi';

  @override
  String get autoSyncOnOpenHint =>
      'Mú ìwọ̀n tuntun wá láti app ìlera yín nígbà kọ̀ọ̀kan';

  @override
  String get generateClinicalReport => 'Ṣe ìròyìn ìṣègùn (PDF & QR)';

  @override
  String get exportPrepared => 'A ti pèsè àkópọ̀ lórí fóònù yín.';

  @override
  String get exportFailed => 'A kò lè ṣe àkópọ̀ náà. Ẹ jọ̀wọ́ ẹ tún gbìyànjú.';

  @override
  String get handoverProtocol => 'Àkópọ̀ fún dókítà';

  @override
  String get summaryTitle => 'Àkópọ̀ ìṣègùn & QR';

  @override
  String get summarySubtitle =>
      'Àkópọ̀ tí kò nílò íńtánẹ́ẹ̀tì fún ìbẹ̀wò ilé-ìwòsàn, àyẹ̀wò àkọ́kọ́ àti pàjáwìrì.';

  @override
  String ageYears(String age) {
    return 'Ọdún $age';
  }

  @override
  String bloodGroupValue(String group) {
    return 'Ẹ̀jẹ̀: $group';
  }

  @override
  String genotypeValue(String genotype) {
    return 'Genotype: $genotype';
  }

  @override
  String get primaryDiagnoses => 'Àìsàn pàtàkì';

  @override
  String get noneRecorded => 'Kò sí nǹkan tí a kọ sílẹ̀';

  @override
  String allergiesValue(String allergies) {
    return 'Ohun tí kò bá ara mu: $allergies';
  }

  @override
  String get generatedOnDevice => 'A ṣe é lórí fóònù yìí';

  @override
  String generatedAt(String time) {
    return 'A ṣe é ní $time';
  }

  @override
  String get qrSemantics => 'Kóòdù QR tí ó ní àkópọ̀ ìṣègùn yín nínú';

  @override
  String get cameraDecodable => 'Ẹ fi kámẹ́rà èyíkéyìí ṣàyẹ̀wò rẹ̀';

  @override
  String get cameraDecodableBody =>
      'Ó ní àkópọ̀ kékeré ti oògùn yín, ìtẹ̀lé oògùn àti ìwọ̀n ara yín. Kò nílò nẹ́tíwọ̀ọ̀kì.';

  @override
  String get zeroInternet => 'Kò nílò íńtánẹ́ẹ̀tì rárá';

  @override
  String get valid48h => 'Ó wúlò fún wákàtí 48';

  @override
  String get dossierHighlights => 'Àwọn kókó ìṣègùn';

  @override
  String get last30Days => 'Ọjọ́ 30 sẹ́yìn';

  @override
  String get regimenAdherence => 'Ìtẹ̀lé oògùn ọjọ́ 30';

  @override
  String percentOnTime(String percent) {
    return '$percent% lásìkò';
  }

  @override
  String get takenShort => 'ti lò';

  @override
  String get vitalsCorrelation => 'Àkópọ̀ ìwọ̀n ara';

  @override
  String get bpAverage => 'Àròpín ìfúnpá ẹ̀jẹ̀';

  @override
  String readingsCount(String count) {
    return 'Ìwọ̀n $count';
  }

  @override
  String get systolicTrend => 'Bí systolic ṣe ń lọ (ìwọ̀n tuntun)';

  @override
  String checksumLabel(String checksum) {
    return 'Checksum ìdánilójú: $checksum';
  }

  @override
  String get savePrintPdf => 'Fi PDF pamọ́ / Tẹ àkópọ̀ jáde';

  @override
  String get shareNearby => 'Pín nípasẹ̀ Bluetooth, AirDrop tàbí WhatsApp';

  @override
  String get privacyNotice =>
      'Àkọsílẹ̀ ìlera yín wà lórí fóònù yìí. A kò gbé nǹkan kan sókè àyàfi tí ẹ bá yàn láti pín àkópọ̀ yìí.';

  @override
  String get welcomeTitle => 'Ẹ káàbọ̀ sí Remedi';

  @override
  String get welcomeBody =>
      'Ìránnilétí oògùn tí ń ṣiṣẹ́ láìsí nẹ́tíwọ̀ọ̀kì, ní èdè yín.';

  @override
  String get continueLabel => 'Tẹ̀síwájú';

  @override
  String get back => 'Padà';

  @override
  String get aboutYouTitle => 'Nípa yín';

  @override
  String get aboutYouBody =>
      'Èyí yóò wà lórí fóònù yín. Ó ń ràn àkópọ̀ dókítà àti ìdágìrì lọ́wọ́ láti pè yín ní orúkọ yín.';

  @override
  String get yourName => 'Orúkọ yín';

  @override
  String get caregiverOptional => 'Olùtọ́jú (kò pọn dandan)';

  @override
  String get caregiverWhy =>
      'Bí ẹ kò bá jẹ́rìí oògùn kan, Remedi yóò rán yín létí láti fi SMS ìkìlọ̀ ránṣẹ́ sí wọn. SMS ń ṣiṣẹ́ láìsí data.';

  @override
  String get caregiverName => 'Orúkọ olùtọ́jú';

  @override
  String get caregiverRelation => 'Ìbátan';

  @override
  String get caregiverRelationHint => 'àpẹẹrẹ: Ọmọkùnrin, Ọmọbìnrin, Nọ́ọ̀sì';

  @override
  String get caregiverPhone => 'Nọ́ńbà fóònù olùtọ́jú';

  @override
  String get readyTitle => 'Ẹ jẹ́ kí Remedi máa dún fún yín';

  @override
  String get readyBody =>
      'Ẹ gba ìfitónilétí àti ìdágìrì láàyè kí ìránnilétí lè dún lásìkò, kódà tí fóònù yín bá wà ní títì.';

  @override
  String get readyPoint1 =>
      'Ìdágìrì aláriwo ní àkókò oògùn kọ̀ọ̀kan, pẹ̀lú ìsúnsíwájú';

  @override
  String get readyPoint2 => 'Gbogbo nǹkan ń ṣiṣẹ́ 100% láìsí íńtánẹ́ẹ̀tì';

  @override
  String get readyPoint3 => 'Ìkìlọ̀ SMS sí olùtọ́jú bí ẹ bá ṣàì lo oògùn';

  @override
  String get readyPoint4 => 'Àkópọ̀ fún ìbẹ̀wò dókítà pẹ̀lú PDF àti kóòdù QR';

  @override
  String get enableRemindersStart => 'Tan ìránnilétí & Bẹ̀rẹ̀';

  @override
  String get exploreSample => 'Ṣàwárí pẹ̀lú oògùn àpẹẹrẹ';

  @override
  String get medicalDisclaimer =>
      'Remedi ń ràn yín lọ́wọ́ láti tẹ̀lé ìwé oògùn yín. Kò rọ́pò ìmọ̀ràn dókítà tàbí apòògùn yín.';

  @override
  String get titleLabel => 'Oyè';

  @override
  String get dateOfBirth => 'Ọjọ́ ìbí';

  @override
  String get sex => 'Akọ tàbí abo';

  @override
  String get female => 'Obìnrin';

  @override
  String get male => 'Ọkùnrin';

  @override
  String get bloodGroup => 'Ẹgbẹ́ ẹ̀jẹ̀';

  @override
  String get genotype => 'Genotype';

  @override
  String get allergies => 'Ohun tí kò bá ara mu (allergy)';

  @override
  String get allergiesHint => 'àpẹẹrẹ: Penicillin, oògùn Sulfa';

  @override
  String get caregiverAlertsToggle => 'Ìkìlọ̀ ààbò olùtọ́jú';

  @override
  String get caregiverAlertsToggleHint =>
      'Rán mi létí láti fi ọ̀rọ̀ ránṣẹ́ sí olùtọ́jú mi tí n kò bá jẹ́rìí oògùn';

  @override
  String get alertAfter => 'Kìlọ̀ lẹ́yìn';

  @override
  String minutesShort(String minutes) {
    return '$minutes ìṣẹ́jú';
  }

  @override
  String get appSettings => 'Ètò app';

  @override
  String get alarmPermissions => 'Àṣẹ ìdágìrì & ìfitónilétí';

  @override
  String get alarmPermissionsHint => 'Ẹ rí i dájú pé ìránnilétí lè dún lásìkò';

  @override
  String get alarmsArmed => 'Ìdágìrì ti ṣetán.';

  @override
  String get alarmsBlocked =>
      'A ti dí ìfitónilétí. Ẹ jọ̀wọ́ ẹ gbà á láàyè nínú ètò fóònù.';

  @override
  String get remiName => 'Remi';

  @override
  String get remiLoading => 'Remi ń ṣètò nǹkan sílẹ̀…';

  @override
  String get offlineVault => 'Àpótí 100% láìsí íńtánẹ́ẹ̀tì';

  @override
  String get splashTagline =>
      'Olùrànlọ́wọ́ ìlera yín tí ń ṣiṣẹ́ láìsí íńtánẹ́ẹ̀tì';

  @override
  String get splashVault => 'Àpótí oògùn àṣírí';

  @override
  String get splashFormulary => 'Àkójọ oògùn inú fóònù';

  @override
  String get splashScanner => 'Ẹ̀rọ kíkà ọ̀rọ̀ inú fóònù';

  @override
  String get splashAlarms => 'Aago ìránnilétí oògùn';

  @override
  String get splashReady => 'Gbogbo nǹkan ti ṣetán';

  @override
  String get splashPreparing => 'À ń pèsè àpótí yín…';

  @override
  String get statusReady => 'Ó ti ṣetán';

  @override
  String get statusLoading => 'Ó ń bọ̀…';

  @override
  String get statusWaiting => 'Ó ń dúró';

  @override
  String get zeroTelemetryTitle => 'Ìlérí: Kò sí ìtọpinpin';

  @override
  String get zeroTelemetryBody =>
      'Ìlànà oògùn yín, ìwé ìlànà dókítà àti àkọsílẹ̀ oògùn yín wà lórí fóònù yìí nìkan. Remedi ń ṣiṣẹ́ dáadáa láìsí nẹ́tíwọ̀ọ̀kì tàbí Wi-Fi.';

  @override
  String get openDoseStation => 'Ṣí Ibùdó Oògùn Ojoojúmọ́';

  @override
  String get getStarted => 'Ẹ jẹ́ ká bẹ̀rẹ̀';

  @override
  String get worksOffline => 'Ó ń ṣiṣẹ́ láìsí íńtánẹ́ẹ̀tì';

  @override
  String get skip => 'Fò ó';

  @override
  String get offlineActive => '100% láìsí íńtánẹ́ẹ̀tì';

  @override
  String get obStep1Label => 'Ìgbésẹ̀ 1 nínú 3';

  @override
  String get obStep2Label => 'Ìgbésẹ̀ 2 nínú 3 • Ìforúkọsílẹ̀ kíákíá';

  @override
  String get obStep3Label => 'Ìgbésẹ̀ 3 nínú 3 • Ààbò àti Ètò';

  @override
  String get remiIntroBefore => '“Ẹ n lẹ́ o! Èmi ni ';

  @override
  String get remiIntroAfter =>
      '. Màá rí i dájú pé ẹ kò gbàgbé oògùn kankan, bí kò tilẹ̀ sí íńtánẹ́ẹ̀tì rárá!”';

  @override
  String get alwaysReady => 'Ó máa ń ṣetán nígbà gbogbo';

  @override
  String get obStep1Title => 'Ìránnilétí oògùn tí ó mọ ìgbé ayé yín.';

  @override
  String get obStep1Body =>
      'Kì í ṣe aago líle ti ilé ìwòsàn. A so oògùn yín mọ́ oúnjẹ àárọ̀, ọ̀sán àti àkókò oorun, kí títọ́jú ara yín lè rọrùn.';

  @override
  String get morningRoutine => 'Ìlànà Àárọ̀';

  @override
  String get withBreakfast => 'Pẹ̀lú oúnjẹ àárọ̀';

  @override
  String get remiVerified => 'Remi ti fọwọ́ sí i';

  @override
  String get offlineReliable => 'Ó dájú láìsí íńtánẹ́ẹ̀tì';

  @override
  String flexibleTime(String time) {
    return '$time • Ó ṣeé yí padà';
  }

  @override
  String get continueSmartIntake => 'Tẹ̀síwájú sí Ìforúkọsílẹ̀ kíákíá';

  @override
  String get smartScanVoice => 'Àyẹ̀wò Ọlọ́gbọ́n àti Ohùn';

  @override
  String get obStep2Title =>
      'Ẹ fi oògùn kún un ní ìṣẹ́jú-àáyá, kì í ṣe ìṣẹ́jú púpọ̀.';

  @override
  String get obStep2Body =>
      'Ṣé ó sú yín láti tẹ orúkọ oògùn gígùn? Remedi ń ka ìwé ìlànà dókítà, ó sì ń gbọ́ ohùn yín, ní ìkọ̀kọ̀ lórí fóònù yín.';

  @override
  String get snapScriptTitle => 'Ya fọ́tò ìwé dókítà tàbí páálí oògùn';

  @override
  String get snapScriptSubtitle => 'Ó ń ka àkọlé lẹ́sẹ̀kẹsẹ̀';

  @override
  String get scanDemoSubtitle => '500mg Tablet • Ẹnu';

  @override
  String get recognised => 'Ó ti dá a mọ̀';

  @override
  String get autoFill => 'Kíkún fúnra rẹ̀';

  @override
  String get voiceDictation => 'Sísọ pẹ̀lú ohùn';

  @override
  String get voiceDictationLangs => 'Gẹ̀ẹ́sì, Pidgin, Yorùbá, Igbo àti Hausa';

  @override
  String get voiceDemoQuote => '“Tablet Lisinopril kan ní àràárọ̀ lẹ́yìn ẹ̀kọ”';

  @override
  String get understoodInstantly => 'Ó yé e lẹ́sẹ̀kẹsẹ̀';

  @override
  String get quickPresets => 'Àṣàyàn kíákíá (tẹ̀ẹ́ lẹ́ẹ̀kan)';

  @override
  String get quickPresetsHint => 'Tẹ̀ láti kún ìlànà oògùn tí ó wọ́pọ̀';

  @override
  String get remisAdvice => 'Ìmọ̀ràn Remi';

  @override
  String get remisAdviceBody =>
      '“Ẹ má ṣe dààmú láti tẹ orúkọ oògùn gígùn! Ẹ ya fọ́tò tàbí ẹ bá mi sọ̀rọ̀.”';

  @override
  String get nextPeaceOfMind => 'Èyí tó kàn: Ìbàlẹ̀ ọkàn láìsí íńtánẹ́ẹ̀tì';

  @override
  String get noPhotosLeave =>
      'Fóònù yín ló ń ka ọ̀rọ̀ náà. Kò sí fọ́tò tí ó ń kúrò lórí fóònù yín.';

  @override
  String get healthStaysHere => 'Ìlera yín wà lórí fóònù yìí.';

  @override
  String get zeroCloudTrackers => 'Kò sí ìtọpinpin orí cloud, láéláé.';

  @override
  String get obStep3Title => 'Àṣírí pátápátá àti QR fún dókítà lẹ́sẹ̀kẹsẹ̀';

  @override
  String get obStep3Body =>
      'Gbogbo nǹkan wà lórí fóònù yín. Tí ẹ bá lọ rí dókítà, ẹ pín QR àti PDF láìsí íńtánẹ́ẹ̀tì pẹ̀lú ìfọwọ́kàn kan.';

  @override
  String get whatShouldRemiCallYou => 'Kí ni kí Remi máa pè yín?';

  @override
  String get criticalAlarms => 'Aago pàtàkì láìsí íńtánẹ́ẹ̀tì';

  @override
  String get essential => 'Pàtàkì';

  @override
  String get criticalAlarmsBody =>
      'Ìránnilétí tí ó ń dún lásìkò, bí fóònù bá wà ní airplane mode tàbí kò sí nẹ́tíwọ̀ọ̀kì.';

  @override
  String healthSyncTitle(String app) {
    return 'Ìsopọ̀ $app';
  }

  @override
  String get onDevice => 'Lórí fóònù';

  @override
  String get healthSyncBody =>
      'Ẹ wo ìlù ọkàn àti ìṣísẹ̀ ojoojúmọ́ lẹ́gbẹ̀ẹ́ oògùn yín, lórí fóònù yìí nìkan.';

  @override
  String get caregiverSmsAlert => 'SMS Ìkìlọ̀ sí Olùtọ́jú';

  @override
  String get optional => 'Kò pọn dandan';

  @override
  String get caregiverSmsAlertBody =>
      'Tí ẹ kò bá jẹ́rìí sí oògùn kan, Remi yóò rán yín létí láti fi SMS ránṣẹ́ sí olùtọ́jú yín.';

  @override
  String get caregiverSmsNote =>
      'SIM yín ni SMS náà ti ń lọ, nígbà tí ẹ bá tẹ “fi ránṣẹ́” nìkan.';

  @override
  String get clinicQrMode => 'QR fún ilé ìwòsàn';

  @override
  String get clinicQrModeBody =>
      'Ẹ pín àkópọ̀ yín pẹ̀lú dókítà èyíkéyìí, láìsí ìsopọ̀';

  @override
  String get enabled => 'Ó ti tàn';

  @override
  String get enterRemedi => 'Wọlé sí Remedi kí ẹ fi oògùn àkọ́kọ́ kún un';

  @override
  String get storedPrivately => 'A tọ́jú rẹ̀ ní ìkọ̀kọ̀ lórí fóònù yìí';

  @override
  String get voicePermissionDenied =>
      'Àṣẹ gbohùngbohùn tàbí ohùn ti wà ní pípa. Ẹ gbà á láyè nínú ètò fóònù yín, tàbí kí ẹ tẹ orúkọ náà.';

  @override
  String get voiceNoMatch => 'Kò yé mi. Ẹ tẹ gbohùngbohùn kí ẹ tún gbìyànjú.';

  @override
  String get voiceNetwork =>
      'Iṣẹ́ ohùn fóònù yín nílò íńtánẹ́ẹ̀tì fún èdè yìí. Ẹ gbìyànjú Gẹ̀ẹ́sì, tàbí kí ẹ tẹ orúkọ náà.';

  @override
  String get voiceFailed => 'Ohùn dúró láìròtẹ́lẹ̀. Ẹ jọ̀ọ́ ẹ tún gbìyànjú.';

  @override
  String get voiceNotRecognised =>
      'Mo gbọ́ yín, ṣùgbọ́n n kò rí orúkọ oògùn. Ẹ tún gbìyànjú tàbí kí ẹ tẹ ẹ́.';

  @override
  String get stopListening => 'Dúró gbígbọ́';

  @override
  String get tapToStop => 'Ẹ tẹ̀ ẹ́ láti dúró tí ẹ bá parí';

  @override
  String get tryAgain => 'Tún gbìyànjú';

  @override
  String get typeInstead => 'Tẹ ẹ dípò';
}
