import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'screens/pantalla1.dart';
import 'screens/pantalla2.dart';
import 'screens/pantalla3.dart';
import 'screens/pantalla4.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Pantalla1(),
        '/pantalla2': (context) => Pantalla2(),
        '/pantalla4': (context) => Pantalla4(), 
        '/home': (context) => HomeScreen(), 
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/pantalla3') {
          final args = settings.arguments;
          if (args is Map<String, String>) {
            return MaterialPageRoute(
              builder: (context) => Pantalla3(
                title: args['title'] ?? 'Sin título',
                description: args['description'] ?? 'Sin descripción',
              ),
            );
          }
          return MaterialPageRoute(
            builder: (context) => const Pantalla3(
              title: 'Sin título',
              description: 'Sin descripción',
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ruta no encontrada: ${settings.name}',
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('Volver al Inicio'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/pantalla4');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al cerrar sesión: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          '¡Has iniciado sesión correctamente!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
