import 'package:flutter/material.dart';
import 'package:i18next/i18next.dart';
import '../../models/PokemonsModel.dart';

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
