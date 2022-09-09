import 'package:flutter/material.dart';
import 'package:recipe_app/objectbox/objectbox.dart';
import 'constants.dart';
import 'screens/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kMostlyBlack,
        cardColor: kVeryDarkGray,
      ),
      home: HomeScreen(),
    );
  }
}

