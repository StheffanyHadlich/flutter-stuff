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
      itemBuilder: (_, index) => _PokemonItem(
        pokemon: pokemons[index],
        loading: loading,
      ),
    );
  }
}

class _PokemonItem extends StatelessWidget {
  final PokemonsModel pokemon;
  final bool loading;

  _PokemonItem({this.pokemon, this.loading});

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
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  RaisedButton(
                      child: Text(I18Next.of(context).t('pokedex:learn')),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/pokemon', arguments: pokemon);
                      }),
                ],
              ),
      ),
    );
  }
}
