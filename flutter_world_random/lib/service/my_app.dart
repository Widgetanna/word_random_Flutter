import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';



class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  List<WordPair> nextIndex = [];
  
  
  void getNext(BuildContext context) {
    current = WordPair.random();
    nextIndex .add(current);
   notifyListeners();
    print('afficher getNext: $nextIndex');
    print('afficher getNext: ${nextIndex[0]}');
  }

  //pour icone like initialise avec une liste vide
 List<WordPair> favorites = [];
   

  void toggleFavorite(BuildContext context) {
    if (favorites.contains(current)) {
      // Si la paire est déjà dans la liste des favoris, la supprimer
      favorites.remove(current);
    } else {
      // Sinon, l'ajouter aux favoris
      favorites.add(current);
     }
     favorites = favorites.reversed.toList();
      print('favorites List $favorites');
      notifyListeners();
  }
  
  void removeFavorite(WordPair favorite) {
    favorites.remove(favorite);
    notifyListeners();
  }
  void updateCurrent(WordPair newPair) {
    current = newPair;
    notifyListeners();
  }
  
}
