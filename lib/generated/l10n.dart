// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Intelligent Security Systems`
  String get appTitle {
    return Intl.message(
      'Intelligent Security Systems',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Choose Mode`
  String get chooseMode {
    return Intl.message(
      'Choose Mode',
      name: 'chooseMode',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cont {
    return Intl.message(
      'Continue',
      name: 'cont',
      desc: '',
      args: [],
    );
  }

  /// `Password strenght:`
  String get passwordStrenght {
    return Intl.message(
      'Password strenght:',
      name: 'passwordStrenght',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign up and easily access all the essential controls and features.`
  String get signupDescription {
    return Intl.message(
      'Sign up and easily access all the essential controls and features.',
      name: 'signupDescription',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Do you have account?`
  String get doYouHaveAccount {
    return Intl.message(
      'Do you have account?',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Strong`
  String get strong {
    return Intl.message(
      'Strong',
      name: 'strong',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `The email is incorrect`
  String get emailIncorrect {
    return Intl.message(
      'The email is incorrect',
      name: 'emailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number.`
  String get pleaseEnterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number.',
      name: 'pleaseEnterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Very Weak`
  String get veryWeak {
    return Intl.message(
      'Very Weak',
      name: 'veryWeak',
      desc: '',
      args: [],
    );
  }

  /// `Weak`
  String get weak {
    return Intl.message(
      'Weak',
      name: 'weak',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you automatically agree to our`
  String get bySigningUpYouAutomaticallyAgreeToOur {
    return Intl.message(
      'By signing up, you automatically agree to our',
      name: 'bySigningUpYouAutomaticallyAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions.`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions.',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to enjoy effortless control of your smart living environment.`
  String get signinDescription {
    return Intl.message(
      'Sign in to enjoy effortless control of your smart living environment.',
      name: 'signinDescription',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `We sent a 6-digit code to your phone number ending in`
  String get SentDigitCode {
    return Intl.message(
      'We sent a 6-digit code to your phone number ending in',
      name: 'SentDigitCode',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Smart Intercom`
  String get smartIntercom {
    return Intl.message(
      'Smart Intercom',
      name: 'smartIntercom',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Surveillance Cameras`
  String get surveillanceCameras {
    return Intl.message(
      'Surveillance Cameras',
      name: 'surveillanceCameras',
      desc: '',
      args: [],
    );
  }

  /// `Barrier`
  String get barrier {
    return Intl.message(
      'Barrier',
      name: 'barrier',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Pay Debt`
  String get payDebt {
    return Intl.message(
      'Pay Debt',
      name: 'payDebt',
      desc: '',
      args: [],
    );
  }

  /// `Tools`
  String get tools {
    return Intl.message(
      'Tools',
      name: 'tools',
      desc: '',
      args: [],
    );
  }

  /// `Access by QR Code`
  String get accessByQrCode {
    return Intl.message(
      'Access by QR Code',
      name: 'accessByQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Face Management`
  String get faceManagement {
    return Intl.message(
      'Face Management',
      name: 'faceManagement',
      desc: '',
      args: [],
    );
  }

  /// `Debt: {deb} AMD`
  String debtDebAmd(Object deb) {
    return Intl.message(
      'Debt: $deb AMD',
      name: 'debtDebAmd',
      desc: '',
      args: [deb],
    );
  }

  /// `Elevator`
  String get elevator {
    return Intl.message(
      'Elevator',
      name: 'elevator',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Active Service`
  String get activeService {
    return Intl.message(
      'Active Service',
      name: 'activeService',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get mute {
    return Intl.message(
      'Mute',
      name: 'mute',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code`
  String get invalidVerificationCode {
    return Intl.message(
      'Invalid verification code',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Exception`
  String get unknownException {
    return Intl.message(
      'Unknown Exception',
      name: 'unknownException',
      desc: '',
      args: [],
    );
  }

  /// `Generate your one time QR code`
  String get generateYourOneTimeQrCode {
    return Intl.message(
      'Generate your one time QR code',
      name: 'generateYourOneTimeQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Generate QR Code`
  String get generateQrCode {
    return Intl.message(
      'Generate QR Code',
      name: 'generateQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Choose Address`
  String get chooseAddress {
    return Intl.message(
      'Choose Address',
      name: 'chooseAddress',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get device {
    return Intl.message(
      'Device',
      name: 'device',
      desc: '',
      args: [],
    );
  }

  /// `Visitor Identity`
  String get visitorIdentity {
    return Intl.message(
      'Visitor Identity',
      name: 'visitorIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Friends & Family`
  String get friendsFamily {
    return Intl.message(
      'Friends & Family',
      name: 'friendsFamily',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Time period`
  String get timePeriod {
    return Intl.message(
      'Time period',
      name: 'timePeriod',
      desc: '',
      args: [],
    );
  }

  /// `{time} hours`
  String timeHours(Object time) {
    return Intl.message(
      '$time hours',
      name: 'timeHours',
      desc: '',
      args: [time],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Service will resume after payment is received.`
  String get serviceWillResumeAfterPaymentIsReceived {
    return Intl.message(
      'Service will resume after payment is received.',
      name: 'serviceWillResumeAfterPaymentIsReceived',
      desc: '',
      args: [],
    );
  }

  /// `Locked`
  String get locked {
    return Intl.message(
      'Locked',
      name: 'locked',
      desc: '',
      args: [],
    );
  }

  /// `Opened`
  String get opened {
    return Intl.message(
      'Opened',
      name: 'opened',
      desc: '',
      args: [],
    );
  }

  /// `to lock`
  String get toLock {
    return Intl.message(
      'To lock',
      name: 'toLock',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hy'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
