import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/resources/colors.dart';
import '../constants/resources/durations.dart';
import '../constants/resources/styles.dart';
import '../constants/secure/keys.dart';
import '../constants/secure/stores.dart';
import '../env/dev/dev.env.dart';
import '../env/prod/prod.env.dart';
import '../styles/app_theme.dart';

/// Configuration
@immutable
class AppConfig {
  //* Language
  static const defaultLanguageCode = 'vi';
  static const defaultIsoCountryCode = 'VN';
  static const alternativeLanguageCode = 'en';
  static const alternativeIsoCountryCode = 'EN';

  final defaultLocale = const Locale(
    defaultLanguageCode,
    defaultIsoCountryCode,
  );
  final alternativeLocale = const Locale(
    alternativeLanguageCode,
    alternativeIsoCountryCode,
  );

  //* Immutable
  late final box = AppStoreKeys();
  late final keys = AppFormKeys();
  late final styles = AppTextStyles();
  late final color = AppColorStyles();
  late final times = AppTimes();
  late final theme = AppTheme.mainTheme();
  late final env = kDebugMode ? DevEnv() : ProdEnv();
}
