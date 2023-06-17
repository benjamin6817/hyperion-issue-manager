import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'issue_list.dart';
import 'page_wrapper.dart';

class IssueBoard extends StatefulWidget {
  const IssueBoard({super.key, required this.title});

  final String title;

  @override
  State<IssueBoard> createState() => _IssueBoardState();
}

class _IssueBoardState extends State<IssueBoard> {
  List<String> cardListTitles = ['To-Do', 'In Progress', 'Done'];
  List<List<String>> cardLists = [
    ['Card 1', 'Card 2', 'Card 3'],
    ['Card 4', 'Card 5', 'Card 6'],
    ['Card 7', 'Card 8', 'Card 9']
  ];

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: widget.title,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cardLists
            .mapIndexed(
              (index, cards) => IssueList(
                title: cardListTitles[index],
                cardTitles: cards,
              ),
            )
            .toList(),
      ),
    );
  }
}
