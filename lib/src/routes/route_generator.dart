import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/views/home/Home.dart';
import 'package:flutter_stuff/src/views/pokedex/PokedexScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/pokedex':
        return MaterialPageRoute(builder: (_) => PokedexScreen());
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
