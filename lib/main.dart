import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/views/pokedex/PokedexScreen.dart';


void main() {
  runApp(MaterialApp(
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
