import 'package:flutter/material.dart';
import 'package:namer_app/pages/home_page.dart';
import 'package:english_words/english_words.dart';

import 'package:provider/provider.dart';

/*le package "provider" est utilisé pour gérer 
les états et partager les données entre différents widgets.
(faciliter la gestion des états, de rendre ces états accessibles) 
Provider est une bibliothèque de gestion d'état qui facilite la communication 
entre les widgets et leurs descendants.
Le rôle de "provider" :
1.ChangeNotifierProvider : Il s'agit d'un widget spécial fourni par la bibliothèque "provider" 
qui permet de créer et d'exposer un objet "MyAppState" aux descendants du widget où il est placé. 
L'objet "MyAppState" est une classe qui étend "ChangeNotifier". Cela signifie que tout changement dans l'état de cet objet 
déclenchera automatiquement la mise à jour des widgets qui écoutent les modifications de cet état.

2. la propriété "create" pour créer une instance de la classe "MyAppState". 
Cela garantit que la même instance de "MyAppState" est partagée entre tous les widgets descendants 
qui ont besoin d'accéder à cet état.
3. les widgets descendants peuvent y accéder en utilisant la classe "Provider.of<MyAppState>(context)". 
Cela permet aux widgets d'observer les changements d'état et de se reconstruire automatiquement lorsque l'état change, 
grâce à l'utilisation de la méthode notifyListeners()
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    //gestion des états et le partage des données 
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 163, 225, 234)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  
  List<WordPair> generatedPairs = [];
  
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  //pour icone like initialise avec une liste vide
  //var favorites = <WordPair>[];
   List<WordPair> favorites = [];

  void toggleFavorite(BuildContext context) {
    if (favorites.contains(current)) {
      // Show an alert if the word is already favorited
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Déjà sélectionné'),
          content: Text('Ce mot est déjà dans les favoris.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      favorites.add(current);
    }
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




