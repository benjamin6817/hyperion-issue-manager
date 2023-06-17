import 'package:flutter/material.dart';

const _cardWidth = 256.0;

@immutable
class IssueData {
  final int index;
  final String title;

  const IssueData({required this.index, required this.title});
}

class IssueListBaseItem extends StatelessWidget {
  final String title;

  const IssueListBaseItem({super.key, required this.title});

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

class IssueListPlaceholder extends StatelessWidget {
  const IssueListPlaceholder({super.key});

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

class IssueListDraggingItem extends StatelessWidget {
  final IssueData data;

  const IssueListDraggingItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IssueListBaseItem(title: data.title);
  }
}

class IssueListItem extends StatelessWidget {
  final void Function(int index) onMove;
  final void Function(int index) onLeave;
  final IssueData data;

  const IssueListItem({
    super.key,
    required this.onMove,
    required this.onLeave,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<IssueData>(
      onMove: (_) => onMove(data.index),
      onLeave: (_) => onLeave(data.index),
      onAccept: (_) => onLeave(data.index),
      builder: (context, candidateData, rejectedData) => Draggable(
        data: data,
        feedback: IssueListDraggingItem(data: data),
        child: IssueListBaseItem(title: data.title),
      ),
    );
  }
}
