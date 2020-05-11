import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/models/PokemonsModel.dart';
import 'package:i18next/i18next.dart';

class PokemonProfile extends StatelessWidget {
  final PokemonsModel pokemon;

  PokemonProfile({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.lightGreen),
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(pokemon.photo),
              ),
              Text(I18Next.of(context).t('pokedex:name')),
              Text(pokemon.name),
              Text(I18Next.of(context).t('pokedex:weight')),
              Text(pokemon.weight.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
