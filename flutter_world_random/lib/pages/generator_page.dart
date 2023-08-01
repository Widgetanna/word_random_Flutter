import 'package:flutter/material.dart';
import 'package:namer_app/elements/big_card.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import '../elements/cupertino_widget.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

     return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoPickerWidget(
            selectedPair: pair,
            onSelectedPairChanged: (selectedPair) {
              appState.updateCurrent(selectedPair);
            },
            pairs: appState.favorites,
          ),
           
         
          Text(
            'Lets go!!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 12, 84, 185),
            ),
          ),
          BigCard(pair: pair),
          SizedBox(height: 70),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
