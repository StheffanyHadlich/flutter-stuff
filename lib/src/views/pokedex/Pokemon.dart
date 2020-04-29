import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i18next/i18next.dart';
import '../../models/PokemonsModel.dart';
import 'package:http/http.dart' as http;


class Pokemon extends StatelessWidget {
  final PokemonsModel pokemon;

  Pokemon({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightGreen),
      child: Center(
        child: Column(
          children: <Widget>[
            PokemonPhoto(pokemon.url),
            Text(I18Next.of(context).t('pokedex:name')),
            Text(
              pokemon.name,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonPhoto extends StatelessWidget {
  final String url;

  PokemonPhoto(this.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPokemonPhoto(url),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final photo = snapshot.data;
          print(photo);
          return Image(
            image: NetworkImage(photo),
          );
        }

        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return CircularProgressIndicator();
      },
    );
  }
}

Future<String> getPokemonPhoto(url) async {

  try {
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final pokemons = data['sprites'];
    return pokemons['front_default'];
    
  } catch (e) {
    throw Exception(e);
  }
}
