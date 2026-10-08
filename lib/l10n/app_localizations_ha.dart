// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([String locale = 'ha']) : super(locale);

  @override
  String get appName => 'Remedi';

  @override
  String get notifChannelDoses => 'Ƙararrawar magani';

  @override
  String get notifChannelDosesDesc =>
      'Tunatarwa mai ƙara idan lokacin shan magani ya yi';

  @override
  String get notifChannelCare => 'Faɗakarwar kulawa';

  @override
  String get notifChannelCareDesc =>
      'Faɗakarwar mai kula da gargaɗin ƙarewar magani';

  @override
  String get notifDoseTitle => 'Lokacin shan maganinka ya yi';

  @override
  String get notifSnoozeTitle => 'Tunatarwar da aka jinkirta';

  @override
  String notifDoseBody(String medication, String amount) {
    return '$medication • sha $amount';
  }

  @override
  String get notifCaregiverTitle => 'Ba a tabbatar da shan magani ba';

  @override
  String notifCaregiverBody(String medication, String caregiver) {
    return 'Har yanzu ba a tabbatar da $medication ba. Taɓa don sanar da $caregiver ta SMS.';
  }

  @override
  String get notifRefillTitle => 'Ana buƙatar ƙarin magani nan ba da jimawa ba';

  @override
  String notifRefillBody(String count, String medication) {
    return '$count kawai suka rage na $medication.';
  }

  @override
  String get actionMarkTaken => 'Na sha';

  @override
  String get actionSnooze15 => 'Jinkirta minti 15';

  @override
  String get offlineReady => 'Yana aiki ba intanet';

  @override
  String get offline => 'Ba intanet';

  @override
  String get changeLanguage => 'Canza harshe';

  @override
  String get chooseLanguage => 'Zaɓi harshenka';

  @override
  String get chooseLanguageHint =>
      'Tunatarwa, ƙararrawa da umarni za su yi amfani da wannan harshe, ko babu intanet.';

  @override
  String get profileTitle => 'Bayanan kai da Saituna';

  @override
  String get formTablet => 'Ƙwaya';

  @override
  String get formCapsule => 'Kapsul';

  @override
  String get formCaplet => 'Kaplet';

  @override
  String get formSoftgel => 'Softgel';

  @override
  String get formLiquid => 'Ruwan magani / Sirop';

  @override
  String get formDrops => 'Ɗigo';

  @override
  String get formInjection => 'Allura';

  @override
  String get formInhaler => 'Inhaler (na shaƙa)';

  @override
  String get formCream => 'Kirim / Man shafawa';

  @override
  String get formSachet => 'Sachet';

  @override
  String get unitMl => 'ml';

  @override
  String get unitDrops => 'ɗigo';

  @override
  String get unitInjection => 'allura';

  @override
  String get unitPuffs => 'shaƙa';

  @override
  String get unitApplication => 'shafawa';

  @override
  String get unitSachet => 'sachet';

  @override
  String get unitPills => 'ƙwayoyi';

  @override
  String get freqOnce => 'Sau ɗaya a rana';

  @override
  String get freqTwice => 'Sau biyu a rana';

  @override
  String get freqThrice => 'Sau 3 a rana';

  @override
  String get freqPrn => 'Idan da buƙata';

  @override
  String get freqOnceHint => 'Da safe';

  @override
  String get freqTwiceHint => 'Kowace sa\'a 12';

  @override
  String get freqThriceHint => 'Tare da abinci';

  @override
  String get freqPrnHint => 'Idan ciwo ya taso';

  @override
  String get mealWith => 'Tare da abinci';

  @override
  String get mealBefore => 'Kafin abinci';

  @override
  String get mealAfter => 'Bayan abinci';

  @override
  String get mealEmpty => 'Ciki babu komai';

  @override
  String get mealWater => 'Da ruwa kawai';

  @override
  String get mealAny => 'Babu ƙa\'idar abinci';

  @override
  String get mealWithHint => 'Yayin ci ko nan da nan bayan';

  @override
  String get mealBeforeHint => 'Minti 30 kafin';

  @override
  String get mealAfterHint => 'Cikin sa\'a 1';

  @override
  String get mealEmptyHint => 'Cikakken kofin ruwa';

  @override
  String get mealWaterHint => 'Kowane lokaci, da ruwa';

  @override
  String get mealAnyHint => 'Abinci ba shi da matsala';

  @override
  String get skipStomach => 'Ciwon ciki, tashin zuciya ko amai';

  @override
  String get skipStock => 'Magani ya ƙare ko ya ɓace';

  @override
  String get skipDoctor => 'Likitana ya ce in dakata';

  @override
  String get skipOther => 'Wani dalili';

  @override
  String get slotBreakfast => 'Karin kumallo';

  @override
  String get slotLunch => 'Abincin rana';

  @override
  String get slotDinner => 'Abincin dare';

  @override
  String get slotBedtime => 'Lokacin kwanciya';

  @override
  String get slotCustom => 'Tunatarwa';

  @override
  String get symptomNausea => 'Tashin zuciya';

  @override
  String get symptomDizziness => 'Jiri';

  @override
  String get symptomDryCough => 'Busasshen tari';

  @override
  String get symptomFatigue => 'Gajiya';

  @override
  String get symptomHeadache => 'Ciwon kai';

  @override
  String get symptomSwelling => 'Kumburin idon sawu';

  @override
  String get symptomMusclePain => 'Ciwon tsoka';

  @override
  String get symptomDiarrhea => 'Gudawa';

  @override
  String get symptomLowSugar => 'Ƙarancin sukari (rawar jiki, zufa)';

  @override
  String get symptomRash => 'Ƙuraje a fata';

  @override
  String get symptomStomachPain => 'Ciwon ciki';

  @override
  String get partMorning => 'Safe';

  @override
  String get partAfternoon => 'Rana';

  @override
  String get partEvening => 'Yamma';

  @override
  String get partNight => 'Dare';

  @override
  String get navSchedule => 'Jadawali';

  @override
  String get navFastLog => 'Rubutu da sauri';

  @override
  String get navMyMeds => 'Magungunana';

  @override
  String get navHealth => 'Lafiya';

  @override
  String toastDoseLogged(String medication) {
    return 'An rubuta cewa an sha $medication.';
  }

  @override
  String toastSnoozedUntil(String time) {
    return 'An jinkirta. Za mu sake ƙara da ƙarfe $time.';
  }

  @override
  String get snoozeLimitReached =>
      'Jinkirtawa ta kai iyaka. Don Allah ka sha ko ka tsallake wannan kashi.';

  @override
  String get sosTitle => 'Faɗakarwar gaggawa';

  @override
  String get sosNoCaregiver =>
      'Ba ka ƙara mai kula da kai ba tukuna. Ƙara wani da za mu iya aika masa saƙo ko kiran sa a lokacin gaggawa.';

  @override
  String get addCaregiver => 'Ƙara mai kula';

  @override
  String sosBody(String name) {
    return 'Aika SMS ko kira $name. SMS yana aiki ba tare da data ba.';
  }

  @override
  String sosMessage(String patient) {
    return 'GAGGAWA daga Remedi: $patient yana buƙatar taimako. Don Allah a kira ko a duba shi yanzu.';
  }

  @override
  String sosDoseMessage(String patient, String medication, String time) {
    return 'Faɗakarwar Remedi: $patient bai tabbatar da shan $medication na ƙarfe $time ba. Don Allah a duba shi.';
  }

  @override
  String sosSendSms(String name) {
    return 'Aika SMS zuwa ga $name';
  }

  @override
  String sosCall(String name) {
    return 'Kira $name';
  }

  @override
  String get skipTitle => 'Zaɓi dalilin tsallakewa';

  @override
  String get skipAuditNote =>
      'Ana rubuta duk kashin da aka tsallake a rajistarka ta cikin waya domin likitanka ya duba magungunanka.';

  @override
  String skipAuditNoteDoctor(String doctor) {
    return 'Ana rubuta duk kashin da aka tsallake a rajistarka ta cikin waya domin $doctor ya duba magungunanka.';
  }

  @override
  String get confirmSkip => 'Tabbatar da tsallakewa';

  @override
  String get skipRecorded => 'An rubuta tsallakewa a rajistarka ta cikin waya.';

  @override
  String get logSymptomTitle => 'Yaya jikinka?';

  @override
  String get logSymptomHint =>
      'Zaɓi abin da ka lura da shi. Za a saka shi a taƙaitaccen bayani na ganin likitanka.';

  @override
  String symptomLogged(String symptom) {
    return 'An rubuta $symptom.';
  }

  @override
  String goodMorning(String name) {
    return 'Ina kwana, $name';
  }

  @override
  String goodAfternoon(String name) {
    return 'Barka da rana, $name';
  }

  @override
  String goodEvening(String name) {
    return 'Barka da yamma, $name';
  }

  @override
  String get emptyScheduleTitle => 'Babu magani tukuna';

  @override
  String get emptyScheduleBody =>
      'Ƙara maganinka na farko, Remedi zai ƙara a kan lokaci, ko babu network.';

  @override
  String get addMedicine => 'Ƙara magani';

  @override
  String get laterToday => 'Anjima yau';

  @override
  String dosesPending(String count) {
    return '$count na jira';
  }

  @override
  String get sosButton => 'Gaggawa SOS / Sanar da mai kula (SMS)';

  @override
  String get moodAllDone => 'An gama duka!';

  @override
  String get moodGood => 'Lafiya lau!';

  @override
  String get moodStart => 'Mu fara.';

  @override
  String get noDosesToday => 'Babu magani da aka tsara yau.';

  @override
  String dosesDoneOf(String done, String total) {
    return 'An sha $done cikin $total yau.';
  }

  @override
  String snoozedUntil(String time) {
    return 'An jinkirta zuwa $time';
  }

  @override
  String overdueBy(String minutes) {
    return 'Ya wuce lokaci da minti $minutes';
  }

  @override
  String get dueNow => 'Lokaci ya yi';

  @override
  String dueInMinutes(String minutes) {
    return 'Nan da minti $minutes';
  }

  @override
  String dueAt(String time) {
    return 'Da ƙarfe $time';
  }

  @override
  String get upNext => 'Na gaba';

  @override
  String get undo => 'Soke';

  @override
  String routineOf(String slot) {
    return 'Tsarin $slot';
  }

  @override
  String get fullGlassWater => 'Cikakken kofin ruwa';

  @override
  String get markAsTaken => 'Na sha';

  @override
  String get snooze15 => 'Jinkirta minti 15';

  @override
  String get noSnoozesLeft => 'Babu sauran jinkirtawa';

  @override
  String get skipOrSideEffect => 'Illar magani / Tsallake';

  @override
  String get allDoneTitle => 'An sha duk magungunan yau';

  @override
  String get allDoneBody => 'Madalla. Dagewa na kare lafiyarka.';

  @override
  String get completedEarlier => 'An kammala ɗazu';

  @override
  String takenCount(String count) {
    return 'An sha $count';
  }

  @override
  String get statusDone => 'An gama';

  @override
  String get statusSkipped => 'An tsallake';

  @override
  String get statusMissed => 'An rasa';

  @override
  String get tookItLate => 'Na sha';

  @override
  String get doctorDirective => 'Umarnin likita';

  @override
  String forMedication(String medication) {
    return 'Na $medication';
  }

  @override
  String get viewDetails => 'Duba bayani';

  @override
  String get asNeededMeds => 'Magungunan idan da buƙata';

  @override
  String tookPrn(String medication) {
    return 'Na sha $medication';
  }

  @override
  String get alarmAlert => 'Ƙararrawa';

  @override
  String get doseNotFound => 'Ba a sami kashin ba';

  @override
  String get doseNotFoundBody =>
      'Wataƙila an canza ko an cire wannan tunatarwa.';

  @override
  String get scheduledDose => 'Kashin da aka tsara';

  @override
  String doseXofY(String index, String total) {
    return 'Kashi na $index cikin $total yau';
  }

  @override
  String get prescribedFor => 'An rubuta don:';

  @override
  String get routeOral => 'Ta baki';

  @override
  String get criticalDirective => 'Muhimmin umarnin likita';

  @override
  String get directiveWithMeal => 'Sha tare da abinci ko nan da nan bayan ci';

  @override
  String get directiveAfterFood => 'Sha cikin sa\'a 1 bayan abinci';

  @override
  String get directiveBeforeFood => 'Sha minti 30 kafin abinci';

  @override
  String get directiveEmpty =>
      'Sha da ciki babu komai tare da cikakken kofin ruwa';

  @override
  String get directiveWater => 'Sha da ruwa mai tsafta mai yawa';

  @override
  String get accountabilityTitle => 'Tabbatar da sha';

  @override
  String get accountabilityBody =>
      'Tabbatar cewa ka sha shi da gaske kafin ka kammala wannan kashi.';

  @override
  String confirmSwallowed(String units) {
    return 'Na haɗiye $units da cikakken kofin ruwa';
  }

  @override
  String confirmApplied(String units) {
    return 'Na shafa $units';
  }

  @override
  String confirmInjected(String units) {
    return 'Na yi $units';
  }

  @override
  String confirmInhaled(String units) {
    return 'Na shaƙi $units daga inhaler ɗina';
  }

  @override
  String get preventsEscalation =>
      'Yana dakatar da faɗakarwar mai kula na wannan kashi';

  @override
  String get iHaveTakenThisDose => 'Na sha wannan kashi';

  @override
  String snoozeWithRemaining(String count) {
    return 'Jinkirta minti 15 (saura $count bayan wannan)';
  }

  @override
  String get skipDoseRequiresReason =>
      'Tsallake kashi (sai da dalili na lafiya)';

  @override
  String get overdueAlarm => 'Kashin da lokacinsa ya wuce';

  @override
  String get urgentAlarm => 'Ƙararrawar gaggawa';

  @override
  String get offlineVerified => 'An tabbatar • yana aiki ba tare da network ba';

  @override
  String get ringing => 'Yana ƙara';

  @override
  String get alreadyTaken => 'An rubuta cewa an sha wannan kashi';

  @override
  String get alreadySkipped => 'An tsallake wannan kashi';

  @override
  String loggedAt(String time) {
    return 'An rubuta da ƙarfe $time';
  }

  @override
  String get caregiverSetupPrompt =>
      'Ƙara mai kula domin a sanar da wani idan ka rasa shan magani.';

  @override
  String get caregiverFailSafe => 'Faɗakarwar mai kula';

  @override
  String minutesQueue(String minutes) {
    return 'Jira minti $minutes';
  }

  @override
  String caregiverFailSafeBody(String time) {
    return 'Idan ba a tabbatar ba kafin ƙarfe $time, Remedi zai tuna maka ka aika saƙon SMS zuwa ga:';
  }

  @override
  String get caregiverAlertsOff =>
      'An kashe faɗakarwar mai kula. Har yanzu kana iya aika masa saƙo:';

  @override
  String get cameraUnavailable => 'Babu kyamara a wannan waya.';

  @override
  String get analyzingPrescription => 'Ana karanta rubutu a wayarka…';

  @override
  String scanFound(String medication) {
    return 'An sami $medication. Duba bayanan da ke ƙasa.';
  }

  @override
  String get scanNotRecognized =>
      'Ba mu gane maganin ba. Don Allah tabbatar da sunan.';

  @override
  String get confirmMedicine => 'Tabbatar da magani';

  @override
  String get instantIntake => 'Shigarwa cikin sauri';

  @override
  String get addNewMedicine => 'Ƙara sabon magani';

  @override
  String get addNewMedicineHint =>
      'Ɗauki hoton takardar likita, ka duba akwatin magani, ko ka faɗa mana sunan.';

  @override
  String get smartScan => 'Dubawa cikin sauri';

  @override
  String get works100Offline => 'Yana aiki 100% ba intanet';

  @override
  String get onDeviceOcr => 'A cikin waya';

  @override
  String get snapAutoFill => 'Ɗauki hoto, a cike';

  @override
  String get chooseFromGallery => 'Zaɓa daga hotuna';

  @override
  String get voiceNote => 'Saƙon murya';

  @override
  String get voiceNoteHint => 'Faɗi sunan magani da ƙarfinsa';

  @override
  String get tapToSpeak => 'Taɓa don magana';

  @override
  String get typeName => 'Rubuta suna';

  @override
  String get typeNameHint => 'Nemi sunan kamfani ko na asali';

  @override
  String get manualEntry => 'Shigarwa da hannu';

  @override
  String get quickPick => 'Zaɓi magungunan da aka saba';

  @override
  String get oneTapAdd => 'Ƙara da taɓawa 1';

  @override
  String get readingText => 'Ana karantawa…';

  @override
  String get lensReady => 'Kyamara ta shirya';

  @override
  String get aimInsideBox => 'Nufa cikin akwatin';

  @override
  String get aimHint =>
      'Nufa ga akwatin magani, ledar ƙwayoyi, ko takardar likita';

  @override
  String get searchMedicineHint => 'misali Metformin, Panadol, Amlodipine';

  @override
  String useCustomMedicine(String name) {
    return 'Ƙara \"$name\"';
  }

  @override
  String get useCustomMedicineHint =>
      'Ba ya cikin jerin? Ƙara shi da bayananka.';

  @override
  String get voiceSheetHint => 'Misali: \"Metformin milligram ɗari biyar\".';

  @override
  String get voiceUnavailable =>
      'Gane murya ba ya samuwa. Don Allah rubuta sunan maimakon haka.';

  @override
  String get listening => 'Ana saurare…';

  @override
  String get tapMicToSpeak => 'Taɓa makirufo ka yi magana.';

  @override
  String useThisMedicine(String medication) {
    return 'Yi amfani da $medication';
  }

  @override
  String get editMedicine => 'Gyara magani';

  @override
  String get drugNameLabel => 'Sunan magani';

  @override
  String get drugNameHint => 'Sunan kamfani ko na asali';

  @override
  String get strengthLabel => 'Ƙarfi da ma\'auni';

  @override
  String get strengthHint => 'misali 500mg, 5ml';

  @override
  String get doseFormLabel => 'Irin magani';

  @override
  String get requiredField => 'Wannan dole ne';

  @override
  String get required => 'Dole';

  @override
  String get saveContinue => 'Ajiye ka ci gaba';

  @override
  String get addAtLeastOneTime => 'Ƙara aƙalla lokacin tunatarwa ɗaya.';

  @override
  String remindersSet(String medication) {
    return 'An saita tunatarwa don $medication.';
  }

  @override
  String get changesSaved => 'An ajiye canje-canje.';

  @override
  String get editRoutine => 'Gyara tsari';

  @override
  String get stepScheduleFood => 'Mataki 1 cikin 2 • Jadawali da abinci';

  @override
  String get unnamedMedicine => 'Magani marar suna';

  @override
  String get edit => 'Gyara';

  @override
  String get howOften => '1. Sau nawa kake sha?';

  @override
  String get tapToSelect => 'Taɓa don zaɓa';

  @override
  String get foodRoutine => '2. Tsarin abinci';

  @override
  String get preventsNausea => 'Yana hana tashin zuciya';

  @override
  String get prnNoReminders =>
      'Magungunan idan da buƙata ba su da ƙararrawa. Rubuta kowane kashi daga shafin Jadawali idan ka sha.';

  @override
  String get reminderTimes => '3. Lokutan tunatarwa';

  @override
  String get basedOnRoutine => 'Bisa tsarinka';

  @override
  String get addReminderTime => 'Ƙara lokacin tunatarwa';

  @override
  String get offlineAlarmsTitle => 'Ƙararrawa ba intanet';

  @override
  String get offlineAlarmsBody =>
      'Faɗakarwa na ƙara daidai ko babu network ko intanet.';

  @override
  String get saveChanges => 'Ajiye canje-canje';

  @override
  String get saveSetReminders => 'Ajiye ka saita tunatarwa';

  @override
  String get moreClinicalDetails => 'Ƙarin bayanan lafiya';

  @override
  String get moreClinicalDetailsHint =>
      '(bayanin likita, ƙarin magani — ba dole ba)';

  @override
  String doseSlotLabel(String number, String slot) {
    return 'Kashi $number • $slot';
  }

  @override
  String get adjustTime => 'Daidaita lokaci';

  @override
  String get doseAmount => 'Yawan kashi';

  @override
  String get removeTime => 'Cire lokaci';

  @override
  String get nameStrengthRequired => 'Sunan magani da ƙarfinsa dole ne.';

  @override
  String get clinicalDetails => 'Bayanan lafiya';

  @override
  String get safeIntakeProtocol => 'Tsarin shan magani lafiya ba intanet';

  @override
  String get clinicalDetailsTitle => 'Bayanan cuta da takardar likita';

  @override
  String clinicalDetailsStep(String medication) {
    return 'Mataki 2 cikin 2: Bayanan lafiya na $medication';
  }

  @override
  String get whyExtraTime => 'Dalilin da wannan ke ɗaukar lokaci';

  @override
  String get whyExtraTimeBody =>
      'Shigar da ainihin cuta, umarnin likita da bayanan yawan magani na sa ƙararrawarka, gargaɗin ƙarewar magani da taƙaitaccen bayani na likita su zama daidai, ko babu network kwata-kwata.';

  @override
  String get diagnosedContext => 'Cutar da aka gano';

  @override
  String get conditionLabel => 'Cutar da aka gano';

  @override
  String get conditionHint => 'misali Hawan jini, Ciwon suga na Type 2';

  @override
  String get facilityLabel => 'Asibiti / Cibiyar lafiya';

  @override
  String get facilityHint => 'misali Lagoon Hospital, Ikoyi';

  @override
  String get prescriberLabel => 'Likitan da ya rubuta';

  @override
  String get prescriberHint => 'misali Dr. Adeleke';

  @override
  String get specialtyLabel => 'Ƙwarewa';

  @override
  String get specialtyHint => 'misali Likitan zuciya';

  @override
  String get doctorPhoneLabel => 'Lambar likita / asibiti';

  @override
  String get prescriptionDetails => 'Bayanan takardar likita';

  @override
  String get doctorInstructionsLabel => 'Umarnin likita';

  @override
  String get doctorInstructionsHint =>
      'misali Sha cikakkun kofunan ruwa 2 tare da shi';

  @override
  String get pillDescriptionLabel => 'Yadda ƙwayar take';

  @override
  String get pillDescriptionHint =>
      'misali Farar ƙwaya mai tsawo mai alamar \'M 500\'';

  @override
  String get rxNumberLabel => 'Lambar takardar likita';

  @override
  String get prescriptionBackup => 'Ajiyar takardar likita';

  @override
  String get noPrescriptionPhoto => 'Babu hoto tukuna';

  @override
  String get prescriptionSaved => 'An ajiye hoton takardar likita';

  @override
  String get storedOnDevice => 'An ajiye a wannan waya kawai';

  @override
  String get attachPhoto => 'Saka hoto';

  @override
  String get supplyTracking => 'Bin diddigin yawan magani';

  @override
  String stockLabel(String unit) {
    return '$unit da ke hannu';
  }

  @override
  String get refillAlertAt => 'Gargaɗi idan ya rage';

  @override
  String get refillExplainer =>
      'Remedi na rage lissafi da kowane kashi da ka rubuta, kuma yana gargaɗinka ba intanet idan magani ya kusa ƙarewa.';

  @override
  String get sideEffectWatchlist => 'Illolin magani da za a lura';

  @override
  String sideEffectWatchlistHint(String medication) {
    return 'Zaɓi alamun da likitanka ya ambata game da $medication. Kana iya rubuta su a littafin lafiyarka.';
  }

  @override
  String get encryptedLocal => 'An ajiye a cikin wayarka kawai, a sirri';

  @override
  String get saveMedicineSetReminders => 'Ajiye magani ka saita tunatarwa';

  @override
  String get backToRoutine => 'Koma Jadawali da abinci';

  @override
  String get medicineCabinet => 'Ajiyar magunguna';

  @override
  String activeCount(String count) {
    return '$count ana sha';
  }

  @override
  String get search => 'Nema';

  @override
  String get cabinetHint =>
      'Magungunan da aka rubuta maka, jagorar amfani lafiya da bin diddigin ƙarewarsu.';

  @override
  String get searchCabinet => 'Nemi magungunanka';

  @override
  String filterAll(String count) {
    return 'Duka ($count)';
  }

  @override
  String get emptyCabinetTitle => 'Ajiyarka babu komai';

  @override
  String get noMedsInCategory => 'Babu magani a wannan rukuni';

  @override
  String get noMedsInCategoryBody =>
      'Taɓa \'Duka\' don ganin jerinka ko ƙara magani na wannan lokaci na rana.';

  @override
  String get offlineSynchronized => 'An ajiye ba intanet';

  @override
  String get offlineSynchronizedBody =>
      'An ajiye katunan tsaron magani a wayarka don dubawa ko babu network.';

  @override
  String get supplyNotTracked => 'Ba a bin yawansa';

  @override
  String get lowSupply => 'Ya kusa ƙarewa';

  @override
  String daysLeft(String days) {
    return 'Saura kwana $days';
  }

  @override
  String get goodSupply => 'Akwai isasshe';

  @override
  String get savedOnDevice => 'An ajiye a wannan waya';

  @override
  String get details => 'Bayani';

  @override
  String refillMessage(String medication, String rx, String patient) {
    return 'Sannu, ina so a ƙara min $medication$rx don $patient. Na gode.';
  }

  @override
  String refillSubject(String medication) {
    return 'Buƙatar ƙarin magani: $medication';
  }

  @override
  String get activeRx => 'Rx mai aiki';

  @override
  String get supplyTracker => 'Bin diddigin yawa';

  @override
  String daysRemaining(String days) {
    return 'Saura kwana $days';
  }

  @override
  String refillBy(String date) {
    return 'Ƙara kafin $date';
  }

  @override
  String get prescriber => 'Likitan da ya rubuta';

  @override
  String get clinicalInstructions => 'Umarnin likita';

  @override
  String get requestRefill => 'Nemi ƙarin magani a kemis';

  @override
  String get openFullDetails => 'Buɗe cikakken bayani';

  @override
  String get editMedicationDetails => 'Gyara bayanan magani';

  @override
  String get medicationDetail => 'Bayanin magani';

  @override
  String get medicineNotFound => 'Ba a sami maganin ba';

  @override
  String get updateStock => 'Sabunta yawa';

  @override
  String get updateStockHint =>
      'Nawa kake da su yanzu? Taɓa adadin ƙari don ƙarawa.';

  @override
  String get save => 'Ajiye';

  @override
  String get stockUpdated => 'An sabunta yawa.';

  @override
  String stopMedicineTitle(String medication) {
    return 'A daina $medication?';
  }

  @override
  String get stopMedicineBody =>
      'Tunatarwa za ta tsaya. Za a ajiye tarihin shan maganinka don likitanka ya duba. Kada ka daina magani sai idan likitanka ya ce ka daina.';

  @override
  String get stopMedicine => 'Daina magani';

  @override
  String medicineStopped(String medication) {
    return 'An daina $medication. An soke tunatarwa.';
  }

  @override
  String get backToCabinet => 'Koma Ajiyar magunguna';

  @override
  String get encryptedLocalRecord => 'Bayanan sirri a cikin waya';

  @override
  String get remainingSupply => 'Yawan da ya rage';

  @override
  String get notTracked => 'Ba a bin sa';

  @override
  String get pillIdentifier => 'Gane ƙwaya';

  @override
  String get seePrescriptionPhoto => 'Duba hoton takardar likita';

  @override
  String get dosageRoutine => 'Tsarin sha';

  @override
  String perIntake(String units) {
    return '$units a kowane sha';
  }

  @override
  String perDay(String amount) {
    return '$amount/rana';
  }

  @override
  String get safetyInteractions => 'Tsaro da haɗuwar magunguna';

  @override
  String get offlineSafetyDb => 'Bayani ba intanet, ba a buƙatar intanet';

  @override
  String get notInReference => 'Ba ya cikin bayanan ba intanet';

  @override
  String get noKnownClash => 'Ba a sami sanannen karo ba';

  @override
  String get noOtherMeds => 'Ba ka da wasu magungunan da kake sha.';

  @override
  String checkedAgainst(String medications) {
    return 'An duba da: $medications';
  }

  @override
  String get checked => 'An duba';

  @override
  String interactionWith(String medication) {
    return 'Haɗuwa da $medication';
  }

  @override
  String get askDoctor => 'Tambayi likita';

  @override
  String get caution => 'Kula';

  @override
  String get dietWarning => 'Gargaɗin abinci da barasa';

  @override
  String get missedDoseTitle => 'Me za a yi idan an rasa kashi?';

  @override
  String get missedDoseGeneric =>
      'Sha shi da zarar ka tuna. Idan lokacin kashi na gaba ya kusa, ka tsallake wanda ka rasa. Kada ka taɓa shan kashi biyu a lokaci ɗaya.';

  @override
  String get storageUse => 'Ajiya da amfani';

  @override
  String get referenceDisclaimer =>
      'Jagora ce kawai. Koyaushe bi umarnin likitanka ko mai harhaɗa magani.';

  @override
  String get prescriptionOrigin => 'Asalin takardar likita';

  @override
  String get prescriberUnknown => 'Ba a ƙara likita ba';

  @override
  String get callClinic => 'Kira asibiti';

  @override
  String get add => 'Ƙara';

  @override
  String get emergencyResponder => 'Mai taimako a gaggawa';

  @override
  String get smsLinked => 'An haɗa SMS';

  @override
  String logDoseNow(String units) {
    return 'Rubuta shan yanzu ($units)';
  }

  @override
  String get refillSms => 'SMS na ƙarin magani';

  @override
  String get editRoutineBtn => 'Gyara tsari';

  @override
  String get logSideEffect => 'Rubuta illar magani';

  @override
  String get bpNormal => 'Daidai';

  @override
  String get bpElevated => 'Ya ɗan hau';

  @override
  String get bpStage1 => 'Ya hau • Mataki 1';

  @override
  String get bpStage2 => 'Ya hau • Mataki 2';

  @override
  String get bpCrisis => 'Matakin haɗari';

  @override
  String get bpCrisisAdvice =>
      'Wannan karatu ya yi yawa sosai. Huta minti 5 sannan ka sake aunawa. Idan bai sauka ba ko jikinka bai yi daɗi ba, nemi agajin gaggawa yanzu.';

  @override
  String get enterBothValues => 'Shigar da lambobin biyu.';

  @override
  String get enterValue => 'Shigar da lamba.';

  @override
  String get valueLooksWrong =>
      'Wannan lamba kamar ba daidai ba ce. Don Allah duba ka sake gwadawa.';

  @override
  String get vitalSaved => 'An ajiye karatun.';

  @override
  String get logVitalTitle => 'Rubuta karatu';

  @override
  String get systolic => 'Na sama (systolic)';

  @override
  String get diastolic => 'Na ƙasa (diastolic)';

  @override
  String get saveReading => 'Ajiye karatu';

  @override
  String get bloodPressure => 'Hawan jini';

  @override
  String get bloodSugar => 'Sukarin jini';

  @override
  String get heartRate => 'Bugun zuciya';

  @override
  String get weight => 'Nauyi';

  @override
  String get steps => 'Takawa';

  @override
  String get myHealth => 'Lafiyata';

  @override
  String get doctorVisitTitle => 'Taƙaitaccen bayani don likita';

  @override
  String get doctorVisitBody =>
      'Kai cikakken tarihin magani da karatun lafiyarka zuwa ganin likita na gaba. Ba a buƙatar data.';

  @override
  String get generateSummary =>
      'Samar da taƙaitaccen bayani don likita (PDF / QR)';

  @override
  String get offlineDataVault => 'Ma\'ajiyar bayanai ba intanet';

  @override
  String get localAndPrivate => 'A sirri, a wannan waya';

  @override
  String pendingCount(String count) {
    return '$count na jira';
  }

  @override
  String vaultBody(String count) {
    return 'Duk tarihin magani da karatun lafiya an ajiye su a wannan waya. Canje-canje $count na jira don ajiyar cloud idan an kunna ta.';
  }

  @override
  String get attemptSync => 'Daidaita yanzu';

  @override
  String get cloudSyncNotConfigured =>
      'Ba a kunna ajiyar cloud ba tukuna. Bayananka suna lafiya a wannan waya.';

  @override
  String get noDataYet => 'Babu bayani tukuna';

  @override
  String get excellent => 'Madalla';

  @override
  String get good => 'Da kyau';

  @override
  String get needsAttention => 'Yana buƙatar kulawa';

  @override
  String get adherence30 => 'Bin magani na kwana 30';

  @override
  String get target90 => 'buri ≥90%';

  @override
  String get currentStreak => 'Jere a yanzu';

  @override
  String get days => 'kwanaki';

  @override
  String onTimeRate(String percent) {
    return '$percent% an sha a kan lokaci';
  }

  @override
  String get weeklyRoutine => 'Tsarin mako';

  @override
  String missedThisWeek(String count) {
    return 'An rasa kashi $count a wannan mako';
  }

  @override
  String get last7Days => 'Kwana 7 da suka wuce';

  @override
  String get legendOnTime => 'A kan lokaci';

  @override
  String get legendLate => 'Da jinkiri';

  @override
  String get legendMissed => 'An rasa / an tsallake';

  @override
  String get languageCardTitle => 'Harshe da murya';

  @override
  String get languageCardBody =>
      'Tunatarwa da ƙararrawa suna amfani da harshen da ka zaɓa, ko babu intanet kwata-kwata.';

  @override
  String get vitalsQuickLogger => 'Rubuta karatun lafiya da sauri';

  @override
  String get seeTrends => 'Duba yanayi';

  @override
  String get noVitalsYet =>
      'Babu karatu tukuna. Rubuta hawan jini ko sukarinka don ganin yanayinsu.';

  @override
  String get logBpOrSugar => 'Rubuta hawan jini ko sukari';

  @override
  String get otherMedicines => 'Sauran magunguna';

  @override
  String get activeConditions => 'Cututtuka da tsarin magani';

  @override
  String conditionsCount(String count) {
    return 'Rukuni $count';
  }

  @override
  String since(String date) {
    return 'Tun $date';
  }

  @override
  String refillInDays(String days) {
    return 'Ƙari cikin kwana $days';
  }

  @override
  String lowSupplyNotice(String medication, String amount) {
    return 'Ya kusa ƙarewa: $medication, saura $amount kawai';
  }

  @override
  String get orderRefill => 'Nemi ƙari';

  @override
  String get symptomsNotes => 'Alamomi da bayanai';

  @override
  String get noSymptoms => 'Ba a rubuta wata alama ba a kwana 30 da suka wuce.';

  @override
  String get healthSynced => 'An daidaita bayanan lafiya zuwa wannan waya.';

  @override
  String get healthConnectMissing =>
      'Ba a saka Health Connect ba. Ana buɗe shago…';

  @override
  String get healthUnavailable => 'Bayanan lafiya ba sa samuwa a wannan waya.';

  @override
  String get healthDenied =>
      'Ba a ba da izini ba. Kana iya ba da shi a saitunan wayarka.';

  @override
  String bpAfterDose(String minutes, String medication) {
    return 'An rubuta minti $minutes bayan shan $medication.';
  }

  @override
  String get vitalsAndSync => 'Karatun lafiya da daidaitawa';

  @override
  String get connectedActive => 'An haɗa, yana aiki';

  @override
  String get notConnected => 'Ba a haɗa ba';

  @override
  String get syncNow => 'Daidaita yanzu';

  @override
  String get connect => 'Haɗa';

  @override
  String get onDeviceOnly => 'Ana sarrafa shi a wayarka kawai • babu cloud';

  @override
  String get restingHeartRate => 'Bugun zuciya a hutu';

  @override
  String bpmRange(String min, String max) {
    return '$min – $max BPM';
  }

  @override
  String get bpmAvg7d => 'Matsakaicin BPM (kwana 7)';

  @override
  String get noHeartData => 'Babu karatun bugun zuciya a kwana 7 da suka wuce.';

  @override
  String get connectToSeeHeart =>
      'Haɗa manhajar lafiyarka don ganin bugun zuciya daga agogonka ko wayarka.';

  @override
  String get dailyMobility => 'Motsin jiki na yau';

  @override
  String goalSteps(String steps) {
    return 'Buri $steps';
  }

  @override
  String stepsDistance(String km) {
    return 'Kusan km $km yau';
  }

  @override
  String get pillVitalsHarmony => 'Magani da karatun lafiya';

  @override
  String get harmonyPrivacy =>
      'Ana haɗa karatu da tarihin shan maganinka a wannan waya. Ba a tura komai ba.';

  @override
  String get bloodPressureCheck => 'Auna hawan jini';

  @override
  String get offlineBiometricCache => 'Ajiyar lafiya ba intanet';

  @override
  String biometricPoints(String count) {
    return 'An ajiye karatu $count lafiya a wannan waya.';
  }

  @override
  String get autoSyncOnOpen => 'Daidaita kai tsaye idan na buɗe Remedi';

  @override
  String get autoSyncOnOpenHint =>
      'Ɗauko sababbin karatu daga manhajar lafiyarka kowane lokaci';

  @override
  String get generateClinicalReport => 'Samar da rahoton lafiya (PDF & QR)';

  @override
  String get exportPrepared => 'An shirya taƙaitaccen bayani a wayarka.';

  @override
  String get exportFailed =>
      'Ba a iya samar da taƙaitaccen bayani ba. Don Allah sake gwadawa.';

  @override
  String get handoverProtocol => 'Miƙa wa likita';

  @override
  String get summaryTitle => 'Taƙaitaccen bayanin lafiya da QR';

  @override
  String get summarySubtitle =>
      'Miƙa bayani ba tare da intanet ba a asibiti, wajen tantance marasa lafiya da gaggawa.';

  @override
  String ageYears(String age) {
    return 'Shekara $age';
  }

  @override
  String bloodGroupValue(String group) {
    return 'Jini: $group';
  }

  @override
  String genotypeValue(String genotype) {
    return 'Genotype: $genotype';
  }

  @override
  String get primaryDiagnoses => 'Manyan cututtuka';

  @override
  String get noneRecorded => 'Ba a rubuta komai ba';

  @override
  String allergiesValue(String allergies) {
    return 'Abubuwan da ba sa jituwa da jiki: $allergies';
  }

  @override
  String get generatedOnDevice => 'An samar a wannan waya';

  @override
  String generatedAt(String time) {
    return 'An samar $time';
  }

  @override
  String get qrSemantics =>
      'Lambar QR mai ɗauke da taƙaitaccen bayanin lafiyarka';

  @override
  String get cameraDecodable => 'Duba da kowace kyamara';

  @override
  String get cameraDecodableBody =>
      'Tana ɗauke da taƙaitaccen bayanin magungunanka, bin magani da karatun lafiya. Ba a buƙatar network.';

  @override
  String get zeroInternet => 'Ba a buƙatar intanet';

  @override
  String get valid48h => 'Yana aiki sa\'a 48';

  @override
  String get dossierHighlights => 'Muhimman bayanan lafiya';

  @override
  String get last30Days => 'Kwana 30 da suka wuce';

  @override
  String get regimenAdherence => 'Bin magani na kwana 30';

  @override
  String percentOnTime(String percent) {
    return '$percent% a kan lokaci';
  }

  @override
  String get takenShort => 'an sha';

  @override
  String get vitalsCorrelation => 'Taƙaitaccen karatun lafiya';

  @override
  String get bpAverage => 'Matsakaicin hawan jini';

  @override
  String readingsCount(String count) {
    return 'Karatu $count';
  }

  @override
  String get systolicTrend => 'Yanayin systolic (karatun baya-bayan nan)';

  @override
  String checksumLabel(String checksum) {
    return 'Lambar tabbatarwa: $checksum';
  }

  @override
  String get savePrintPdf => 'Ajiye PDF / Buga bayani';

  @override
  String get shareNearby => 'Tura ta Bluetooth, AirDrop ko WhatsApp';

  @override
  String get privacyNotice =>
      'Bayanan lafiyarka suna nan a wannan waya. Ba a tura komai sai idan ka zaɓi raba wannan bayani.';

  @override
  String get welcomeTitle => 'Barka da zuwa Remedi';

  @override
  String get welcomeBody =>
      'Tunatarwar magani mai aiki ba tare da network ba, da harshenka.';

  @override
  String get continueLabel => 'Ci gaba';

  @override
  String get back => 'Koma baya';

  @override
  String get aboutYouTitle => 'Game da kai';

  @override
  String get aboutYouBody =>
      'Wannan zai zauna a wayarka. Yana taimaka wa bayanin likita da ƙararrawa su kira ka da sunanka.';

  @override
  String get yourName => 'Sunanka';

  @override
  String get caregiverOptional => 'Mai kula (ba dole ba)';

  @override
  String get caregiverWhy =>
      'Idan ba a tabbatar da shan magani ba, Remedi zai tuna maka ka aika masa SMS. SMS yana aiki ba tare da data ba.';

  @override
  String get caregiverName => 'Sunan mai kula';

  @override
  String get caregiverRelation => 'Dangantaka';

  @override
  String get caregiverRelationHint => 'misali Ɗa, Ɗiya, Nas';

  @override
  String get caregiverPhone => 'Lambar wayar mai kula';

  @override
  String get readyTitle => 'Bari Remedi ya tuna maka';

  @override
  String get readyBody =>
      'Ba da izinin sanarwa da ƙararrawa don tunatarwa ta ƙara a kan lokaci, ko wayarka a kulle take.';

  @override
  String get readyPoint1 =>
      'Ƙararrawa mai ƙara a kowane lokacin sha, da jinkirtawa';

  @override
  String get readyPoint2 => 'Komai yana aiki 100% ba intanet';

  @override
  String get readyPoint3 => 'SMS zuwa ga mai kula idan an rasa kashi';

  @override
  String get readyPoint4 => 'Bayani don likita da PDF da lambar QR';

  @override
  String get enableRemindersStart => 'Kunna tunatarwa ka fara';

  @override
  String get exploreSample => 'Gwada da magungunan misali';

  @override
  String get medicalDisclaimer =>
      'Remedi na taimaka maka ka bi takardar likitanka. Ba ya maye gurbin shawarar likitanka ko mai harhaɗa magani.';

  @override
  String get titleLabel => 'Laƙabi';

  @override
  String get dateOfBirth => 'Ranar haihuwa';

  @override
  String get sex => 'Jinsi';

  @override
  String get female => 'Mace';

  @override
  String get male => 'Namiji';

  @override
  String get bloodGroup => 'Rukunin jini';

  @override
  String get genotype => 'Genotype';

  @override
  String get allergies => 'Abubuwan da ba sa jituwa da jiki';

  @override
  String get allergiesHint => 'misali Penicillin, magungunan Sulfa';

  @override
  String get caregiverAlertsToggle => 'Faɗakarwar mai kula';

  @override
  String get caregiverAlertsToggleHint =>
      'Tuna min in aika wa mai kula saƙo idan ba a tabbatar da shan magani ba';

  @override
  String get alertAfter => 'Faɗakarwa bayan';

  @override
  String minutesShort(String minutes) {
    return 'Minti $minutes';
  }

  @override
  String get appSettings => 'Saitunan manhaja';

  @override
  String get alarmPermissions => 'Izinin ƙararrawa da sanarwa';

  @override
  String get alarmPermissionsHint =>
      'Tabbatar tunatarwa za ta iya ƙara a kan lokaci';

  @override
  String get alarmsArmed => 'Ƙararrawa a shirye take.';

  @override
  String get alarmsBlocked =>
      'An toshe sanarwa. Don Allah ba da izini a saitunan waya.';

  @override
  String get remiName => 'Remi';

  @override
  String get remiLoading => 'Remi yana shirya abubuwa…';

  @override
  String get offlineVault => 'Ma\'ajiya 100% ba intanet';

  @override
  String get splashTagline => 'Abokin lafiyarka mai aiki ba tare da intanet ba';

  @override
  String get splashVault => 'Ma\'ajiyar magani ta sirri';

  @override
  String get splashFormulary => 'Jerin magunguna a cikin waya';

  @override
  String get splashScanner => 'Mai karanta rubutu a cikin waya';

  @override
  String get splashAlarms => 'Ƙararrawar magani ba tare da network ba';

  @override
  String get splashReady => 'Komai ya shirya';

  @override
  String get splashPreparing => 'Muna shirya ma\'ajiyarka…';

  @override
  String get statusReady => 'Ya shirya';

  @override
  String get statusLoading => 'Ana lodawa…';

  @override
  String get statusWaiting => 'Ana jira';

  @override
  String get zeroTelemetryTitle => 'Alƙawari: Babu bin diddigi';

  @override
  String get zeroTelemetryBody =>
      'Tsarin magungunanka, takardun likita da bayanan shan magani suna nan a wannan waya kaɗai. Remedi yana aiki sosai ba tare da network ko Wi-Fi ba.';

  @override
  String get openDoseStation => 'Buɗe Tashar Magani ta Yau da Kullum';

  @override
  String get getStarted => 'Mu fara';

  @override
  String get worksOffline => 'Yana aiki ba tare da intanet ba';

  @override
  String get skip => 'Tsallake';

  @override
  String get offlineActive => '100% ba intanet';

  @override
  String get obStep1Label => 'Mataki na 1 cikin 3';

  @override
  String get obStep2Label => 'Mataki na 2 cikin 3 • Ƙarawa cikin sauri';

  @override
  String get obStep3Label => 'Mataki na 3 cikin 3 • Tsaro da Saiti';

  @override
  String get remiIntroBefore => '“Sannu! Ni ne ';

  @override
  String get remiIntroAfter =>
      '. Zan tabbatar ba ka manta da kashin magani ko ɗaya ba, ko da babu intanet kwata-kwata!”';

  @override
  String get alwaysReady => 'Kullum a shirye';

  @override
  String get obStep1Title =>
      'Tunatarwar magani da ta fahimci yadda kake rayuwa.';

  @override
  String get obStep1Body =>
      'Ba ƙararrawa mai tsauri ta asibiti ba. Muna haɗa magungunanka da karin kumallo, abincin rana da lokacin barci don kula da kanka ya zama mai sauƙi.';

  @override
  String get morningRoutine => 'Tsarin Safe';

  @override
  String get withBreakfast => 'Tare da karin kumallo';

  @override
  String get remiVerified => 'Remi ya tabbatar';

  @override
  String get offlineReliable => '100% amintacce ba tare da network ba';

  @override
  String flexibleTime(String time) {
    return '$time • Ana iya canzawa';
  }

  @override
  String get continueSmartIntake => 'Ci gaba zuwa Ƙarawa cikin sauri';

  @override
  String get smartScanVoice => 'Duba da Murya';

  @override
  String get obStep2Title => 'Ƙara magani cikin daƙiƙoƙi, ba mintoci ba.';

  @override
  String get obStep2Body =>
      'Ka gaji da rubuta dogon sunan magani? Remedi yana karanta takardar likita kuma yana jin muryarka, a sirrance a wayarka.';

  @override
  String get snapScriptTitle => 'Ɗauki hoton takardar likita ko kwalin magani';

  @override
  String get snapScriptSubtitle => 'Yana karanta alama nan take';

  @override
  String get scanDemoSubtitle => '500mg Tablet • Ta baki';

  @override
  String get recognised => 'An gane shi';

  @override
  String get autoFill => 'Cikawa da kansa';

  @override
  String get voiceDictation => 'Faɗa da murya';

  @override
  String get voiceDictationLangs => 'Turanci, Pidgin, Yorùbá, Igbo da Hausa';

  @override
  String get voiceDemoQuote =>
      '“Tablet ɗaya na Lisinopril kowace safe bayan kunu”';

  @override
  String get understoodInstantly => 'Ya fahimta nan take';

  @override
  String get quickPresets => 'Zaɓi cikin taɓawa ɗaya';

  @override
  String get quickPresetsHint => 'Taɓa don cike tsarin magani da aka saba';

  @override
  String get remisAdvice => 'Shawarar Remi';

  @override
  String get remisAdviceBody =>
      '“Ka daina rubuta dogayen sunayen magani! Ɗauki hoto kawai ko ka yi mini magana.”';

  @override
  String get nextPeaceOfMind =>
      'Na gaba: Kwanciyar hankali ba tare da intanet ba';

  @override
  String get noPhotosLeave =>
      'Wayarka ce ke karanta rubutun. Babu hoton da ke barin wayarka.';

  @override
  String get healthStaysHere => 'Bayanan lafiyarka suna nan a wannan waya.';

  @override
  String get zeroCloudTrackers => 'Babu mai bin diddigi a cloud, har abada.';

  @override
  String get obStep3Title => 'Cikakken sirri da QR na likita nan take';

  @override
  String get obStep3Body =>
      'Komai yana nan a wayarka. Idan ka je wurin likita, raba QR da PDF ba tare da intanet ba cikin taɓawa ɗaya.';

  @override
  String get whatShouldRemiCallYou => 'Me Remi zai kira ka?';

  @override
  String get criticalAlarms => 'Muhimman ƙararrawa ba tare da intanet ba';

  @override
  String get essential => 'Muhimmi';

  @override
  String get criticalAlarmsBody =>
      'Tunatarwa mai ƙara da ke yin ƙara a kan lokaci, ko a airplane mode ko idan babu network.';

  @override
  String healthSyncTitle(String app) {
    return 'Haɗin $app';
  }

  @override
  String get onDevice => 'A cikin waya';

  @override
  String get healthSyncBody =>
      'Ga bugun zuciyarka da takunka na kullum kusa da magungunanka, a wannan waya kaɗai.';

  @override
  String get caregiverSmsAlert => 'SMS na Faɗakarwa ga Mai Kula';

  @override
  String get optional => 'Ba dole ba';

  @override
  String get caregiverSmsAlertBody =>
      'Idan ba ka tabbatar da kashin magani ba, Remi zai tunatar da kai ka tura wa mai kula da kai SMS.';

  @override
  String get caregiverSmsNote =>
      'SMS ɗin yana fita daga SIM ɗinka, sai lokacin da ka taɓa aika kawai.';

  @override
  String get clinicQrMode => 'QR don asibiti';

  @override
  String get clinicQrModeBody =>
      'Raba taƙaitaccen bayaninka da kowane likita, ba sai an haɗa ba';

  @override
  String get enabled => 'An kunna';

  @override
  String get enterRemedi => 'Shiga Remedi ka ƙara magani na farko';

  @override
  String get storedPrivately => 'An adana a sirrance a wannan waya';

  @override
  String get voicePermissionDenied =>
      'Izinin makirufo ko murya a kashe yake. Ka ba da izini a saitin wayarka, ko ka rubuta sunan maimakon haka.';

  @override
  String get voiceNoMatch => 'Ban ji sosai ba. Taɓa makirufo ka sake gwadawa.';

  @override
  String get voiceNetwork =>
      'Sabis ɗin murya na wayarka yana buƙatar network don wannan harshe. Gwada Turanci, ko ka rubuta sunan.';

  @override
  String get voiceFailed =>
      'Murya ta tsaya ba zato ba tsammani. Don Allah ka sake gwadawa.';

  @override
  String get voiceNotRecognised =>
      'Na ji ka, amma ban sami sunan magani ba. Sake gwadawa ko ka rubuta shi.';

  @override
  String get stopListening => 'Daina saurare';

  @override
  String get tapToStop => 'Taɓa don tsayawa idan ka gama';

  @override
  String get tryAgain => 'Sake gwadawa';

  @override
  String get typeInstead => 'Rubuta maimakon haka';
}
