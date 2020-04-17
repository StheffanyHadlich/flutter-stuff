import 'package:flutter/material.dart';
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
              image: NetworkImage(
                  'https://www.comoaprenderdesenhar.com.br/wp-content/uploads/2015/09/Como-Desenhar-o-Pikachu-de-Pok%C3%A9mon-1.jpg'),
            ),
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
