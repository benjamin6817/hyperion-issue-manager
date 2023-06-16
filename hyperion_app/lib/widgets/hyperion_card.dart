import 'package:flutter/material.dart';

const _cardWidth = 256.0;

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
      width: _cardWidth,
      child: Card(
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: _cardWidth,
        child: Card(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: const ListTile(
            title: Text('Placeholder'),
          ),
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
