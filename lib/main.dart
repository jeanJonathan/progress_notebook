import 'package:flutter/material.dart';
import 'Wingfoil.dart';
import 'package:progress_notebook/parametre_screen.dart';
import 'package:progress_notebook/menu_screen.dart';
import 'package:mysql1/mysql1.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:angel3_orm_mysql/angel3_orm_mysql.dart';
import 'package:logging/logging.dart';
//Importation de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Pour s'assurer que les widgets Flutter sont initialisés correctement avant l'appel de firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primarySwatch: MaterialColor(
        0xFF074868,
        <int, Color>{
          50: Color(0xFF074868),
          100: Color(0xFF074868),
          200: Color(0xFF074868),
          300: Color(0xFF074868),
          400: Color(0xFF074868),
          500: Color(0xFF074868),
          600: Color(0xFF074868),
          700: Color(0xFF074868),
          800: Color(0xFF074868),
          900: Color(0xFF074868),
        },
      ),
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
  Future<void> fetchData() async {
    var settings = ConnectionSettings(
      host: " 10.188.99.5",
      port: 3306,
      user: "root",
      password: "",
      db: "bd_cahier_progression",
      timeout: Duration(seconds: 10),
    );

    var conn = await MySqlConnection.connect(settings);
    var logger = Logger('orm_mysql');
    var executor = MySqlExecutor(conn as MySQLConnection, logger: logger);
    try {
      var result = await executor.query('SELECT * FROM etapes', <dynamic>[] as String,true as Map<String, dynamic>);
      for (var row in result) {
        print(row);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      await conn.close();
    }
  }
  // Pour etablir la connexion à la base de données
  /*Future<MySqlConnection> connectToDatabase() async {
    var settings = ConnectionSettings(
      host: '10.188.99.5',
      port: 3306,
      user: 'root',
      password: '',
      db: 'bd_cahier_progression',
      //useSSL: true, // Activer SSL
    );
    var conn = await MySqlConnection.connect(settings);
    var result = await conn.query('SELECT * FROM etapes');
    for (var row in result) {
      print(row);
    }
    return conn;
  }
  Future<void> fetchData() async {
    var connection = await connectToDatabase();
    // Utilisez les données récupérées de la base de données ici
    var result = await connection.query('SELECT * FROM etapes');
    for (var row in result) {
      print(row);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    //fetchData(); // Appel de la méthode pour récupérer les données lors de la création du widget
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
              Image.asset('assets/kitesurf.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,), // Ajout de l'image kitesurf.jpg
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: 16,
                right: 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'KITE SURF',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64C8C8),
                      ),
                    ),
                    SizedBox(height: 26),
                    Text(
                      "Let's while",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Action du bouton
                      },
                      child: Text(
                        'VOIR LES ETAPES',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color(0xFF64C8C8), // Modifier la couleur ici
                      ),
                    ),
                    SizedBox(height: 16),
                    Positioned(
                      top: 250,
                      right: 5,
                      child: Icon(Icons.arrow_forward_ios, size: 50,
                          color: Color(0xFF074868)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

