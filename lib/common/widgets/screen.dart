import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
