import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Job FinderApp',
        theme: ThemeData(
          primaryColor: Color(0xFF43B1B7),
          accentColor: Color(0xFFFED408)),
        home: HomePage());
  }
}
