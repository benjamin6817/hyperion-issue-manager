import 'package:flutter/material.dart';

class HyperionCard extends StatelessWidget {
  final String title;

  const HyperionCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      child: Card(
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}

class HyperionDraggableCard extends StatelessWidget {
  final String title;

  const HyperionDraggableCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: HyperionCard(title: title),
      child: HyperionCard(
        title: title,
      ),
    );
  }
}
