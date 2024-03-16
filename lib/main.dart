import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/app/observes.dart';

import 'app/app.dart';
import 'gen/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        observers: [
          Observers(),
        ],
        child: const PragmaApp(),
      ),
    ),
  );
}
