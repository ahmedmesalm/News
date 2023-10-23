import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager.dart';
import 'package:news/ui/screens/home/home_screen.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_) =>  const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,

    );
  }
}


