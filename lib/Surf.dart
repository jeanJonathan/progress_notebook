import 'package:flutter/material.dart';
import 'Wingfoil.dart';

class Surf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Wingfoil()),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Surf'),
        ),
        body: Center(
          child: const Text('Bonjour, je suis l\'écran Surf'),
        ),
      ),
    );
  }
}
