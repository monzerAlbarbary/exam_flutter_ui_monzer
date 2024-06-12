import 'package:examflutterui/pages/login_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const ExamFlutterUi());
}

class ExamFlutterUi extends StatelessWidget {
  const ExamFlutterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
    );
  }
}
