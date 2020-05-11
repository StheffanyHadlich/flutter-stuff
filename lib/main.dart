import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/locales/delegates.dart';
import 'package:flutter_stuff/src/locales/locales.dart';
import 'package:flutter_stuff/src/routes/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Flutter Stuff',
      localizationsDelegates: localizationsDelegates,
      supportedLocales: SUPPORTED_LOCALES,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ));
  }
}
