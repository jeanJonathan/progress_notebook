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
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/parametres');
              },
            ),
          ],
          title: const Text('Surf'),
        ),
        body: Stack(
          children: [
            const Positioned(
              top: 250,
              left: 5,
              child: Icon(Icons.arrow_back_ios, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
