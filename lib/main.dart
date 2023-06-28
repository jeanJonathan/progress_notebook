import 'package:flutter/material.dart';
import 'Wingfoil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Kitesurf(),
    );
  }
}

class Kitesurf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Wingfoil()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kitesurf'),
        ),
        body: Center(
          child: const Text('Bonjour, je suis l\'écran Kitesurf'),
        ),
      ),
    );
  }
}
