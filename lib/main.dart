import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/create.dart';
import 'package:patterns_provider/pages/home.dart';
import 'package:patterns_provider/pages/update.dart';

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
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.id: (_) => const HomePage(),
        CreatePage.id: (_) => const CreatePage(),
        UpdatePage.id: (_) => const UpdatePage(),
      },
    );
  }
}
