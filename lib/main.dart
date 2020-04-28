import 'package:flutter/material.dart';
import 'package:flutter_stuff/app_localization.dart';
import 'package:flutter_stuff/src/views/pokedex/PokedexScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Flutter Stuff',
      supportedLocales: [Locale('pt', 'BR'), Locale('en', 'US')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        print("hahahahaha");
        supportedLocales.forEach((item) {
          if (locale == item) {
            print(locale);
            print(item);
            return item;
          }
        });
 
      },
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Pokedex'),
          backgroundColor: Colors.red[900],
        ),
        body: PokedexScreen(),
      ),
    ));
  }
}
