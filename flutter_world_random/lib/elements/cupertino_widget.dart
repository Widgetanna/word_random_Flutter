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
          final WordPair pair = widget.pairs[index];
          final bool isFirstPair = index == 0;
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isFirstPair)
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
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
