import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/locales/delegates.dart';
import 'package:flutter_stuff/src/locales/locales.dart';
import 'package:flutter_stuff/src/views/pokedex/PokedexScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Flutter Stuff',
      localizationsDelegates: localizationsDelegates,
      supportedLocales: SUPPORTED_LOCALES,
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
