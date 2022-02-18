import 'package:flutter/material.dart';
import 'package:app_inicio/info.dart';

// void main() => print('Hello World!');
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Info(),
    );
  }
}

  


