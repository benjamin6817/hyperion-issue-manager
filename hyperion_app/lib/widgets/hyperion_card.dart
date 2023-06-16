import 'package:flutter/material.dart';

class HyperionDraggingCard extends StatelessWidget {
  final String title;

  const HyperionDraggingCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text(title)));
  }
}

class HyperionCard extends StatelessWidget {
  final String title;

  const HyperionCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
        child: Card(child: ListTile(title: Text(title))), feedback: feedback);
  }
}
