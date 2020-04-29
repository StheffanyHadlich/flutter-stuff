
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stuff/src/locales/locales.dart';
import 'package:i18next/i18next.dart';


final List<LocalizationsDelegate> localizationsDelegates = [
  I18NextLocalizationDelegate(
    locales: SUPPORTED_LOCALES,
    dataSource: AssetBundleLocalizationDataSource(
      bundlePath: 'localizations'
    )
  ),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];