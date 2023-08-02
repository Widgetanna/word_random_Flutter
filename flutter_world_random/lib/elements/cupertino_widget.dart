import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerWidget extends StatefulWidget {
  const CupertinoPickerWidget({
    Key? key,
    required this.selectedPair,
    required this.onSelectedPairChanged,
    required this.pairs,
  }) : super(key: key);

  final WordPair selectedPair;
  //variable onSelectedPairChanged utilisée comme un rappel (callback),lorsque l'utilisateur sélectionne une paire dans le CupertinoPickerWidget
  final Function(WordPair selectedPair) onSelectedPairChanged;
  final List<WordPair> pairs;

  @override
  State<CupertinoPickerWidget> createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  //bool isFavorite = false;
  int selectedItem = 0;
 late WordPair selectedPair;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: CupertinoPicker.builder(
        //contrôle le niveau de zoom appliqué aux éléments affichés dans le sélecteur.
        magnification: 1.22,
        //contrôle l'espace vertical entre les éléments affichés dans le sélecteur.
        squeeze: 1.5,
        //contrôle l'affichage d'une loupe (ou loupe de mise au point) au-dessus du sélecteur.
        useMagnifier: true,
        itemExtent: 60,
        //un rappel (callback)
        onSelectedItemChanged: (int index) {
    setState(() {
      selectedItem = index;
      selectedPair = widget.pairs[index];
      widget.onSelectedPairChanged(selectedPair);
    });
  },
        //nombre total d'éléments que le sélecteur doit afficher.
        childCount: widget.pairs.length,
        itemBuilder: (BuildContext context, int index) {
          final WordPair pair = widget.pairs[index];
          final bool isFirstPair = index == 0;

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               if (!isFirstPair)
        if (index == selectedItem)
          Icon(
            Icons.favorite,
            color: Colors.red,
          )
        else
          Icon(
            Icons.favorite_border,
            color: null,
          ),
                SizedBox(width: 8),
                Text(
                  pair.asPascalCase.toLowerCase(),
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
