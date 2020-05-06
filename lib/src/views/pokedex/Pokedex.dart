import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/views/pokedex/PokemonList.dart';
import 'package:http/http.dart' as http;
import '../../models/PokemonsModel.dart';

const NUMBER_OF_ITEMS_TO_LOAD = 5;

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  int _index = 1;
  bool loading = false;
  List<PokemonsModel> pokemons = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchFive();

    scrollController.addListener(_fetcherListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _fetcherListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchFive();
    }
  }

  void fetchFive() async {
    for (int i = _index; i < _index + NUMBER_OF_ITEMS_TO_LOAD; i++) {
      await getPokemon(i);
    }
    setState(() {
      _index = _index + NUMBER_OF_ITEMS_TO_LOAD;
    });
  }

  void toggleLoading() => setState(() {
        loading = !loading;
      });

  Future<PokemonsModel> getPokemon(int i) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/${i}';

    try {
      toggleLoading();
      final response = await http.get(url);
      final pokemon = jsonDecode(response.body);
      setState(() {
        pokemons.add(PokemonsModel.fromJson(pokemon));
      });
      toggleLoading();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: PokemonList(
          pokemons: pokemons,
          scrollController: scrollController,
          loading: loading,
        ),
      ),
    );
  }
}
