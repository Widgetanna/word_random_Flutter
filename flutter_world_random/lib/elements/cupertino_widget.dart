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
  final Function(WordPair selectedPair) onSelectedPairChanged;
  final List<WordPair> pairs;


  @override
  State<CupertinoPickerWidget> createState() => _CupertinoPickerWidgetState();
}

 class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
 //late pour initialiser la liste plus tard
 late List<bool> favoriteStates;
 
  @override
  void initState() {
    super.initState();
   favoriteStates = List.generate(widget.pairs.length, (index) => false);
  }
  @override
  void didUpdateWidget(CupertinoPickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
   
    if (widget.pairs.length != favoriteStates.length) {
      setState(() {
        favoriteStates = List.generate(widget.pairs.length, (index) => false);
      });
    }
  }
  @override
Widget build(BuildContext context) {
 
  return SizedBox(
    height: 240,
    child: CupertinoPicker.builder(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 60,
      onSelectedItemChanged: (int selectedItem) {
        widget.onSelectedPairChanged(widget.pairs[selectedItem]);
      },
      childCount: widget.pairs.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Icon(
                favoriteStates[index]
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red, 
              ),
              SizedBox(width: 8), 
              Text(
                widget.pairs[index].asPascalCase,
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

