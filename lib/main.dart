import 'package:flutter/material.dart';
import 'screens/fish_list_screen.dart';

void main() {
  runApp(const FishingSpeciesApp());
}

class FishingSpeciesApp extends StatelessWidget {
  const FishingSpeciesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freshwater Fish Species W05',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: const FishListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}