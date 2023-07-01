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
          title: const Text('Wingfoil'),
        ),
        body: Stack(
          children: [
            const Positioned(
              top: 250,
              left: 5,
              child: Icon(Icons.arrow_back_ios, size: 50),
            ),
            const Positioned(
              top: 250,
              right: 5,
              child: Icon(Icons.arrow_forward_ios, size: 50),
            ),
            Image.asset('assets/wingfoil.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,),
          ],
        ),
      ),
    );
  }
}
