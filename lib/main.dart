import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/PokemonsModel.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Colors.red[900],
      ),
      body: Pokedex(),
    ),
  ));
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getPokemon(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final pokemons = snapshot.data;
              return ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (_, index) => Text(pokemons[index].name));
            }

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<PokemonsModel>> getPokemon() async {
  final url = 'https://pokeapi.co/api/v2/pokemon';

  try {
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final pokemons = data['results'] as List;
    return pokemons.map((pokemon) => PokemonsModel.fromJson(pokemon)).toList();
    
  } catch (e) {
    throw Exception(e);
  }
}
