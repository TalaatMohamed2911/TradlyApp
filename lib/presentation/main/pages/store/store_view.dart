import 'package:flutter/material.dart';

class StoreView extends StatelessWidget {
  final String title;
  const StoreView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
