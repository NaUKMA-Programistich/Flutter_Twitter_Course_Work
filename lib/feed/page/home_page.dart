import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text('Home Screen'),
      ),
    );
  }
}
