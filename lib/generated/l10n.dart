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

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?     `
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account?     ',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?      `
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?      ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_your_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_your_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone`
  String get please_enter_your_phone {
    return Intl.message(
      'Please enter your phone',
      name: 'please_enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email or password incorrect`
  String get email_or_password_incorrect {
    return Intl.message(
      'Email or password incorrect',
      name: 'email_or_password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Your account is not active. Please contact the admin`
  String get your_account_is_not_active {
    return Intl.message(
      'Your account is not active. Please contact the admin',
      name: 'your_account_is_not_active',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get weak_password {
    return Intl.message(
      'Password is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you entered the correct email`
  String get make_sure_you_entered_the_correct_email {
    return Intl.message(
      'Make sure you entered the correct email',
      name: 'make_sure_you_entered_the_correct_email',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, Please try again`
  String get something_went_wrong_please_try_again {
    return Intl.message(
      'Something went wrong, Please try again',
      name: 'something_went_wrong_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Sorry no courses available for now in this field !`
  String get no_courses_available {
    return Intl.message(
      'Sorry no courses available for now in this field !',
      name: 'no_courses_available',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Curricula`
  String get curricula {
    return Intl.message(
      'Curricula',
      name: 'curricula',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Initiatives`
  String get initiatives {
    return Intl.message(
      'Initiatives',
      name: 'initiatives',
      desc: '',
      args: [],
    );
  }

  /// `Colleges`
  String get colleges {
    return Intl.message(
      'Colleges',
      name: 'colleges',
      desc: '',
      args: [],
    );
  }

  /// `My Points`
  String get my_points {
    return Intl.message(
      'My Points',
      name: 'my_points',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get home_screen {
    return Intl.message(
      'Home Screen',
      name: 'home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Programming`
  String get programming {
    return Intl.message(
      'Programming',
      name: 'programming',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get technology {
    return Intl.message(
      'Technology',
      name: 'technology',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get design {
    return Intl.message(
      'Design',
      name: 'design',
      desc: '',
      args: [],
    );
  }

  /// `Accounting`
  String get accounting {
    return Intl.message(
      'Accounting',
      name: 'accounting',
      desc: '',
      args: [],
    );
  }

  /// `Marketing`
  String get marketing {
    return Intl.message(
      'Marketing',
      name: 'marketing',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get management {
    return Intl.message(
      'Management',
      name: 'management',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get medicine {
    return Intl.message(
      'Medicine',
      name: 'medicine',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get engineering {
    return Intl.message(
      'Engineering',
      name: 'engineering',
      desc: '',
      args: [],
    );
  }

  /// `Agriculture`
  String get agriculture {
    return Intl.message(
      'Agriculture',
      name: 'agriculture',
      desc: '',
      args: [],
    );
  }

  /// `Archaeology`
  String get archaeology {
    return Intl.message(
      'Archaeology',
      name: 'archaeology',
      desc: '',
      args: [],
    );
  }

  /// `Tourism and Hotels`
  String get tourism_and_hotels {
    return Intl.message(
      'Tourism and Hotels',
      name: 'tourism_and_hotels',
      desc: '',
      args: [],
    );
  }

  /// `Nursing`
  String get nursing {
    return Intl.message(
      'Nursing',
      name: 'nursing',
      desc: '',
      args: [],
    );
  }

  /// `Dentistry`
  String get dentistry {
    return Intl.message(
      'Dentistry',
      name: 'dentistry',
      desc: '',
      args: [],
    );
  }

  /// `Veterinary Medicine`
  String get veterinary_medicine {
    return Intl.message(
      'Veterinary Medicine',
      name: 'veterinary_medicine',
      desc: '',
      args: [],
    );
  }

  /// `Commerce`
  String get commerce {
    return Intl.message(
      'Commerce',
      name: 'commerce',
      desc: '',
      args: [],
    );
  }

  /// `Literature`
  String get literature {
    return Intl.message(
      'Literature',
      name: 'literature',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `Law`
  String get law {
    return Intl.message(
      'Law',
      name: 'law',
      desc: '',
      args: [],
    );
  }

  /// `Specific Education`
  String get specific_education {
    return Intl.message(
      'Specific Education',
      name: 'specific_education',
      desc: '',
      args: [],
    );
  }

  /// `Dar Al Uloom`
  String get dar_al_uloom {
    return Intl.message(
      'Dar Al Uloom',
      name: 'dar_al_uloom',
      desc: '',
      args: [],
    );
  }

  /// `Kindergarten`
  String get kindergarten {
    return Intl.message(
      'Kindergarten',
      name: 'kindergarten',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Ethical Hacking`
  String get ethical_hacking {
    return Intl.message(
      'Ethical Hacking',
      name: 'ethical_hacking',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get flutter {
    return Intl.message(
      'Flutter',
      name: 'flutter',
      desc: '',
      args: [],
    );
  }

  /// `Wordpress`
  String get wordpress {
    return Intl.message(
      'Wordpress',
      name: 'wordpress',
      desc: '',
      args: [],
    );
  }

  /// `Business Administration`
  String get business_administration {
    return Intl.message(
      'Business Administration',
      name: 'business_administration',
      desc: '',
      args: [],
    );
  }

  /// `HR`
  String get hr {
    return Intl.message(
      'HR',
      name: 'hr',
      desc: '',
      args: [],
    );
  }

  /// `Leadership`
  String get leadership {
    return Intl.message(
      'Leadership',
      name: 'leadership',
      desc: '',
      args: [],
    );
  }

  /// `ICDL`
  String get icdl {
    return Intl.message(
      'ICDL',
      name: 'icdl',
      desc: '',
      args: [],
    );
  }

  /// `IT`
  String get it {
    return Intl.message(
      'IT',
      name: 'it',
      desc: '',
      args: [],
    );
  }

  /// `TOT`
  String get tot {
    return Intl.message(
      'TOT',
      name: 'tot',
      desc: '',
      args: [],
    );
  }

  /// `Accounting Administration`
  String get accounting_administration {
    return Intl.message(
      'Accounting Administration',
      name: 'accounting_administration',
      desc: '',
      args: [],
    );
  }

  /// `Cost accounting`
  String get cost_accounting {
    return Intl.message(
      'Cost accounting',
      name: 'cost_accounting',
      desc: '',
      args: [],
    );
  }

  /// `Financial accounting`
  String get financial_accounting {
    return Intl.message(
      'Financial accounting',
      name: 'financial_accounting',
      desc: '',
      args: [],
    );
  }

  /// `Tax accounting`
  String get tax_accounting {
    return Intl.message(
      'Tax accounting',
      name: 'tax_accounting',
      desc: '',
      args: [],
    );
  }

  /// `Content Writing`
  String get content_writing {
    return Intl.message(
      'Content Writing',
      name: 'content_writing',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service`
  String get customer_service {
    return Intl.message(
      'Customer Service',
      name: 'customer_service',
      desc: '',
      args: [],
    );
  }

  /// `E-Marketing`
  String get e_marketing {
    return Intl.message(
      'E-Marketing',
      name: 'e_marketing',
      desc: '',
      args: [],
    );
  }

  /// `SEO`
  String get seo {
    return Intl.message(
      'SEO',
      name: 'seo',
      desc: '',
      args: [],
    );
  }

  /// `Canva`
  String get canva {
    return Intl.message(
      'Canva',
      name: 'canva',
      desc: '',
      args: [],
    );
  }

  /// `UX/UI`
  String get ux_ui {
    return Intl.message(
      'UX/UI',
      name: 'ux_ui',
      desc: '',
      args: [],
    );
  }

  /// `Photo Shop`
  String get photo_shop {
    return Intl.message(
      'Photo Shop',
      name: 'photo_shop',
      desc: '',
      args: [],
    );
  }

  /// `Remaining time`
  String get remaining_time {
    return Intl.message(
      'Remaining time',
      name: 'remaining_time',
      desc: '',
      args: [],
    );
  }

  /// `seconds`
  String get seconds {
    return Intl.message(
      'seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
