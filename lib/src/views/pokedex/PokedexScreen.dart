import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stuff/src/views/pokedex/Pokemon.dart';
import 'package:http/http.dart' as http;
import '../../models/PokemonsModel.dart';

const NUMBER_OF_ITEMS_TO_LOAD = 5;

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  int _index = 1;
  bool loading = false;
  List<PokemonsModel> pokemons = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchFive();

    _scrollController.addListener(_fetcherListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetcherListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
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
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: pokemons.length,
          itemBuilder: (_, index) =>
              Pokemon(pokemon: pokemons[index], loading: loading),
        ),
      ),
    );
  }
}
