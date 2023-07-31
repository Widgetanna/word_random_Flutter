import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: Color.fromARGB(255, 163, 209, 222),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          //deux mots séparés au lieu d'un composé
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
        //pair.first,
        //style: TextStyle(color: Color.fromARGB(255, 34, 1, 1)),
      ),
    );
  }
}
