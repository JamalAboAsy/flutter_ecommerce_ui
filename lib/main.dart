import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_page.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );
  runApp(LocalizedApp(
      child: MyApp(),
  ),
   );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: MyHomePage(),
      // localizationsDelegates: translator.delegates, // Android + iOS Delegates
      // locale: translator.locale, // Active locale
      // supportedLocales: translator.locals(), // Locals list
    );
  }
}
