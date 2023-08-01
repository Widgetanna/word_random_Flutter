import 'package:flutter/material.dart';
import 'package:namer_app/elements/big_card.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import '../elements/cupertino_widget.dart';
import 'package:english_words/english_words.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentPair = appState.current;
    var favorites = appState.favorites;
    /* spread operator
   pour "propager" les éléments d'un itérable (comme une liste ou un ensemble) dans un autre itérable
   créant ainsi une nouvelle liste avec les éléments des deux itérables. 
   */
    List<WordPair> allPairs = [currentPair, ...favorites];

    IconData icon;
    if (appState.favorites.contains(currentPair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoPickerWidget(
            selectedPair: currentPair,
            onSelectedPairChanged: (selectedPair) {
              appState.updateCurrent(selectedPair);
            },
            pairs: allPairs,
          ),
          Text(
            'Lets go!!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 64, 29, 239),
            ),
          ),
          BigCard(pair: currentPair),
          SizedBox(height: 70),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(context);
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
