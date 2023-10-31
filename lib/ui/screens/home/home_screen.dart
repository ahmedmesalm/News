import 'package:flutter/material.dart';
import 'package:news/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news/ui/screens/home/tabs/news/news_tap.dart';
import 'package:news/ui/screens/home/tabs/settings/settings_tab.dart';
import '../../../data/model/categoris_Dm.dart';
import '../../../search/new_search_delegate.dart';

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
            actions:  [
              Padding(
                padding:  EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () =>
                       showSearch(
                          context: context, delegate : NewSearchDelagate() ),
                  icon:const Icon( Icons.search,size: 30,)),
              )
                ],
          ),
          body: currentTab,
          drawer:  buildDrawer(),



        ),
      ),
    );
  }

  buildDrawer() {
    return    Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Text("WORLD NEWS" ,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),),
                ),),
              InkWell(
                onTap: (){
                  currentTab = CategoriesTab(onCategoryClick);
                  setState(() {});
                },
                child: const Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.list,size: 30, color: Colors.black,),
                    SizedBox(width: 15,),
                    Text("Categories",style: TextStyle(
                        fontSize: 25,fontWeight:FontWeight.bold ,color: Colors.black),)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  currentTab = const SettingsTab();
                  setState(() {});
                },
                child: const Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.settings,size: 30, color: Colors.black,),
                    SizedBox(width: 15,),
                    Text("Settings",style: TextStyle(
                        fontSize: 25,fontWeight:FontWeight.bold ,color: Colors.black),)
                  ],
                ),
              )
            ],
          ),
        );
  }

  onCategoryClick(CategoryDm categoryDm ){
    currentTab =NewsTab(categoryDm.id) ;
    setState(() {
    });
  }

}
