import 'package:flutter/material.dart';
import 'package:information_chest/screens/around_the_world.dart';
import 'package:information_chest/screens/art_sport_enter.dart';
import 'package:information_chest/screens/human_body_screen.dart';
import 'package:information_chest/screens/natural_world_screen.dart';
import 'package:information_chest/screens/planet_earth.dart';
import 'package:information_chest/screens/science_and_technology.dart';
import 'package:information_chest/screens/world_history_screen.dart';
import 'screens/universe.dart';
import 'package:information_chest/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information Chest',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/Universe': (context) => const Universe(),
        '/PlanetEarth': (context) => const PlanetEarthScreen(),
        '/WorldHistory': (context) => const WorldHistoryScreen(),
        '/NaturalWorld': (context) => const NaturalWorldScreen(),
        '/HumanBody': (context) => const HumanBodyScreen(),
        '/ScienceTechnology': (context) => const ScienceAndTechnologyScreen(),
        '/AroundTheWorld': (context) => const AroundTheWorldScreen(),
        '/ArtsSportsEntertainment': (context) =>
            const ArtsSportsEntertainmentScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Universe(),
    );
  }
}
