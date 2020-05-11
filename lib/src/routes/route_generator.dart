import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/models/PokemonsModel.dart';
import 'package:flutter_stuff/src/views/home/Home.dart';
import 'package:flutter_stuff/src/views/pokedex/Pokedex.dart';
import 'package:flutter_stuff/src/views/pokemon/PokemonProfile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/pokedex':
        return MaterialPageRoute(builder: (_) => Pokedex());
      case '/pokemon':
        return args is PokemonsModel
            ? MaterialPageRoute(
                builder: (_) => PokemonProfile(
                      pokemon: args,
                    ))
            : _errorRoute();
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
