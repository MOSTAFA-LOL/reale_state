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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `search`
  String get search {
    return Intl.message('search', name: 'search', desc: '', args: []);
  }

  /// `For RealEstate`
  String get title_name {
    return Intl.message(
      'For RealEstate',
      name: 'title_name',
      desc: '',
      args: [],
    );
  }

  /// `CONNECTING YOU TO YOUR IDEA HOME`
  String get title_desc {
    return Intl.message(
      'CONNECTING YOU TO YOUR IDEA HOME',
      name: 'title_desc',
      desc: '',
      args: [],
    );
  }

  /// `welcome`
  String get title_in {
    return Intl.message('welcome', name: 'title_in', desc: '', args: []);
  }

  /// `welcome TO RealEstate`
  String get welcome {
    return Intl.message(
      'welcome TO RealEstate',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `lets Get You Closer `
  String get welcome_t0 {
    return Intl.message(
      'lets Get You Closer ',
      name: 'welcome_t0',
      desc: '',
      args: [],
    );
  }

  /// `TO`
  String get tO {
    return Intl.message('TO', name: 'tO', desc: '', args: []);
  }

  /// `Your Ideal Home`
  String get welcome_for {
    return Intl.message(
      'Your Ideal Home',
      name: 'welcome_for',
      desc: '',
      args: [],
    );
  }

  /// `login to RealEstate with gmail`
  String get login_title {
    return Intl.message(
      'login to RealEstate with gmail',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Alrealy have an account?`
  String get make_sure {
    return Intl.message(
      'Alrealy have an account?',
      name: 'make_sure',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get ontap {
    return Intl.message('Log in', name: 'ontap', desc: '', args: []);
  }

  /// `Please Enter YOUR Email`
  String get login_title2 {
    return Intl.message(
      'Please Enter YOUR Email',
      name: 'login_title2',
      desc: '',
      args: [],
    );
  }

  /// `YOUR Email`
  String get text_field {
    return Intl.message('YOUR Email', name: 'text_field', desc: '', args: []);
  }

  /// `password`
  String get text_field1 {
    return Intl.message('password', name: 'text_field1', desc: '', args: []);
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
