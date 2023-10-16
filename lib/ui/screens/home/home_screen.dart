import 'package:flutter/material.dart';
import 'package:news/ui/screens/home/tabs/news/news_tap.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName = "home Scereen" ;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xd0050404) ,
        appBar: AppBar(
          titleSpacing: 50,
          backgroundColor: Color(0xd0050404),
          title: const Text("WORLD NEWS",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,
          fontSize: 28,),),),
        body:  NewsTab(),
      ),
    );
  }
}
