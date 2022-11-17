import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ssafy_mascot/screens/bottomBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyCE20bbnZ-Px3FSvODbwk2ATWw8Q4rNdQw',
    appId: '1:998343576751:web:a2834f34b924a198fcd85a',
    messagingSenderId: '998343576751',
    projectId: 'ssafy-mascot',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSAFY mascot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
    );
  }
}
