import 'package:flutter/material.dart';
import 'package:news/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news/ui/screens/home/tabs/news/news_tap.dart';

import '../../../data/model/categoris_Dm.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home Scereen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;

  @override
  void initState(){
    super.initState();
    currentTab =CategoriesTab(onCategoryClick);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: (){
          if(currentTab  is! CategoriesTab ){
            setState(() {});
            currentTab = CategoriesTab(onCategoryClick);
            return Future.value(false) ;
          }else {
            return Future.value(true) ;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30))
            ),
            toolbarHeight: 85,
            titleSpacing: 50,
            backgroundColor: const Color(0xff31a84c),
            title: const Text(
              "WORLD NEWS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          ),
          body: currentTab,
        ),
      ),
    );
  }
  onCategoryClick(CategoryDm categoryDm ){
    currentTab =NewsTab(categoryDm.id) ;
    setState(() {
    });
  }
}
