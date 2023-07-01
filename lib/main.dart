import 'package:flutter/material.dart';
import 'Wingfoil.dart';
import 'package:progress_notebook/parametre_screen.dart';
import 'package:progress_notebook/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Kitesurf(),
      routes: {
        '/menu': (context) => MenuScreen(),
        '/parametres': (context) => ParametresScreen(),
      },
    );
  }
}
class Kitesurf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menu');
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
            const SizedBox(width: kToolbarHeight),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            const SizedBox(width: kToolbarHeight),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/parametres');
              },
            ),
          ],
          centerTitle: true,
          title: const Text('Kitesurf'),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Wingfoil()),
              );
            }
          },
          child: Stack(
            children: [
              Positioned(
                top: 250,
                right: 5,
                child: const Icon(Icons.arrow_forward_ios, size: 50),
              ),
              Image.asset('assets/kitesurf.jpg'), // Ajout de l'image kitesurf.jpg
            ],
          ),
        ),
      ),
    );
  }
}
