import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:namer_app/service/my_app.dart';
import 'package:namer_app/service/scroll.dart';
import 'package:provider/provider.dart';
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
  int selectedItem = 0;
 
  
  late WordPair selectedPair;
  //vérification de la valeur $selectedPair
  @override
  void initState() {
    super.initState();
    selectedPair = widget.selectedPair;
    print('selectedPair in cupertino: $selectedPair');
   }
   
   IconData? _getFavoriteIcon(int index) {
  final myAppState = Provider.of<MyAppState>(context, listen: false);
  final isFavorite = myAppState.favorites.contains(widget.pairs[index]);
  
  if (isFavorite && index == selectedItem) {
    return Icons.favorite;
  } else if (isFavorite) {
    return Icons.favorite_border;
  } else {
    return null;
  }
}

@override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 240,
      child: CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.5,
        useMagnifier: true,
        itemExtent: 60,
        scrollController: ScrollManager.scroll,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedItem = index;
            widget.onSelectedPairChanged(widget.pairs[index]);
          });
        },
        children: [
          for (int index = 0; index < widget.pairs.length; index++)
            Center(
               child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getFavoriteIcon(index),
            color: Colors.red, 
          ),
          SizedBox(width: 8.0), 
          Text(
            widget.pairs[index].asPascalCase.toLowerCase(),
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ],
      ),
    ),
            
        ],
      ),
    );
  }
}
