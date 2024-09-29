import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    required this.child,
    this.floatingActionButton,
    super.key,
  });

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
