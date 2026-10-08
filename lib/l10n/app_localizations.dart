import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ha.dart';
import 'app_localizations_ig.dart';
import 'app_localizations_pcm.dart';
import 'app_localizations_yo.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ha'),
    Locale('ig'),
    Locale('pcm'),
    Locale('yo'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Remedi'**
  String get appName;

  /// No description provided for @notifChannelDoses.
  ///
  /// In en, this message translates to:
  /// **'Medication alarms'**
  String get notifChannelDoses;

  /// No description provided for @notifChannelDosesDesc.
  ///
  /// In en, this message translates to:
  /// **'Loud reminders when a dose is due'**
  String get notifChannelDosesDesc;

  /// No description provided for @notifChannelCare.
  ///
  /// In en, this message translates to:
  /// **'Care alerts'**
  String get notifChannelCare;

  /// No description provided for @notifChannelCareDesc.
  ///
  /// In en, this message translates to:
  /// **'Caregiver fail-safe and refill warnings'**
  String get notifChannelCareDesc;

  /// No description provided for @notifDoseTitle.
  ///
  /// In en, this message translates to:
  /// **'Time for your medicine'**
  String get notifDoseTitle;

  /// No description provided for @notifSnoozeTitle.
  ///
  /// In en, this message translates to:
  /// **'Snoozed reminder'**
  String get notifSnoozeTitle;

  /// No description provided for @notifDoseBody.
  ///
  /// In en, this message translates to:
  /// **'{medication} • take {amount}'**
  String notifDoseBody(String medication, String amount);

  /// No description provided for @notifCaregiverTitle.
  ///
  /// In en, this message translates to:
  /// **'Dose not confirmed'**
  String get notifCaregiverTitle;

  /// No description provided for @notifCaregiverBody.
  ///
  /// In en, this message translates to:
  /// **'{medication} is still unconfirmed. Tap to alert {caregiver} by SMS.'**
  String notifCaregiverBody(String medication, String caregiver);

  /// No description provided for @notifRefillTitle.
  ///
  /// In en, this message translates to:
  /// **'Refill needed soon'**
  String get notifRefillTitle;

  /// No description provided for @notifRefillBody.
  ///
  /// In en, this message translates to:
  /// **'Only {count} of {medication} left.'**
  String notifRefillBody(String count, String medication);

  /// No description provided for @actionMarkTaken.
  ///
  /// In en, this message translates to:
  /// **'Mark as taken'**
  String get actionMarkTaken;

  /// No description provided for @actionSnooze15.
  ///
  /// In en, this message translates to:
  /// **'Snooze 15m'**
  String get actionSnooze15;

  /// No description provided for @offlineReady.
  ///
  /// In en, this message translates to:
  /// **'Offline Ready'**
  String get offlineReady;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguage;

  /// No description provided for @chooseLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Reminders, alarms and instructions will use this language, even offline.'**
  String get chooseLanguageHint;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get profileTitle;

  /// No description provided for @formTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get formTablet;

  /// No description provided for @formCapsule.
  ///
  /// In en, this message translates to:
  /// **'Capsule'**
  String get formCapsule;

  /// No description provided for @formCaplet.
  ///
  /// In en, this message translates to:
  /// **'Caplet'**
  String get formCaplet;

  /// No description provided for @formSoftgel.
  ///
  /// In en, this message translates to:
  /// **'Softgel'**
  String get formSoftgel;

  /// No description provided for @formLiquid.
  ///
  /// In en, this message translates to:
  /// **'Liquid / Syrup'**
  String get formLiquid;

  /// No description provided for @formDrops.
  ///
  /// In en, this message translates to:
  /// **'Drops'**
  String get formDrops;

  /// No description provided for @formInjection.
  ///
  /// In en, this message translates to:
  /// **'Injection'**
  String get formInjection;

  /// No description provided for @formInhaler.
  ///
  /// In en, this message translates to:
  /// **'Inhaler'**
  String get formInhaler;

  /// No description provided for @formCream.
  ///
  /// In en, this message translates to:
  /// **'Cream / Ointment'**
  String get formCream;

  /// No description provided for @formSachet.
  ///
  /// In en, this message translates to:
  /// **'Sachet'**
  String get formSachet;

  /// No description provided for @unitMl.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get unitMl;

  /// No description provided for @unitDrops.
  ///
  /// In en, this message translates to:
  /// **'drops'**
  String get unitDrops;

  /// No description provided for @unitInjection.
  ///
  /// In en, this message translates to:
  /// **'injection'**
  String get unitInjection;

  /// No description provided for @unitPuffs.
  ///
  /// In en, this message translates to:
  /// **'puffs'**
  String get unitPuffs;

  /// No description provided for @unitApplication.
  ///
  /// In en, this message translates to:
  /// **'application'**
  String get unitApplication;

  /// No description provided for @unitSachet.
  ///
  /// In en, this message translates to:
  /// **'sachet'**
  String get unitSachet;

  /// No description provided for @unitPills.
  ///
  /// In en, this message translates to:
  /// **'pills'**
  String get unitPills;

  /// No description provided for @freqOnce.
  ///
  /// In en, this message translates to:
  /// **'Once daily'**
  String get freqOnce;

  /// No description provided for @freqTwice.
  ///
  /// In en, this message translates to:
  /// **'Twice daily'**
  String get freqTwice;

  /// No description provided for @freqThrice.
  ///
  /// In en, this message translates to:
  /// **'3 times daily'**
  String get freqThrice;

  /// No description provided for @freqPrn.
  ///
  /// In en, this message translates to:
  /// **'As needed'**
  String get freqPrn;

  /// No description provided for @freqOnceHint.
  ///
  /// In en, this message translates to:
  /// **'Morning focus'**
  String get freqOnceHint;

  /// No description provided for @freqTwiceHint.
  ///
  /// In en, this message translates to:
  /// **'Every 12 hours'**
  String get freqTwiceHint;

  /// No description provided for @freqThriceHint.
  ///
  /// In en, this message translates to:
  /// **'With meals'**
  String get freqThriceHint;

  /// No description provided for @freqPrnHint.
  ///
  /// In en, this message translates to:
  /// **'For sudden flares'**
  String get freqPrnHint;

  /// No description provided for @mealWith.
  ///
  /// In en, this message translates to:
  /// **'With meal'**
  String get mealWith;

  /// No description provided for @mealBefore.
  ///
  /// In en, this message translates to:
  /// **'Before food'**
  String get mealBefore;

  /// No description provided for @mealAfter.
  ///
  /// In en, this message translates to:
  /// **'After food'**
  String get mealAfter;

  /// No description provided for @mealEmpty.
  ///
  /// In en, this message translates to:
  /// **'Empty stomach'**
  String get mealEmpty;

  /// No description provided for @mealWater.
  ///
  /// In en, this message translates to:
  /// **'With water only'**
  String get mealWater;

  /// No description provided for @mealAny.
  ///
  /// In en, this message translates to:
  /// **'No food rule'**
  String get mealAny;

  /// No description provided for @mealWithHint.
  ///
  /// In en, this message translates to:
  /// **'During or right after'**
  String get mealWithHint;

  /// No description provided for @mealBeforeHint.
  ///
  /// In en, this message translates to:
  /// **'30 min prior'**
  String get mealBeforeHint;

  /// No description provided for @mealAfterHint.
  ///
  /// In en, this message translates to:
  /// **'Within 1 hour'**
  String get mealAfterHint;

  /// No description provided for @mealEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Full glass of water'**
  String get mealEmptyHint;

  /// No description provided for @mealWaterHint.
  ///
  /// In en, this message translates to:
  /// **'Any time, with water'**
  String get mealWaterHint;

  /// No description provided for @mealAnyHint.
  ///
  /// In en, this message translates to:
  /// **'Food does not matter'**
  String get mealAnyHint;

  /// No description provided for @skipStomach.
  ///
  /// In en, this message translates to:
  /// **'Stomach upset, nausea or vomiting'**
  String get skipStomach;

  /// No description provided for @skipStock.
  ///
  /// In en, this message translates to:
  /// **'Medication out of stock or misplaced'**
  String get skipStock;

  /// No description provided for @skipDoctor.
  ///
  /// In en, this message translates to:
  /// **'Instructed by my doctor to hold'**
  String get skipDoctor;

  /// No description provided for @skipOther.
  ///
  /// In en, this message translates to:
  /// **'Another reason'**
  String get skipOther;

  /// No description provided for @slotBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get slotBreakfast;

  /// No description provided for @slotLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get slotLunch;

  /// No description provided for @slotDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get slotDinner;

  /// No description provided for @slotBedtime.
  ///
  /// In en, this message translates to:
  /// **'Bedtime'**
  String get slotBedtime;

  /// No description provided for @slotCustom.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get slotCustom;

  /// No description provided for @symptomNausea.
  ///
  /// In en, this message translates to:
  /// **'Nausea'**
  String get symptomNausea;

  /// No description provided for @symptomDizziness.
  ///
  /// In en, this message translates to:
  /// **'Dizziness'**
  String get symptomDizziness;

  /// No description provided for @symptomDryCough.
  ///
  /// In en, this message translates to:
  /// **'Dry cough'**
  String get symptomDryCough;

  /// No description provided for @symptomFatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get symptomFatigue;

  /// No description provided for @symptomHeadache.
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get symptomHeadache;

  /// No description provided for @symptomSwelling.
  ///
  /// In en, this message translates to:
  /// **'Ankle swelling'**
  String get symptomSwelling;

  /// No description provided for @symptomMusclePain.
  ///
  /// In en, this message translates to:
  /// **'Muscle pain'**
  String get symptomMusclePain;

  /// No description provided for @symptomDiarrhea.
  ///
  /// In en, this message translates to:
  /// **'Diarrhoea'**
  String get symptomDiarrhea;

  /// No description provided for @symptomLowSugar.
  ///
  /// In en, this message translates to:
  /// **'Low sugar (shaky, sweaty)'**
  String get symptomLowSugar;

  /// No description provided for @symptomRash.
  ///
  /// In en, this message translates to:
  /// **'Skin rash'**
  String get symptomRash;

  /// No description provided for @symptomStomachPain.
  ///
  /// In en, this message translates to:
  /// **'Stomach pain'**
  String get symptomStomachPain;

  /// No description provided for @partMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get partMorning;

  /// No description provided for @partAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get partAfternoon;

  /// No description provided for @partEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get partEvening;

  /// No description provided for @partNight.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get partNight;

  /// No description provided for @navSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get navSchedule;

  /// No description provided for @navFastLog.
  ///
  /// In en, this message translates to:
  /// **'Fast Log'**
  String get navFastLog;

  /// No description provided for @navMyMeds.
  ///
  /// In en, this message translates to:
  /// **'My Meds'**
  String get navMyMeds;

  /// No description provided for @navHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get navHealth;

  /// No description provided for @toastDoseLogged.
  ///
  /// In en, this message translates to:
  /// **'{medication} logged as taken.'**
  String toastDoseLogged(String medication);

  /// No description provided for @toastSnoozedUntil.
  ///
  /// In en, this message translates to:
  /// **'Snoozed. We\'ll ring again at {time}.'**
  String toastSnoozedUntil(String time);

  /// No description provided for @snoozeLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Snooze limit reached. Please take or skip this dose.'**
  String get snoozeLimitReached;

  /// No description provided for @sosTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Alert'**
  String get sosTitle;

  /// No description provided for @sosNoCaregiver.
  ///
  /// In en, this message translates to:
  /// **'You have not added a caregiver yet. Add someone we can text or call for you in an emergency.'**
  String get sosNoCaregiver;

  /// No description provided for @addCaregiver.
  ///
  /// In en, this message translates to:
  /// **'Add a caregiver'**
  String get addCaregiver;

  /// No description provided for @sosBody.
  ///
  /// In en, this message translates to:
  /// **'Send an SMS or call {name}. SMS works without mobile data.'**
  String sosBody(String name);

  /// No description provided for @sosMessage.
  ///
  /// In en, this message translates to:
  /// **'URGENT from Remedi: {patient} needs help. Please call or check on them now.'**
  String sosMessage(String patient);

  /// No description provided for @sosDoseMessage.
  ///
  /// In en, this message translates to:
  /// **'Remedi alert: {patient} has not confirmed {medication} due at {time}. Please check on them.'**
  String sosDoseMessage(String patient, String medication, String time);

  /// No description provided for @sosSendSms.
  ///
  /// In en, this message translates to:
  /// **'Send SMS to {name}'**
  String sosSendSms(String name);

  /// No description provided for @sosCall.
  ///
  /// In en, this message translates to:
  /// **'Call {name}'**
  String sosCall(String name);

  /// No description provided for @skipTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Clinical Skip Reason'**
  String get skipTitle;

  /// No description provided for @skipAuditNote.
  ///
  /// In en, this message translates to:
  /// **'All skipped doses are recorded in your offline log for your doctor\'s medication review.'**
  String get skipAuditNote;

  /// No description provided for @skipAuditNoteDoctor.
  ///
  /// In en, this message translates to:
  /// **'All skipped doses are recorded in your offline log for {doctor}\'s medication review.'**
  String skipAuditNoteDoctor(String doctor);

  /// No description provided for @confirmSkip.
  ///
  /// In en, this message translates to:
  /// **'Confirm Recorded Skip'**
  String get confirmSkip;

  /// No description provided for @skipRecorded.
  ///
  /// In en, this message translates to:
  /// **'Skip recorded in your offline log.'**
  String get skipRecorded;

  /// No description provided for @logSymptomTitle.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling?'**
  String get logSymptomTitle;

  /// No description provided for @logSymptomHint.
  ///
  /// In en, this message translates to:
  /// **'Pick what you noticed. It will be shared in your doctor visit summary.'**
  String get logSymptomHint;

  /// No description provided for @symptomLogged.
  ///
  /// In en, this message translates to:
  /// **'{symptom} recorded.'**
  String symptomLogged(String symptom);

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String goodMorning(String name);

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}'**
  String goodAfternoon(String name);

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}'**
  String goodEvening(String name);

  /// No description provided for @emptyScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'No medicines yet'**
  String get emptyScheduleTitle;

  /// No description provided for @emptyScheduleBody.
  ///
  /// In en, this message translates to:
  /// **'Add your first medicine and Remedi will ring on time, even with no network.'**
  String get emptyScheduleBody;

  /// No description provided for @addMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add Medicine'**
  String get addMedicine;

  /// No description provided for @laterToday.
  ///
  /// In en, this message translates to:
  /// **'Later Today'**
  String get laterToday;

  /// No description provided for @dosesPending.
  ///
  /// In en, this message translates to:
  /// **'{count} pending'**
  String dosesPending(String count);

  /// No description provided for @sosButton.
  ///
  /// In en, this message translates to:
  /// **'Emergency SOS / Alert Caregiver (SMS)'**
  String get sosButton;

  /// No description provided for @moodAllDone.
  ///
  /// In en, this message translates to:
  /// **'All done!'**
  String get moodAllDone;

  /// No description provided for @moodGood.
  ///
  /// In en, this message translates to:
  /// **'Feeling good!'**
  String get moodGood;

  /// No description provided for @moodStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin.'**
  String get moodStart;

  /// No description provided for @noDosesToday.
  ///
  /// In en, this message translates to:
  /// **'No scheduled doses today.'**
  String get noDosesToday;

  /// No description provided for @dosesDoneOf.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} doses done today.'**
  String dosesDoneOf(String done, String total);

  /// No description provided for @snoozedUntil.
  ///
  /// In en, this message translates to:
  /// **'Snoozed until {time}'**
  String snoozedUntil(String time);

  /// No description provided for @overdueBy.
  ///
  /// In en, this message translates to:
  /// **'Overdue by {minutes} min'**
  String overdueBy(String minutes);

  /// No description provided for @dueNow.
  ///
  /// In en, this message translates to:
  /// **'Due now'**
  String get dueNow;

  /// No description provided for @dueInMinutes.
  ///
  /// In en, this message translates to:
  /// **'Due in {minutes} mins'**
  String dueInMinutes(String minutes);

  /// No description provided for @dueAt.
  ///
  /// In en, this message translates to:
  /// **'Due at {time}'**
  String dueAt(String time);

  /// No description provided for @upNext.
  ///
  /// In en, this message translates to:
  /// **'Up Next'**
  String get upNext;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @routineOf.
  ///
  /// In en, this message translates to:
  /// **'{slot} routine'**
  String routineOf(String slot);

  /// No description provided for @fullGlassWater.
  ///
  /// In en, this message translates to:
  /// **'Full glass of water'**
  String get fullGlassWater;

  /// No description provided for @markAsTaken.
  ///
  /// In en, this message translates to:
  /// **'Mark as Taken'**
  String get markAsTaken;

  /// No description provided for @snooze15.
  ///
  /// In en, this message translates to:
  /// **'Snooze 15m'**
  String get snooze15;

  /// No description provided for @noSnoozesLeft.
  ///
  /// In en, this message translates to:
  /// **'No snoozes left'**
  String get noSnoozesLeft;

  /// No description provided for @skipOrSideEffect.
  ///
  /// In en, this message translates to:
  /// **'Side effect / Skip'**
  String get skipOrSideEffect;

  /// No description provided for @allDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'All doses done today'**
  String get allDoneTitle;

  /// No description provided for @allDoneBody.
  ///
  /// In en, this message translates to:
  /// **'Well done. Consistency protects your health.'**
  String get allDoneBody;

  /// No description provided for @completedEarlier.
  ///
  /// In en, this message translates to:
  /// **'Completed Earlier'**
  String get completedEarlier;

  /// No description provided for @takenCount.
  ///
  /// In en, this message translates to:
  /// **'{count} taken'**
  String takenCount(String count);

  /// No description provided for @statusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get statusDone;

  /// No description provided for @statusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get statusSkipped;

  /// No description provided for @statusMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get statusMissed;

  /// No description provided for @tookItLate.
  ///
  /// In en, this message translates to:
  /// **'I took it'**
  String get tookItLate;

  /// No description provided for @doctorDirective.
  ///
  /// In en, this message translates to:
  /// **'Doctor\'s Clinical Directive'**
  String get doctorDirective;

  /// No description provided for @forMedication.
  ///
  /// In en, this message translates to:
  /// **'For {medication}'**
  String forMedication(String medication);

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @asNeededMeds.
  ///
  /// In en, this message translates to:
  /// **'As-needed medicines'**
  String get asNeededMeds;

  /// No description provided for @tookPrn.
  ///
  /// In en, this message translates to:
  /// **'Took {medication}'**
  String tookPrn(String medication);

  /// No description provided for @alarmAlert.
  ///
  /// In en, this message translates to:
  /// **'Alarm Alert'**
  String get alarmAlert;

  /// No description provided for @doseNotFound.
  ///
  /// In en, this message translates to:
  /// **'Dose not found'**
  String get doseNotFound;

  /// No description provided for @doseNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'This reminder may have been changed or removed.'**
  String get doseNotFoundBody;

  /// No description provided for @scheduledDose.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Dose'**
  String get scheduledDose;

  /// No description provided for @doseXofY.
  ///
  /// In en, this message translates to:
  /// **'Dose {index} of {total} today'**
  String doseXofY(String index, String total);

  /// No description provided for @prescribedFor.
  ///
  /// In en, this message translates to:
  /// **'Prescribed for:'**
  String get prescribedFor;

  /// No description provided for @routeOral.
  ///
  /// In en, this message translates to:
  /// **'Oral'**
  String get routeOral;

  /// No description provided for @criticalDirective.
  ///
  /// In en, this message translates to:
  /// **'Critical Clinical Directive'**
  String get criticalDirective;

  /// No description provided for @directiveWithMeal.
  ///
  /// In en, this message translates to:
  /// **'Take with your meal or right after eating'**
  String get directiveWithMeal;

  /// No description provided for @directiveAfterFood.
  ///
  /// In en, this message translates to:
  /// **'Take within 1 hour after food'**
  String get directiveAfterFood;

  /// No description provided for @directiveBeforeFood.
  ///
  /// In en, this message translates to:
  /// **'Take 30 minutes before food'**
  String get directiveBeforeFood;

  /// No description provided for @directiveEmpty.
  ///
  /// In en, this message translates to:
  /// **'Take on an empty stomach with a full glass of water'**
  String get directiveEmpty;

  /// No description provided for @directiveWater.
  ///
  /// In en, this message translates to:
  /// **'Take with plenty of clean water'**
  String get directiveWater;

  /// No description provided for @accountabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Accountability Confirmation'**
  String get accountabilityTitle;

  /// No description provided for @accountabilityBody.
  ///
  /// In en, this message translates to:
  /// **'Confirm you have actually taken it before completing this dose.'**
  String get accountabilityBody;

  /// No description provided for @confirmSwallowed.
  ///
  /// In en, this message translates to:
  /// **'I have swallowed {units} with a full cup of water'**
  String confirmSwallowed(String units);

  /// No description provided for @confirmApplied.
  ///
  /// In en, this message translates to:
  /// **'I have applied {units}'**
  String confirmApplied(String units);

  /// No description provided for @confirmInjected.
  ///
  /// In en, this message translates to:
  /// **'I have taken {units}'**
  String confirmInjected(String units);

  /// No description provided for @confirmInhaled.
  ///
  /// In en, this message translates to:
  /// **'I have taken {units} from my inhaler'**
  String confirmInhaled(String units);

  /// No description provided for @preventsEscalation.
  ///
  /// In en, this message translates to:
  /// **'Stops the caregiver alert for this dose'**
  String get preventsEscalation;

  /// No description provided for @iHaveTakenThisDose.
  ///
  /// In en, this message translates to:
  /// **'I Have Taken This Dose'**
  String get iHaveTakenThisDose;

  /// No description provided for @snoozeWithRemaining.
  ///
  /// In en, this message translates to:
  /// **'Snooze 15 Minutes ({count} left after this)'**
  String snoozeWithRemaining(String count);

  /// No description provided for @skipDoseRequiresReason.
  ///
  /// In en, this message translates to:
  /// **'Skip Dose (requires a clinical reason)'**
  String get skipDoseRequiresReason;

  /// No description provided for @overdueAlarm.
  ///
  /// In en, this message translates to:
  /// **'Overdue dose'**
  String get overdueAlarm;

  /// No description provided for @urgentAlarm.
  ///
  /// In en, this message translates to:
  /// **'Urgent alarm'**
  String get urgentAlarm;

  /// No description provided for @offlineVerified.
  ///
  /// In en, this message translates to:
  /// **'Offline verified • works without network'**
  String get offlineVerified;

  /// No description provided for @ringing.
  ///
  /// In en, this message translates to:
  /// **'Ringing'**
  String get ringing;

  /// No description provided for @alreadyTaken.
  ///
  /// In en, this message translates to:
  /// **'This dose is logged as taken'**
  String get alreadyTaken;

  /// No description provided for @alreadySkipped.
  ///
  /// In en, this message translates to:
  /// **'This dose was skipped'**
  String get alreadySkipped;

  /// No description provided for @loggedAt.
  ///
  /// In en, this message translates to:
  /// **'Logged at {time}'**
  String loggedAt(String time);

  /// No description provided for @caregiverSetupPrompt.
  ///
  /// In en, this message translates to:
  /// **'Add a caregiver so someone can be alerted if you miss a dose.'**
  String get caregiverSetupPrompt;

  /// No description provided for @caregiverFailSafe.
  ///
  /// In en, this message translates to:
  /// **'Caregiver Fail-Safe'**
  String get caregiverFailSafe;

  /// No description provided for @minutesQueue.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m queue'**
  String minutesQueue(String minutes);

  /// No description provided for @caregiverFailSafeBody.
  ///
  /// In en, this message translates to:
  /// **'If not confirmed by {time}, Remedi will prompt you to send an offline SMS alert to:'**
  String caregiverFailSafeBody(String time);

  /// No description provided for @caregiverAlertsOff.
  ///
  /// In en, this message translates to:
  /// **'Caregiver alerts are turned off. You can still text them:'**
  String get caregiverAlertsOff;

  /// No description provided for @cameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Camera is not available on this device.'**
  String get cameraUnavailable;

  /// No description provided for @analyzingPrescription.
  ///
  /// In en, this message translates to:
  /// **'Reading text on your device…'**
  String get analyzingPrescription;

  /// No description provided for @scanFound.
  ///
  /// In en, this message translates to:
  /// **'Found {medication}. Check the details below.'**
  String scanFound(String medication);

  /// No description provided for @scanNotRecognized.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t recognise the medicine. Please confirm the name.'**
  String get scanNotRecognized;

  /// No description provided for @confirmMedicine.
  ///
  /// In en, this message translates to:
  /// **'Confirm medicine'**
  String get confirmMedicine;

  /// No description provided for @instantIntake.
  ///
  /// In en, this message translates to:
  /// **'Instant Intake'**
  String get instantIntake;

  /// No description provided for @addNewMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add New Medicine'**
  String get addNewMedicine;

  /// No description provided for @addNewMedicineHint.
  ///
  /// In en, this message translates to:
  /// **'Snap your prescription sheet, scan the pill box, or tell us the name.'**
  String get addNewMedicineHint;

  /// No description provided for @smartScan.
  ///
  /// In en, this message translates to:
  /// **'Smart Instant Scan'**
  String get smartScan;

  /// No description provided for @works100Offline.
  ///
  /// In en, this message translates to:
  /// **'Works 100% Offline'**
  String get works100Offline;

  /// No description provided for @onDeviceOcr.
  ///
  /// In en, this message translates to:
  /// **'On-device'**
  String get onDeviceOcr;

  /// No description provided for @snapAutoFill.
  ///
  /// In en, this message translates to:
  /// **'Snap & Auto-Fill'**
  String get snapAutoFill;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @voiceNote.
  ///
  /// In en, this message translates to:
  /// **'Voice Note'**
  String get voiceNote;

  /// No description provided for @voiceNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Say the medicine name and strength'**
  String get voiceNoteHint;

  /// No description provided for @tapToSpeak.
  ///
  /// In en, this message translates to:
  /// **'Tap to speak'**
  String get tapToSpeak;

  /// No description provided for @typeName.
  ///
  /// In en, this message translates to:
  /// **'Type Name'**
  String get typeName;

  /// No description provided for @typeNameHint.
  ///
  /// In en, this message translates to:
  /// **'Search brand or generic name'**
  String get typeNameHint;

  /// No description provided for @manualEntry.
  ///
  /// In en, this message translates to:
  /// **'Manual entry'**
  String get manualEntry;

  /// No description provided for @quickPick.
  ///
  /// In en, this message translates to:
  /// **'Quick Pick Common Medicines'**
  String get quickPick;

  /// No description provided for @oneTapAdd.
  ///
  /// In en, this message translates to:
  /// **'1-Tap Add'**
  String get oneTapAdd;

  /// No description provided for @readingText.
  ///
  /// In en, this message translates to:
  /// **'Reading…'**
  String get readingText;

  /// No description provided for @lensReady.
  ///
  /// In en, this message translates to:
  /// **'Lens Ready'**
  String get lensReady;

  /// No description provided for @aimInsideBox.
  ///
  /// In en, this message translates to:
  /// **'Aim inside box'**
  String get aimInsideBox;

  /// No description provided for @aimHint.
  ///
  /// In en, this message translates to:
  /// **'Aim at pill box, blister pack, or doctor\'s paper script'**
  String get aimHint;

  /// No description provided for @searchMedicineHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Metformin, Panadol, Amlodipine'**
  String get searchMedicineHint;

  /// No description provided for @useCustomMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add \"{name}\"'**
  String useCustomMedicine(String name);

  /// No description provided for @useCustomMedicineHint.
  ///
  /// In en, this message translates to:
  /// **'Not in the list? Add it with your own details.'**
  String get useCustomMedicineHint;

  /// No description provided for @voiceSheetHint.
  ///
  /// In en, this message translates to:
  /// **'For example: \"Metformin five hundred milligrams\".'**
  String get voiceSheetHint;

  /// No description provided for @voiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition is not available. Please type the name instead.'**
  String get voiceUnavailable;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening…'**
  String get listening;

  /// No description provided for @tapMicToSpeak.
  ///
  /// In en, this message translates to:
  /// **'Tap the microphone and speak.'**
  String get tapMicToSpeak;

  /// No description provided for @useThisMedicine.
  ///
  /// In en, this message translates to:
  /// **'Use {medication}'**
  String useThisMedicine(String medication);

  /// No description provided for @editMedicine.
  ///
  /// In en, this message translates to:
  /// **'Edit medicine'**
  String get editMedicine;

  /// No description provided for @drugNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Medicine name'**
  String get drugNameLabel;

  /// No description provided for @drugNameHint.
  ///
  /// In en, this message translates to:
  /// **'Brand or generic name'**
  String get drugNameHint;

  /// No description provided for @strengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Strength & unit'**
  String get strengthLabel;

  /// No description provided for @strengthHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 500mg, 5ml'**
  String get strengthHint;

  /// No description provided for @doseFormLabel.
  ///
  /// In en, this message translates to:
  /// **'Dose form'**
  String get doseFormLabel;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This is required'**
  String get requiredField;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @saveContinue.
  ///
  /// In en, this message translates to:
  /// **'Save & continue'**
  String get saveContinue;

  /// No description provided for @addAtLeastOneTime.
  ///
  /// In en, this message translates to:
  /// **'Add at least one reminder time.'**
  String get addAtLeastOneTime;

  /// No description provided for @remindersSet.
  ///
  /// In en, this message translates to:
  /// **'Reminders set for {medication}.'**
  String remindersSet(String medication);

  /// No description provided for @changesSaved.
  ///
  /// In en, this message translates to:
  /// **'Changes saved.'**
  String get changesSaved;

  /// No description provided for @editRoutine.
  ///
  /// In en, this message translates to:
  /// **'Edit Routine'**
  String get editRoutine;

  /// No description provided for @stepScheduleFood.
  ///
  /// In en, this message translates to:
  /// **'Step 1 of 2 • Schedule & Food'**
  String get stepScheduleFood;

  /// No description provided for @unnamedMedicine.
  ///
  /// In en, this message translates to:
  /// **'Unnamed medicine'**
  String get unnamedMedicine;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @howOften.
  ///
  /// In en, this message translates to:
  /// **'1. How often do you take it?'**
  String get howOften;

  /// No description provided for @tapToSelect.
  ///
  /// In en, this message translates to:
  /// **'Tap to select'**
  String get tapToSelect;

  /// No description provided for @foodRoutine.
  ///
  /// In en, this message translates to:
  /// **'2. Food Routine'**
  String get foodRoutine;

  /// No description provided for @preventsNausea.
  ///
  /// In en, this message translates to:
  /// **'Prevents nausea'**
  String get preventsNausea;

  /// No description provided for @prnNoReminders.
  ///
  /// In en, this message translates to:
  /// **'As-needed medicines have no alarms. Log each dose from the Schedule tab when you take it.'**
  String get prnNoReminders;

  /// No description provided for @reminderTimes.
  ///
  /// In en, this message translates to:
  /// **'3. Reminder Times'**
  String get reminderTimes;

  /// No description provided for @basedOnRoutine.
  ///
  /// In en, this message translates to:
  /// **'Based on your routine'**
  String get basedOnRoutine;

  /// No description provided for @addReminderTime.
  ///
  /// In en, this message translates to:
  /// **'Add reminder time'**
  String get addReminderTime;

  /// No description provided for @offlineAlarmsTitle.
  ///
  /// In en, this message translates to:
  /// **'Offline Alarms'**
  String get offlineAlarmsTitle;

  /// No description provided for @offlineAlarmsBody.
  ///
  /// In en, this message translates to:
  /// **'Alerts ring reliably even without cell reception or internet connection.'**
  String get offlineAlarmsBody;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @saveSetReminders.
  ///
  /// In en, this message translates to:
  /// **'Save & Set Reminders'**
  String get saveSetReminders;

  /// No description provided for @moreClinicalDetails.
  ///
  /// In en, this message translates to:
  /// **'More clinical details'**
  String get moreClinicalDetails;

  /// No description provided for @moreClinicalDetailsHint.
  ///
  /// In en, this message translates to:
  /// **'(optional doctor notes, refills)'**
  String get moreClinicalDetailsHint;

  /// No description provided for @doseSlotLabel.
  ///
  /// In en, this message translates to:
  /// **'Dose {number} • {slot}'**
  String doseSlotLabel(String number, String slot);

  /// No description provided for @adjustTime.
  ///
  /// In en, this message translates to:
  /// **'Adjust time'**
  String get adjustTime;

  /// No description provided for @doseAmount.
  ///
  /// In en, this message translates to:
  /// **'Dose amount'**
  String get doseAmount;

  /// No description provided for @removeTime.
  ///
  /// In en, this message translates to:
  /// **'Remove time'**
  String get removeTime;

  /// No description provided for @nameStrengthRequired.
  ///
  /// In en, this message translates to:
  /// **'Medicine name and strength are required.'**
  String get nameStrengthRequired;

  /// No description provided for @clinicalDetails.
  ///
  /// In en, this message translates to:
  /// **'Clinical Details'**
  String get clinicalDetails;

  /// No description provided for @safeIntakeProtocol.
  ///
  /// In en, this message translates to:
  /// **'Safe Offline Intake Protocol'**
  String get safeIntakeProtocol;

  /// No description provided for @clinicalDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ailment & Prescription Details'**
  String get clinicalDetailsTitle;

  /// No description provided for @clinicalDetailsStep.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 2: Clinical context for {medication}'**
  String clinicalDetailsStep(String medication);

  /// No description provided for @whyExtraTime.
  ///
  /// In en, this message translates to:
  /// **'Why this takes extra time'**
  String get whyExtraTime;

  /// No description provided for @whyExtraTimeBody.
  ///
  /// In en, this message translates to:
  /// **'Entering exact diagnoses, doctor instructions and supply details makes your offline alarms, refill warnings and doctor summary accurate, even with zero network signal.'**
  String get whyExtraTimeBody;

  /// No description provided for @diagnosedContext.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed Ailment Context'**
  String get diagnosedContext;

  /// No description provided for @conditionLabel.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed condition'**
  String get conditionLabel;

  /// No description provided for @conditionHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Hypertension, Type 2 Diabetes'**
  String get conditionHint;

  /// No description provided for @facilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Hospital / Facility'**
  String get facilityLabel;

  /// No description provided for @facilityHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Lagoon Hospital, Ikoyi'**
  String get facilityHint;

  /// No description provided for @prescriberLabel.
  ///
  /// In en, this message translates to:
  /// **'Prescribing doctor'**
  String get prescriberLabel;

  /// No description provided for @prescriberHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Dr. Adeleke'**
  String get prescriberHint;

  /// No description provided for @specialtyLabel.
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get specialtyLabel;

  /// No description provided for @specialtyHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Cardiology'**
  String get specialtyHint;

  /// No description provided for @doctorPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Doctor / clinic phone'**
  String get doctorPhoneLabel;

  /// No description provided for @prescriptionDetails.
  ///
  /// In en, this message translates to:
  /// **'Prescription Details'**
  String get prescriptionDetails;

  /// No description provided for @doctorInstructionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Doctor\'s instructions'**
  String get doctorInstructionsLabel;

  /// No description provided for @doctorInstructionsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Drink 2 full glasses of water with it'**
  String get doctorInstructionsHint;

  /// No description provided for @pillDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'What the pill looks like'**
  String get pillDescriptionLabel;

  /// No description provided for @pillDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. White oblong tablet marked \'M 500\''**
  String get pillDescriptionHint;

  /// No description provided for @rxNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Prescription number'**
  String get rxNumberLabel;

  /// No description provided for @prescriptionBackup.
  ///
  /// In en, this message translates to:
  /// **'Prescription Paper Backup'**
  String get prescriptionBackup;

  /// No description provided for @noPrescriptionPhoto.
  ///
  /// In en, this message translates to:
  /// **'No photo yet'**
  String get noPrescriptionPhoto;

  /// No description provided for @prescriptionSaved.
  ///
  /// In en, this message translates to:
  /// **'Prescription photo saved'**
  String get prescriptionSaved;

  /// No description provided for @storedOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Stored only on this phone'**
  String get storedOnDevice;

  /// No description provided for @attachPhoto.
  ///
  /// In en, this message translates to:
  /// **'Attach photo'**
  String get attachPhoto;

  /// No description provided for @supplyTracking.
  ///
  /// In en, this message translates to:
  /// **'Supply & Refill Tracking'**
  String get supplyTracking;

  /// No description provided for @stockLabel.
  ///
  /// In en, this message translates to:
  /// **'{unit} in stock'**
  String stockLabel(String unit);

  /// No description provided for @refillAlertAt.
  ///
  /// In en, this message translates to:
  /// **'Refill alert at'**
  String get refillAlertAt;

  /// No description provided for @refillExplainer.
  ///
  /// In en, this message translates to:
  /// **'Remedi counts down with every dose you log and warns you offline when supply runs low.'**
  String get refillExplainer;

  /// No description provided for @sideEffectWatchlist.
  ///
  /// In en, this message translates to:
  /// **'Known Side Effects Watchlist'**
  String get sideEffectWatchlist;

  /// No description provided for @sideEffectWatchlistHint.
  ///
  /// In en, this message translates to:
  /// **'Select symptoms your doctor flagged for {medication}. You can log them from your health journal.'**
  String sideEffectWatchlistHint(String medication);

  /// No description provided for @encryptedLocal.
  ///
  /// In en, this message translates to:
  /// **'Saved only in your phone\'s private storage'**
  String get encryptedLocal;

  /// No description provided for @saveMedicineSetReminders.
  ///
  /// In en, this message translates to:
  /// **'Save Medicine & Set Reminders'**
  String get saveMedicineSetReminders;

  /// No description provided for @backToRoutine.
  ///
  /// In en, this message translates to:
  /// **'Back to Schedule & Food'**
  String get backToRoutine;

  /// No description provided for @medicineCabinet.
  ///
  /// In en, this message translates to:
  /// **'Medicine Cabinet'**
  String get medicineCabinet;

  /// No description provided for @activeCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Active'**
  String activeCount(String count);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @cabinetHint.
  ///
  /// In en, this message translates to:
  /// **'Your prescribed medicines, safe-use guides and refill trackers.'**
  String get cabinetHint;

  /// No description provided for @searchCabinet.
  ///
  /// In en, this message translates to:
  /// **'Search your medicines'**
  String get searchCabinet;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All ({count})'**
  String filterAll(String count);

  /// No description provided for @emptyCabinetTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cabinet is empty'**
  String get emptyCabinetTitle;

  /// No description provided for @noMedsInCategory.
  ///
  /// In en, this message translates to:
  /// **'No medicines in this category'**
  String get noMedsInCategory;

  /// No description provided for @noMedsInCategoryBody.
  ///
  /// In en, this message translates to:
  /// **'Tap \'All\' to view your list or add a medicine for this time of day.'**
  String get noMedsInCategoryBody;

  /// No description provided for @offlineSynchronized.
  ///
  /// In en, this message translates to:
  /// **'Saved Offline'**
  String get offlineSynchronized;

  /// No description provided for @offlineSynchronizedBody.
  ///
  /// In en, this message translates to:
  /// **'Prescription safety cards are stored on your phone for review even without cell service.'**
  String get offlineSynchronizedBody;

  /// No description provided for @supplyNotTracked.
  ///
  /// In en, this message translates to:
  /// **'Stock not tracked'**
  String get supplyNotTracked;

  /// No description provided for @lowSupply.
  ///
  /// In en, this message translates to:
  /// **'Low supply'**
  String get lowSupply;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'{days} days left'**
  String daysLeft(String days);

  /// No description provided for @goodSupply.
  ///
  /// In en, this message translates to:
  /// **'Good supply'**
  String get goodSupply;

  /// No description provided for @savedOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device'**
  String get savedOnDevice;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @refillMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello, I would like a refill of {medication}{rx} for {patient}. Thank you.'**
  String refillMessage(String medication, String rx, String patient);

  /// No description provided for @refillSubject.
  ///
  /// In en, this message translates to:
  /// **'Refill request: {medication}'**
  String refillSubject(String medication);

  /// No description provided for @activeRx.
  ///
  /// In en, this message translates to:
  /// **'Active Rx'**
  String get activeRx;

  /// No description provided for @supplyTracker.
  ///
  /// In en, this message translates to:
  /// **'Supply Tracker'**
  String get supplyTracker;

  /// No description provided for @daysRemaining.
  ///
  /// In en, this message translates to:
  /// **'{days} days remaining'**
  String daysRemaining(String days);

  /// No description provided for @refillBy.
  ///
  /// In en, this message translates to:
  /// **'Refill by {date}'**
  String refillBy(String date);

  /// No description provided for @prescriber.
  ///
  /// In en, this message translates to:
  /// **'Prescriber'**
  String get prescriber;

  /// No description provided for @clinicalInstructions.
  ///
  /// In en, this message translates to:
  /// **'Clinical Instructions'**
  String get clinicalInstructions;

  /// No description provided for @requestRefill.
  ///
  /// In en, this message translates to:
  /// **'Request Pharmacy Refill'**
  String get requestRefill;

  /// No description provided for @openFullDetails.
  ///
  /// In en, this message translates to:
  /// **'Open full details'**
  String get openFullDetails;

  /// No description provided for @editMedicationDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Medication Details'**
  String get editMedicationDetails;

  /// No description provided for @medicationDetail.
  ///
  /// In en, this message translates to:
  /// **'Medication Detail'**
  String get medicationDetail;

  /// No description provided for @medicineNotFound.
  ///
  /// In en, this message translates to:
  /// **'Medicine not found'**
  String get medicineNotFound;

  /// No description provided for @updateStock.
  ///
  /// In en, this message translates to:
  /// **'Update stock'**
  String get updateStock;

  /// No description provided for @updateStockHint.
  ///
  /// In en, this message translates to:
  /// **'How many do you have now? Tap a refill amount to add it.'**
  String get updateStockHint;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @stockUpdated.
  ///
  /// In en, this message translates to:
  /// **'Stock updated.'**
  String get stockUpdated;

  /// No description provided for @stopMedicineTitle.
  ///
  /// In en, this message translates to:
  /// **'Stop {medication}?'**
  String stopMedicineTitle(String medication);

  /// No description provided for @stopMedicineBody.
  ///
  /// In en, this message translates to:
  /// **'Reminders will stop. Your dose history is kept for your doctor\'s review. Only stop a medicine if your doctor told you to.'**
  String get stopMedicineBody;

  /// No description provided for @stopMedicine.
  ///
  /// In en, this message translates to:
  /// **'Stop medicine'**
  String get stopMedicine;

  /// No description provided for @medicineStopped.
  ///
  /// In en, this message translates to:
  /// **'{medication} stopped. Reminders cancelled.'**
  String medicineStopped(String medication);

  /// No description provided for @backToCabinet.
  ///
  /// In en, this message translates to:
  /// **'Back to Cabinet'**
  String get backToCabinet;

  /// No description provided for @encryptedLocalRecord.
  ///
  /// In en, this message translates to:
  /// **'Private local record'**
  String get encryptedLocalRecord;

  /// No description provided for @remainingSupply.
  ///
  /// In en, this message translates to:
  /// **'Remaining Supply'**
  String get remainingSupply;

  /// No description provided for @notTracked.
  ///
  /// In en, this message translates to:
  /// **'Not tracked'**
  String get notTracked;

  /// No description provided for @pillIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Pill Identifier'**
  String get pillIdentifier;

  /// No description provided for @seePrescriptionPhoto.
  ///
  /// In en, this message translates to:
  /// **'See prescription photo'**
  String get seePrescriptionPhoto;

  /// No description provided for @dosageRoutine.
  ///
  /// In en, this message translates to:
  /// **'Dosage Routine'**
  String get dosageRoutine;

  /// No description provided for @perIntake.
  ///
  /// In en, this message translates to:
  /// **'{units} per intake'**
  String perIntake(String units);

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'{amount}/day'**
  String perDay(String amount);

  /// No description provided for @safetyInteractions.
  ///
  /// In en, this message translates to:
  /// **'Safety & Interactions'**
  String get safetyInteractions;

  /// No description provided for @offlineSafetyDb.
  ///
  /// In en, this message translates to:
  /// **'Offline reference, no internet needed'**
  String get offlineSafetyDb;

  /// No description provided for @notInReference.
  ///
  /// In en, this message translates to:
  /// **'Not in the offline reference'**
  String get notInReference;

  /// No description provided for @noKnownClash.
  ///
  /// In en, this message translates to:
  /// **'No known clash found'**
  String get noKnownClash;

  /// No description provided for @noOtherMeds.
  ///
  /// In en, this message translates to:
  /// **'You have no other active medicines.'**
  String get noOtherMeds;

  /// No description provided for @checkedAgainst.
  ///
  /// In en, this message translates to:
  /// **'Checked against: {medications}'**
  String checkedAgainst(String medications);

  /// No description provided for @checked.
  ///
  /// In en, this message translates to:
  /// **'Checked'**
  String get checked;

  /// No description provided for @interactionWith.
  ///
  /// In en, this message translates to:
  /// **'Interaction with {medication}'**
  String interactionWith(String medication);

  /// No description provided for @askDoctor.
  ///
  /// In en, this message translates to:
  /// **'Ask doctor'**
  String get askDoctor;

  /// No description provided for @caution.
  ///
  /// In en, this message translates to:
  /// **'Caution'**
  String get caution;

  /// No description provided for @dietWarning.
  ///
  /// In en, this message translates to:
  /// **'Diet & Alcohol Warning'**
  String get dietWarning;

  /// No description provided for @missedDoseTitle.
  ///
  /// In en, this message translates to:
  /// **'What to do if a dose is missed?'**
  String get missedDoseTitle;

  /// No description provided for @missedDoseGeneric.
  ///
  /// In en, this message translates to:
  /// **'Take it as soon as you remember. If it is almost time for the next dose, skip the missed one. Never take a double dose.'**
  String get missedDoseGeneric;

  /// No description provided for @storageUse.
  ///
  /// In en, this message translates to:
  /// **'Storage & use'**
  String get storageUse;

  /// No description provided for @referenceDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'General guidance only. Always follow your doctor or pharmacist.'**
  String get referenceDisclaimer;

  /// No description provided for @prescriptionOrigin.
  ///
  /// In en, this message translates to:
  /// **'Prescription Origin'**
  String get prescriptionOrigin;

  /// No description provided for @prescriberUnknown.
  ///
  /// In en, this message translates to:
  /// **'Prescriber not added'**
  String get prescriberUnknown;

  /// No description provided for @callClinic.
  ///
  /// In en, this message translates to:
  /// **'Call clinic'**
  String get callClinic;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @emergencyResponder.
  ///
  /// In en, this message translates to:
  /// **'Emergency Responder'**
  String get emergencyResponder;

  /// No description provided for @smsLinked.
  ///
  /// In en, this message translates to:
  /// **'SMS Linked'**
  String get smsLinked;

  /// No description provided for @logDoseNow.
  ///
  /// In en, this message translates to:
  /// **'Log Dose Now ({units})'**
  String logDoseNow(String units);

  /// No description provided for @refillSms.
  ///
  /// In en, this message translates to:
  /// **'Offline Refill SMS'**
  String get refillSms;

  /// No description provided for @editRoutineBtn.
  ///
  /// In en, this message translates to:
  /// **'Edit Routine'**
  String get editRoutineBtn;

  /// No description provided for @logSideEffect.
  ///
  /// In en, this message translates to:
  /// **'Log side effect'**
  String get logSideEffect;

  /// No description provided for @bpNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get bpNormal;

  /// No description provided for @bpElevated.
  ///
  /// In en, this message translates to:
  /// **'Elevated'**
  String get bpElevated;

  /// No description provided for @bpStage1.
  ///
  /// In en, this message translates to:
  /// **'High • Stage 1'**
  String get bpStage1;

  /// No description provided for @bpStage2.
  ///
  /// In en, this message translates to:
  /// **'High • Stage 2'**
  String get bpStage2;

  /// No description provided for @bpCrisis.
  ///
  /// In en, this message translates to:
  /// **'Crisis level'**
  String get bpCrisis;

  /// No description provided for @bpCrisisAdvice.
  ///
  /// In en, this message translates to:
  /// **'This reading is very high. Rest 5 minutes and re-check. If it stays high or you feel unwell, seek emergency care now.'**
  String get bpCrisisAdvice;

  /// No description provided for @enterBothValues.
  ///
  /// In en, this message translates to:
  /// **'Enter both numbers.'**
  String get enterBothValues;

  /// No description provided for @enterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter a value.'**
  String get enterValue;

  /// No description provided for @valueLooksWrong.
  ///
  /// In en, this message translates to:
  /// **'That value looks wrong. Please check and try again.'**
  String get valueLooksWrong;

  /// No description provided for @vitalSaved.
  ///
  /// In en, this message translates to:
  /// **'Reading saved.'**
  String get vitalSaved;

  /// No description provided for @logVitalTitle.
  ///
  /// In en, this message translates to:
  /// **'Log a reading'**
  String get logVitalTitle;

  /// No description provided for @systolic.
  ///
  /// In en, this message translates to:
  /// **'Top (systolic)'**
  String get systolic;

  /// No description provided for @diastolic.
  ///
  /// In en, this message translates to:
  /// **'Bottom (diastolic)'**
  String get diastolic;

  /// No description provided for @saveReading.
  ///
  /// In en, this message translates to:
  /// **'Save reading'**
  String get saveReading;

  /// No description provided for @bloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure'**
  String get bloodPressure;

  /// No description provided for @bloodSugar.
  ///
  /// In en, this message translates to:
  /// **'Blood sugar'**
  String get bloodSugar;

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'Heart rate'**
  String get heartRate;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get steps;

  /// No description provided for @myHealth.
  ///
  /// In en, this message translates to:
  /// **'My Health'**
  String get myHealth;

  /// No description provided for @doctorVisitTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Visit Summary'**
  String get doctorVisitTitle;

  /// No description provided for @doctorVisitBody.
  ///
  /// In en, this message translates to:
  /// **'Take your full medicine and vitals log to your next appointment. No mobile data needed.'**
  String get doctorVisitBody;

  /// No description provided for @generateSummary.
  ///
  /// In en, this message translates to:
  /// **'Generate Doctor Visit Summary (PDF / QR)'**
  String get generateSummary;

  /// No description provided for @offlineDataVault.
  ///
  /// In en, this message translates to:
  /// **'Offline Data Vault'**
  String get offlineDataVault;

  /// No description provided for @localAndPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private & stored on this phone'**
  String get localAndPrivate;

  /// No description provided for @pendingCount.
  ///
  /// In en, this message translates to:
  /// **'{count} pending'**
  String pendingCount(String count);

  /// No description provided for @vaultBody.
  ///
  /// In en, this message translates to:
  /// **'All medication and vitals logs are stored on this phone. {count} changes are queued for cloud backup once it is enabled.'**
  String vaultBody(String count);

  /// No description provided for @attemptSync.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get attemptSync;

  /// No description provided for @cloudSyncNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Cloud backup is not switched on yet. Your data is safe on this phone.'**
  String get cloudSyncNotConfigured;

  /// No description provided for @noDataYet.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get noDataYet;

  /// No description provided for @excellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get excellent;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @needsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get needsAttention;

  /// No description provided for @adherence30.
  ///
  /// In en, this message translates to:
  /// **'30-day adherence'**
  String get adherence30;

  /// No description provided for @target90.
  ///
  /// In en, this message translates to:
  /// **'target ≥90%'**
  String get target90;

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get currentStreak;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @onTimeRate.
  ///
  /// In en, this message translates to:
  /// **'{percent}% taken on time'**
  String onTimeRate(String percent);

  /// No description provided for @weeklyRoutine.
  ///
  /// In en, this message translates to:
  /// **'Weekly Routine'**
  String get weeklyRoutine;

  /// No description provided for @missedThisWeek.
  ///
  /// In en, this message translates to:
  /// **'{count} missed doses this week'**
  String missedThisWeek(String count);

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get last7Days;

  /// No description provided for @legendOnTime.
  ///
  /// In en, this message translates to:
  /// **'On time'**
  String get legendOnTime;

  /// No description provided for @legendLate.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get legendLate;

  /// No description provided for @legendMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed / skipped'**
  String get legendMissed;

  /// No description provided for @languageCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Language & Voice'**
  String get languageCardTitle;

  /// No description provided for @languageCardBody.
  ///
  /// In en, this message translates to:
  /// **'Reminders and alarms use your selected language, even when completely offline.'**
  String get languageCardBody;

  /// No description provided for @vitalsQuickLogger.
  ///
  /// In en, this message translates to:
  /// **'Vitals Quick Logger'**
  String get vitalsQuickLogger;

  /// No description provided for @seeTrends.
  ///
  /// In en, this message translates to:
  /// **'See trends'**
  String get seeTrends;

  /// No description provided for @noVitalsYet.
  ///
  /// In en, this message translates to:
  /// **'No readings yet. Log your blood pressure or sugar to track trends.'**
  String get noVitalsYet;

  /// No description provided for @logBpOrSugar.
  ///
  /// In en, this message translates to:
  /// **'Log Blood Pressure or Sugar'**
  String get logBpOrSugar;

  /// No description provided for @otherMedicines.
  ///
  /// In en, this message translates to:
  /// **'Other medicines'**
  String get otherMedicines;

  /// No description provided for @activeConditions.
  ///
  /// In en, this message translates to:
  /// **'Active Conditions & Regimens'**
  String get activeConditions;

  /// No description provided for @conditionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} groups'**
  String conditionsCount(String count);

  /// No description provided for @since.
  ///
  /// In en, this message translates to:
  /// **'Since {date}'**
  String since(String date);

  /// No description provided for @refillInDays.
  ///
  /// In en, this message translates to:
  /// **'Refill in {days}d'**
  String refillInDays(String days);

  /// No description provided for @lowSupplyNotice.
  ///
  /// In en, this message translates to:
  /// **'Low supply: {medication}, only {amount} left'**
  String lowSupplyNotice(String medication, String amount);

  /// No description provided for @orderRefill.
  ///
  /// In en, this message translates to:
  /// **'Order Refill'**
  String get orderRefill;

  /// No description provided for @symptomsNotes.
  ///
  /// In en, this message translates to:
  /// **'Symptoms & Notes'**
  String get symptomsNotes;

  /// No description provided for @noSymptoms.
  ///
  /// In en, this message translates to:
  /// **'No symptoms logged in the last 30 days.'**
  String get noSymptoms;

  /// No description provided for @healthSynced.
  ///
  /// In en, this message translates to:
  /// **'Health data synced to this phone.'**
  String get healthSynced;

  /// No description provided for @healthConnectMissing.
  ///
  /// In en, this message translates to:
  /// **'Health Connect is not installed. Opening the store…'**
  String get healthConnectMissing;

  /// No description provided for @healthUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Health data is not available on this device.'**
  String get healthUnavailable;

  /// No description provided for @healthDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission was not granted. You can allow it in your phone\'s settings.'**
  String get healthDenied;

  /// No description provided for @bpAfterDose.
  ///
  /// In en, this message translates to:
  /// **'Recorded {minutes} min after your {medication} dose.'**
  String bpAfterDose(String minutes, String medication);

  /// No description provided for @vitalsAndSync.
  ///
  /// In en, this message translates to:
  /// **'Vitals & Health Sync'**
  String get vitalsAndSync;

  /// No description provided for @connectedActive.
  ///
  /// In en, this message translates to:
  /// **'Connected & Active'**
  String get connectedActive;

  /// No description provided for @notConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get notConnected;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @onDeviceOnly.
  ///
  /// In en, this message translates to:
  /// **'Processed on your phone only • no cloud'**
  String get onDeviceOnly;

  /// No description provided for @restingHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Resting Heart Rate'**
  String get restingHeartRate;

  /// No description provided for @bpmRange.
  ///
  /// In en, this message translates to:
  /// **'{min} – {max} BPM'**
  String bpmRange(String min, String max);

  /// No description provided for @bpmAvg7d.
  ///
  /// In en, this message translates to:
  /// **'BPM avg (7 days)'**
  String get bpmAvg7d;

  /// No description provided for @noHeartData.
  ///
  /// In en, this message translates to:
  /// **'No heart rate readings in the last 7 days.'**
  String get noHeartData;

  /// No description provided for @connectToSeeHeart.
  ///
  /// In en, this message translates to:
  /// **'Connect your health app to see heart rate from your watch or phone.'**
  String get connectToSeeHeart;

  /// No description provided for @dailyMobility.
  ///
  /// In en, this message translates to:
  /// **'Daily Mobility'**
  String get dailyMobility;

  /// No description provided for @goalSteps.
  ///
  /// In en, this message translates to:
  /// **'Goal {steps}'**
  String goalSteps(String steps);

  /// No description provided for @stepsDistance.
  ///
  /// In en, this message translates to:
  /// **'About {km} km today'**
  String stepsDistance(String km);

  /// No description provided for @pillVitalsHarmony.
  ///
  /// In en, this message translates to:
  /// **'Pill & Vitals Harmony'**
  String get pillVitalsHarmony;

  /// No description provided for @harmonyPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Readings are matched with your dose log on this phone. Nothing is uploaded.'**
  String get harmonyPrivacy;

  /// No description provided for @bloodPressureCheck.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Check'**
  String get bloodPressureCheck;

  /// No description provided for @offlineBiometricCache.
  ///
  /// In en, this message translates to:
  /// **'Offline Health Cache'**
  String get offlineBiometricCache;

  /// No description provided for @biometricPoints.
  ///
  /// In en, this message translates to:
  /// **'{count} readings stored securely on this phone.'**
  String biometricPoints(String count);

  /// No description provided for @autoSyncOnOpen.
  ///
  /// In en, this message translates to:
  /// **'Auto-sync when I open Remedi'**
  String get autoSyncOnOpen;

  /// No description provided for @autoSyncOnOpenHint.
  ///
  /// In en, this message translates to:
  /// **'Pull new readings from your health app each time'**
  String get autoSyncOnOpenHint;

  /// No description provided for @generateClinicalReport.
  ///
  /// In en, this message translates to:
  /// **'Generate Clinical Report (PDF & QR)'**
  String get generateClinicalReport;

  /// No description provided for @exportPrepared.
  ///
  /// In en, this message translates to:
  /// **'Summary prepared on your phone.'**
  String get exportPrepared;

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create the summary. Please try again.'**
  String get exportFailed;

  /// No description provided for @handoverProtocol.
  ///
  /// In en, this message translates to:
  /// **'Physician Handover'**
  String get handoverProtocol;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Clinical Summary & QR Export'**
  String get summaryTitle;

  /// No description provided for @summarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Zero-connectivity handover for outpatient visits, triage and emergencies.'**
  String get summarySubtitle;

  /// No description provided for @ageYears.
  ///
  /// In en, this message translates to:
  /// **'{age} yrs'**
  String ageYears(String age);

  /// No description provided for @bloodGroupValue.
  ///
  /// In en, this message translates to:
  /// **'Blood: {group}'**
  String bloodGroupValue(String group);

  /// No description provided for @genotypeValue.
  ///
  /// In en, this message translates to:
  /// **'Genotype: {genotype}'**
  String genotypeValue(String genotype);

  /// No description provided for @primaryDiagnoses.
  ///
  /// In en, this message translates to:
  /// **'Primary Diagnoses'**
  String get primaryDiagnoses;

  /// No description provided for @noneRecorded.
  ///
  /// In en, this message translates to:
  /// **'None recorded'**
  String get noneRecorded;

  /// No description provided for @allergiesValue.
  ///
  /// In en, this message translates to:
  /// **'Allergies: {allergies}'**
  String allergiesValue(String allergies);

  /// No description provided for @generatedOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Generated on this phone'**
  String get generatedOnDevice;

  /// No description provided for @generatedAt.
  ///
  /// In en, this message translates to:
  /// **'{time} generated'**
  String generatedAt(String time);

  /// No description provided for @qrSemantics.
  ///
  /// In en, this message translates to:
  /// **'QR code containing your clinical summary'**
  String get qrSemantics;

  /// No description provided for @cameraDecodable.
  ///
  /// In en, this message translates to:
  /// **'Scan with any camera'**
  String get cameraDecodable;

  /// No description provided for @cameraDecodableBody.
  ///
  /// In en, this message translates to:
  /// **'Contains a compact data snapshot of your medicines, adherence and vitals. No network needed.'**
  String get cameraDecodableBody;

  /// No description provided for @zeroInternet.
  ///
  /// In en, this message translates to:
  /// **'Zero Internet Required'**
  String get zeroInternet;

  /// No description provided for @valid48h.
  ///
  /// In en, this message translates to:
  /// **'Valid 48 Hours'**
  String get valid48h;

  /// No description provided for @dossierHighlights.
  ///
  /// In en, this message translates to:
  /// **'Clinical Highlights'**
  String get dossierHighlights;

  /// No description provided for @last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get last30Days;

  /// No description provided for @regimenAdherence.
  ///
  /// In en, this message translates to:
  /// **'30-Day Regimen Adherence'**
  String get regimenAdherence;

  /// No description provided for @percentOnTime.
  ///
  /// In en, this message translates to:
  /// **'{percent}% On-Time'**
  String percentOnTime(String percent);

  /// No description provided for @takenShort.
  ///
  /// In en, this message translates to:
  /// **'taken'**
  String get takenShort;

  /// No description provided for @vitalsCorrelation.
  ///
  /// In en, this message translates to:
  /// **'Vitals Summary'**
  String get vitalsCorrelation;

  /// No description provided for @bpAverage.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Avg'**
  String get bpAverage;

  /// No description provided for @readingsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} readings'**
  String readingsCount(String count);

  /// No description provided for @systolicTrend.
  ///
  /// In en, this message translates to:
  /// **'Systolic trend (latest readings)'**
  String get systolicTrend;

  /// No description provided for @checksumLabel.
  ///
  /// In en, this message translates to:
  /// **'Integrity checksum: {checksum}'**
  String checksumLabel(String checksum);

  /// No description provided for @savePrintPdf.
  ///
  /// In en, this message translates to:
  /// **'Save PDF / Print Summary'**
  String get savePrintPdf;

  /// No description provided for @shareNearby.
  ///
  /// In en, this message translates to:
  /// **'Share via Bluetooth, AirDrop or WhatsApp'**
  String get shareNearby;

  /// No description provided for @privacyNotice.
  ///
  /// In en, this message translates to:
  /// **'Your health records stay on this phone. Nothing is uploaded unless you choose to share this summary.'**
  String get privacyNotice;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Remedi'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Medicine reminders that work without network, in your own language.'**
  String get welcomeBody;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @aboutYouTitle.
  ///
  /// In en, this message translates to:
  /// **'About you'**
  String get aboutYouTitle;

  /// No description provided for @aboutYouBody.
  ///
  /// In en, this message translates to:
  /// **'This stays on your phone. It helps your doctor summary and alarms speak to you by name.'**
  String get aboutYouBody;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// No description provided for @caregiverOptional.
  ///
  /// In en, this message translates to:
  /// **'Caregiver (optional)'**
  String get caregiverOptional;

  /// No description provided for @caregiverWhy.
  ///
  /// In en, this message translates to:
  /// **'If a dose is not confirmed, Remedi prompts you to send them an SMS alert. SMS works without mobile data.'**
  String get caregiverWhy;

  /// No description provided for @caregiverName.
  ///
  /// In en, this message translates to:
  /// **'Caregiver\'s name'**
  String get caregiverName;

  /// No description provided for @caregiverRelation.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get caregiverRelation;

  /// No description provided for @caregiverRelationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Son, Daughter, Nurse'**
  String get caregiverRelationHint;

  /// No description provided for @caregiverPhone.
  ///
  /// In en, this message translates to:
  /// **'Caregiver\'s phone number'**
  String get caregiverPhone;

  /// No description provided for @readyTitle.
  ///
  /// In en, this message translates to:
  /// **'Let Remedi ring for you'**
  String get readyTitle;

  /// No description provided for @readyBody.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications and alarms so reminders ring on time, even with your phone locked.'**
  String get readyBody;

  /// No description provided for @readyPoint1.
  ///
  /// In en, this message translates to:
  /// **'Loud alarms at each dose time, with snooze'**
  String get readyPoint1;

  /// No description provided for @readyPoint2.
  ///
  /// In en, this message translates to:
  /// **'Everything works 100% offline'**
  String get readyPoint2;

  /// No description provided for @readyPoint3.
  ///
  /// In en, this message translates to:
  /// **'Caregiver SMS alerts if a dose is missed'**
  String get readyPoint3;

  /// No description provided for @readyPoint4.
  ///
  /// In en, this message translates to:
  /// **'Doctor visit summary with PDF and QR code'**
  String get readyPoint4;

  /// No description provided for @enableRemindersStart.
  ///
  /// In en, this message translates to:
  /// **'Enable Reminders & Start'**
  String get enableRemindersStart;

  /// No description provided for @exploreSample.
  ///
  /// In en, this message translates to:
  /// **'Explore with sample medicines'**
  String get exploreSample;

  /// No description provided for @medicalDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Remedi helps you follow your prescription. It does not replace advice from your doctor or pharmacist.'**
  String get medicalDisclaimer;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirth;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @bloodGroup.
  ///
  /// In en, this message translates to:
  /// **'Blood group'**
  String get bloodGroup;

  /// No description provided for @genotype.
  ///
  /// In en, this message translates to:
  /// **'Genotype'**
  String get genotype;

  /// No description provided for @allergies.
  ///
  /// In en, this message translates to:
  /// **'Allergies'**
  String get allergies;

  /// No description provided for @allergiesHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Penicillin, Sulfa drugs'**
  String get allergiesHint;

  /// No description provided for @caregiverAlertsToggle.
  ///
  /// In en, this message translates to:
  /// **'Caregiver fail-safe alerts'**
  String get caregiverAlertsToggle;

  /// No description provided for @caregiverAlertsToggleHint.
  ///
  /// In en, this message translates to:
  /// **'Prompt me to text my caregiver when a dose is not confirmed'**
  String get caregiverAlertsToggleHint;

  /// No description provided for @alertAfter.
  ///
  /// In en, this message translates to:
  /// **'Alert after'**
  String get alertAfter;

  /// No description provided for @minutesShort.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String minutesShort(String minutes);

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get appSettings;

  /// No description provided for @alarmPermissions.
  ///
  /// In en, this message translates to:
  /// **'Alarm & notification permissions'**
  String get alarmPermissions;

  /// No description provided for @alarmPermissionsHint.
  ///
  /// In en, this message translates to:
  /// **'Make sure reminders can ring on time'**
  String get alarmPermissionsHint;

  /// No description provided for @alarmsArmed.
  ///
  /// In en, this message translates to:
  /// **'Alarms are armed.'**
  String get alarmsArmed;

  /// No description provided for @alarmsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Notifications are blocked. Please allow them in phone settings.'**
  String get alarmsBlocked;

  /// No description provided for @remiName.
  ///
  /// In en, this message translates to:
  /// **'Remi'**
  String get remiName;

  /// No description provided for @remiLoading.
  ///
  /// In en, this message translates to:
  /// **'Remi is getting things ready…'**
  String get remiLoading;

  /// No description provided for @offlineVault.
  ///
  /// In en, this message translates to:
  /// **'100% Offline Vault'**
  String get offlineVault;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Your caring offline health companion'**
  String get splashTagline;

  /// No description provided for @splashVault.
  ///
  /// In en, this message translates to:
  /// **'Private medicine vault'**
  String get splashVault;

  /// No description provided for @splashFormulary.
  ///
  /// In en, this message translates to:
  /// **'Local clinical formulary'**
  String get splashFormulary;

  /// No description provided for @splashScanner.
  ///
  /// In en, this message translates to:
  /// **'On-device text scanner'**
  String get splashScanner;

  /// No description provided for @splashAlarms.
  ///
  /// In en, this message translates to:
  /// **'Offline dose alarms'**
  String get splashAlarms;

  /// No description provided for @splashReady.
  ///
  /// In en, this message translates to:
  /// **'Everything is ready'**
  String get splashReady;

  /// No description provided for @splashPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing your vault…'**
  String get splashPreparing;

  /// No description provided for @statusReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get statusReady;

  /// No description provided for @statusLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get statusLoading;

  /// No description provided for @statusWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get statusWaiting;

  /// No description provided for @zeroTelemetryTitle.
  ///
  /// In en, this message translates to:
  /// **'Zero-Tracking Promise'**
  String get zeroTelemetryTitle;

  /// No description provided for @zeroTelemetryBody.
  ///
  /// In en, this message translates to:
  /// **'Your routines, prescriptions and dose logs stay on this phone. Remedi works fully without signal or Wi-Fi.'**
  String get zeroTelemetryBody;

  /// No description provided for @openDoseStation.
  ///
  /// In en, this message translates to:
  /// **'Open Daily Dose Station'**
  String get openDoseStation;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @worksOffline.
  ///
  /// In en, this message translates to:
  /// **'Works offline'**
  String get worksOffline;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @offlineActive.
  ///
  /// In en, this message translates to:
  /// **'100% Offline Active'**
  String get offlineActive;

  /// No description provided for @obStep1Label.
  ///
  /// In en, this message translates to:
  /// **'Step 1 of 3'**
  String get obStep1Label;

  /// No description provided for @obStep2Label.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 3 • Smart Intake'**
  String get obStep2Label;

  /// No description provided for @obStep3Label.
  ///
  /// In en, this message translates to:
  /// **'Step 3 of 3 • Security & Setup'**
  String get obStep3Label;

  /// No description provided for @remiIntroBefore.
  ///
  /// In en, this message translates to:
  /// **'“Hi! I’m '**
  String get remiIntroBefore;

  /// No description provided for @remiIntroAfter.
  ///
  /// In en, this message translates to:
  /// **'. I’ll make sure you never miss a dose, even when you’re completely offline!”'**
  String get remiIntroAfter;

  /// No description provided for @alwaysReady.
  ///
  /// In en, this message translates to:
  /// **'Always Ready'**
  String get alwaysReady;

  /// No description provided for @obStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Medication reminders that understand real human habits.'**
  String get obStep1Title;

  /// No description provided for @obStep1Body.
  ///
  /// In en, this message translates to:
  /// **'No rigid clinical alarm clocks. Your doses are tied to breakfast, lunch and bedtime so taking care of yourself feels effortless.'**
  String get obStep1Body;

  /// No description provided for @morningRoutine.
  ///
  /// In en, this message translates to:
  /// **'Morning Routine'**
  String get morningRoutine;

  /// No description provided for @withBreakfast.
  ///
  /// In en, this message translates to:
  /// **'With Breakfast'**
  String get withBreakfast;

  /// No description provided for @remiVerified.
  ///
  /// In en, this message translates to:
  /// **'Remi Verified'**
  String get remiVerified;

  /// No description provided for @offlineReliable.
  ///
  /// In en, this message translates to:
  /// **'100% Offline Reliable'**
  String get offlineReliable;

  /// No description provided for @flexibleTime.
  ///
  /// In en, this message translates to:
  /// **'{time} • Flexible'**
  String flexibleTime(String time);

  /// No description provided for @continueSmartIntake.
  ///
  /// In en, this message translates to:
  /// **'Continue to Smart Intake'**
  String get continueSmartIntake;

  /// No description provided for @smartScanVoice.
  ///
  /// In en, this message translates to:
  /// **'Smart Scan & Voice'**
  String get smartScanVoice;

  /// No description provided for @obStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Add medications in seconds, not minutes.'**
  String get obStep2Title;

  /// No description provided for @obStep2Body.
  ///
  /// In en, this message translates to:
  /// **'Tired of typing long medicine names? Remedi reads prescriptions and listens to your voice, privately on your phone.'**
  String get obStep2Body;

  /// No description provided for @snapScriptTitle.
  ///
  /// In en, this message translates to:
  /// **'Snap Paper Script or Pill Box'**
  String get snapScriptTitle;

  /// No description provided for @snapScriptSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Instant label recognition'**
  String get snapScriptSubtitle;

  /// No description provided for @scanDemoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'500mg Tablet • Oral'**
  String get scanDemoSubtitle;

  /// No description provided for @recognised.
  ///
  /// In en, this message translates to:
  /// **'Recognised'**
  String get recognised;

  /// No description provided for @autoFill.
  ///
  /// In en, this message translates to:
  /// **'Auto-fill'**
  String get autoFill;

  /// No description provided for @voiceDictation.
  ///
  /// In en, this message translates to:
  /// **'Voice Dictation'**
  String get voiceDictation;

  /// No description provided for @voiceDictationLangs.
  ///
  /// In en, this message translates to:
  /// **'English, Pidgin, Yorùbá, Igbo & Hausa'**
  String get voiceDictationLangs;

  /// No description provided for @voiceDemoQuote.
  ///
  /// In en, this message translates to:
  /// **'“One tablet of Lisinopril every morning after pap”'**
  String get voiceDemoQuote;

  /// No description provided for @understoodInstantly.
  ///
  /// In en, this message translates to:
  /// **'Understood instantly'**
  String get understoodInstantly;

  /// No description provided for @quickPresets.
  ///
  /// In en, this message translates to:
  /// **'One-Tap Quick Presets'**
  String get quickPresets;

  /// No description provided for @quickPresetsHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to pre-fill common regimens'**
  String get quickPresetsHint;

  /// No description provided for @remisAdvice.
  ///
  /// In en, this message translates to:
  /// **'Remi\'s advice'**
  String get remisAdvice;

  /// No description provided for @remisAdviceBody.
  ///
  /// In en, this message translates to:
  /// **'“Forget typing long drug names! Just snap a photo or speak to me.”'**
  String get remisAdviceBody;

  /// No description provided for @nextPeaceOfMind.
  ///
  /// In en, this message translates to:
  /// **'Next: Offline Peace of Mind'**
  String get nextPeaceOfMind;

  /// No description provided for @noPhotosLeave.
  ///
  /// In en, this message translates to:
  /// **'Text is read on your phone. No photos leave your device.'**
  String get noPhotosLeave;

  /// No description provided for @healthStaysHere.
  ///
  /// In en, this message translates to:
  /// **'Your health stays on this phone.'**
  String get healthStaysHere;

  /// No description provided for @zeroCloudTrackers.
  ///
  /// In en, this message translates to:
  /// **'Zero cloud trackers, ever.'**
  String get zeroCloudTrackers;

  /// No description provided for @obStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Total Privacy & Instant Doctor QR Handover'**
  String get obStep3Title;

  /// No description provided for @obStep3Body.
  ///
  /// In en, this message translates to:
  /// **'Everything stays on your device. When visiting your doctor, share an offline QR code and PDF in one tap.'**
  String get obStep3Body;

  /// No description provided for @whatShouldRemiCallYou.
  ///
  /// In en, this message translates to:
  /// **'What should Remi call you?'**
  String get whatShouldRemiCallYou;

  /// No description provided for @criticalAlarms.
  ///
  /// In en, this message translates to:
  /// **'Critical Offline Alarms'**
  String get criticalAlarms;

  /// No description provided for @essential.
  ///
  /// In en, this message translates to:
  /// **'Essential'**
  String get essential;

  /// No description provided for @criticalAlarmsBody.
  ///
  /// In en, this message translates to:
  /// **'Loud reminders that ring on time, even in airplane mode or with no network.'**
  String get criticalAlarmsBody;

  /// No description provided for @healthSyncTitle.
  ///
  /// In en, this message translates to:
  /// **'{app} Sync'**
  String healthSyncTitle(String app);

  /// No description provided for @onDevice.
  ///
  /// In en, this message translates to:
  /// **'On-device'**
  String get onDevice;

  /// No description provided for @healthSyncBody.
  ///
  /// In en, this message translates to:
  /// **'Show resting heart rate and daily steps next to your doses, processed only on this phone.'**
  String get healthSyncBody;

  /// No description provided for @caregiverSmsAlert.
  ///
  /// In en, this message translates to:
  /// **'Caregiver SMS Alert'**
  String get caregiverSmsAlert;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @caregiverSmsAlertBody.
  ///
  /// In en, this message translates to:
  /// **'If a dose is not confirmed, Remi prompts you to text your caregiver.'**
  String get caregiverSmsAlertBody;

  /// No description provided for @caregiverSmsNote.
  ///
  /// In en, this message translates to:
  /// **'The SMS is sent from your own SIM, only when you tap send.'**
  String get caregiverSmsNote;

  /// No description provided for @clinicQrMode.
  ///
  /// In en, this message translates to:
  /// **'Clinic QR Handover'**
  String get clinicQrMode;

  /// No description provided for @clinicQrModeBody.
  ///
  /// In en, this message translates to:
  /// **'Share your summary with any doctor, no pairing needed'**
  String get clinicQrModeBody;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @enterRemedi.
  ///
  /// In en, this message translates to:
  /// **'Enter Remedi & Add First Medicine'**
  String get enterRemedi;

  /// No description provided for @storedPrivately.
  ///
  /// In en, this message translates to:
  /// **'Stored privately on this phone'**
  String get storedPrivately;

  /// No description provided for @voicePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone or speech permission is off. Allow it in your phone\'s settings, or type the name instead.'**
  String get voicePermissionDenied;

  /// No description provided for @voiceNoMatch.
  ///
  /// In en, this message translates to:
  /// **'I didn\'t catch that. Tap the microphone and try again.'**
  String get voiceNoMatch;

  /// No description provided for @voiceNetwork.
  ///
  /// In en, this message translates to:
  /// **'Your phone\'s speech service needs a connection for this language. Try English, or type the name instead.'**
  String get voiceNetwork;

  /// No description provided for @voiceFailed.
  ///
  /// In en, this message translates to:
  /// **'Voice input stopped unexpectedly. Please try again.'**
  String get voiceFailed;

  /// No description provided for @voiceNotRecognised.
  ///
  /// In en, this message translates to:
  /// **'I heard you, but couldn\'t find a medicine name. Try again or type it.'**
  String get voiceNotRecognised;

  /// No description provided for @stopListening.
  ///
  /// In en, this message translates to:
  /// **'Stop listening'**
  String get stopListening;

  /// No description provided for @tapToStop.
  ///
  /// In en, this message translates to:
  /// **'Tap to stop when you\'re done'**
  String get tapToStop;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @typeInstead.
  ///
  /// In en, this message translates to:
  /// **'Type instead'**
  String get typeInstead;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ha', 'ig', 'pcm', 'yo'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ha':
      return AppLocalizationsHa();
    case 'ig':
      return AppLocalizationsIg();
    case 'pcm':
      return AppLocalizationsPcm();
    case 'yo':
      return AppLocalizationsYo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
