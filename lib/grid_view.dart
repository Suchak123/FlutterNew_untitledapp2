import 'package:flutter/material.dart';
class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid List'),
      ),
      body: Center(
        child: Text('This is gridview'),
      ),
    );
  }
}