import 'package:flutter/material.dart';
import 'package:namer_app/elements/big_card.dart';
import 'package:namer_app/service/my_app.dart';
import 'package:namer_app/service/scroll.dart';
import 'package:provider/provider.dart';
import '../elements/cupertino_widget.dart';


class GeneratorPage extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    var currentPair = appState.current;
    //var favorites = appState.favorites;
    var nextIndex = appState.nextIndex;
    // afficher dans cupertino 1er index par defaut 
    if (!nextIndex.contains(currentPair)) {
    //ajouter une pair de mot 
      nextIndex.add(currentPair);
    }
   
    //pour cupertino: ajouter a la 1ere position (renverser l'ordre de la liste) 
    nextIndex = nextIndex.reversed.toList();
    
   
   
   print('next index GeneratorPage: $nextIndex');
   // la paire de mot affiché dans la zone 
   print('currentPair GeneratorPage: $currentPair');
    
   
   
   //gestion icone dans le boutton "Like
   IconData icon = Icons.favorite_border;
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
          selectedPair:  nextIndex[0], 
           //pour que BigCard et cupertino soient coordonées 
            onSelectedPairChanged: (selectedPair) {
           appState.updateCurrent(selectedPair);
           nextIndex[0];
            },
            
            pairs: nextIndex , 
           
          ),
           SizedBox(height: 20), 
          Text(
            'Lets go!!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 64, 29, 239),
            ),
          ),
        BigCard(
  pair: currentPair 
 
),

          SizedBox(height: 70),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                appState.toggleFavorite(context);
                },
                icon: Icon(
                  icon,
                  color: appState.favorites.contains(currentPair)
                      ? Colors.red
                      : null,
                ),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
             ElevatedButton(
  onPressed: () {
    ScrollManager.resetScroll();
    appState.getNext(context);
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
