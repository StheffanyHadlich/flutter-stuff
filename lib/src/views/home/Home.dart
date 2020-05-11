import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i18next/i18next.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.red[900],
        ),
      body: Center(
        child: RaisedButton(
            child: Text(I18Next.of(context).t('home:pokedex')),
            onPressed: () {
              Navigator.of(context).pushNamed('/pokedex');
            }),
      ),
    );
  }
}
