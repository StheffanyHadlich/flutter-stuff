import 'package:flutter/material.dart';
import 'package:i18next/i18next.dart';
import '../../models/PokemonsModel.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonsModel> pokemons;
  final ScrollController scrollController;
  final bool loading;

  PokemonList({this.pokemons, this.scrollController, this.loading});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: pokemons.length,
      itemBuilder: (_, index) => Pokemon(
        pokemon: pokemons[index],
        loading: loading,
      ),
    );
  }
}

class Pokemon extends StatelessWidget {
  final PokemonsModel pokemon;
  final bool loading;

  Pokemon({this.pokemon, this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightGreen),
      child: Center(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage(pokemon.photo),
                  ),
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
