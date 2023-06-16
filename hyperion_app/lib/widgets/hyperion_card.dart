import 'package:flutter/material.dart';

@immutable
class CardData {
  final int index;
  final String title;

  const CardData({required this.index, required this.title});
}

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

class HyperionDraggingCard extends StatelessWidget {
  final CardData data;

  const HyperionDraggingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return HyperionCard(title: data.title);
  }
}

class HyperionDraggableCard extends StatelessWidget {
  final void Function(int index) onMove;
  final void Function(int index) onLeave;
  final CardData data;

  const HyperionDraggableCard({
    super.key,
    required this.onMove,
    required this.onLeave,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<CardData>(
      onMove: (_) => onMove(data.index),
      onLeave: (_) => onLeave(data.index),
      builder: (context, candidateData, rejectedData) => Draggable(
        data: data,
        feedback: HyperionDraggingCard(data: data),
        child: HyperionCard(title: data.title),
      ),
    );
  }
}
