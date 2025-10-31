import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_proj/firebase_options.dart';
import 'package:practice_proj/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 180, 22, 83),
        ),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
