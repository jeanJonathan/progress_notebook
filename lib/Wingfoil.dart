import 'package:flutter/material.dart';
import 'Surf.dart';

class Wingfoil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Surf()),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wingfoil'),
        ),
        body: Center(
          child: const Text('Bonjour, je suis l\'écran Wingfoil'),
        ),
      ),
    );
  }
}
