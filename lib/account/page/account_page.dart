import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Screen')),
      body: const Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text('Account Screen'),
      ),
    );
  }
}
