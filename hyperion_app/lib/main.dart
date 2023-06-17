import 'package:flutter/material.dart';

import 'src/widgets/issue_board.dart';

void main() {
  runApp(const App());
}

const appTitle = 'Hyperion Issue Manager';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const IssueBoard(title: appTitle),
    );
  }
}
