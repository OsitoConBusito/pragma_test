import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../gen/strings.g.dart';

class PragmaApp extends StatelessWidget {
  const PragmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: 'Pragma Test',
      routerConfig: appRoutes.router,
    );
  }
}
