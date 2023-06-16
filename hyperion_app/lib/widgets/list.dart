import 'package:flutter/material.dart';
import 'hyperion_card.dart';

class HyperionList extends StatelessWidget {
  final List<String> cardTitles;

  const HyperionList({super.key, required this.cardTitles});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 272,
        child: ListView(
          children: cardTitles
              .map(
                (title) => HyperionCard(title: title),
              )
              .toList(),
        ),
      ),
    );
  }
}
