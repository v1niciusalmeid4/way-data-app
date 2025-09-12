import 'package:flutter/material.dart';

class DialogFullscreen extends StatelessWidget {
  final Widget child;
  const DialogFullscreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }
}
