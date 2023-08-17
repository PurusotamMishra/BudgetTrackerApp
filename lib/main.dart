import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/home.dart';
import 'package:budget_tracker/pages/display.dart';
import 'package:budget_tracker/pages/loading.dart';
import 'package:budget_tracker/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/load': (context) => const Loading(),
        '/home': (context) => const Home(money: 48700,),
        '/list': (context) => const Display(),
        '/login': (context) => const WidgetTree(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const WidgetTree(),
    );
  }
}

// void main() => runApp(MaterialApp(
//   initialRoute: '/',
//   routes: {
//     '/': (context) => const Loading(),
//     '/home': (context) => const Home(),
//     '/list': (context) => const Display(),
//   },
// ));