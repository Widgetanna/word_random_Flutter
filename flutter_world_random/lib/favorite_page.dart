import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("Aucun favorit pour l'instant",
         style: TextStyle(fontSize: 24),),
      );
    }

    return Column(
      children: [
        Text(
          'Valeur du compteur : ${appState.favorites.length} favorits',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: appState.favorites.length,
            itemBuilder: (context, i) {
              final favorite = appState.favorites[i];

              return ListTile(
                leading: Icon(Icons.favorite),
                title: Text(
                  favorite.asString.toLowerCase(),
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.delete),
                onTap: () {
                  context.read<MyAppState>().removeFavorite(favorite);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
