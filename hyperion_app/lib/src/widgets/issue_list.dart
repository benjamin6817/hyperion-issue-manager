import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'issue_list_item.dart';

class IssueList extends StatefulWidget {
  const IssueList({
    super.key,
    required this.title,
    required this.cardTitles,
  });

  final String title;
  final List<String> cardTitles;

  @override
  State<IssueList> createState() => _IssueListState();
}

class _IssueListState extends State<IssueList> {
  bool _insideList = false;
  int _cardIndex = -1;

  void _onCardHover(int index) {
    setState(() {
      _insideList = true;
      _cardIndex = index;
    });
  }

  void _onCardLeave(int index) {
    setState(() {
      _insideList = false;
      _cardIndex = -1;
    });
  }

  List<Widget> _createChildren() {
    List<Widget> children = [];
    widget.cardTitles.forEachIndexed((index, title) {
      children.add(
        IssueListItem(
          onMove: _onCardHover,
          onLeave: _onCardLeave,
          data: IssueData(
            index: index,
            title: title,
          ),
        ),
      );
    });

    if (!_insideList) return children;

    const placeholder = IssueListPlaceholder();
    if (_cardIndex != -1) {
      children.insert(
        _cardIndex,
        placeholder,
      );
    } else {
      children.add(placeholder);
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<IssueData>(
      onMove: (details) => setState(() {
        _insideList = true;
      }),
      onLeave: (details) => setState(() {
        _insideList = false;
      }),
      onAccept: (details) => _onCardLeave(-1),
      builder: (context, candidateData, rejectedData) => Card(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title),
              ..._createChildren(),
            ],
          ),
        ),
      ),
    );
  }
}
