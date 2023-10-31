import 'package:flutter/material.dart';
import 'package:news/data/model/SourcesResponse.dart';
import 'package:news/ui/screens/home/tabs/news/news_list/news_list.dart';
import '../../../../../data/api/api_manager.dart';

class NewsTab extends StatefulWidget {
  final String categoryId ;
  NewsTab(this.categoryId) ;
  @override
  State<NewsTab> createState() => _NewsTabState();
}
class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder:(context , snapshot) {
          if (snapshot.hasData) {
            return buliderTab(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
  Widget buliderTab(List<Source> list) {
    return DefaultTabController(
      length: list.length ,
      child: Column(
        children: [
          const SizedBox(height: 15,),
          TabBar(
            indicatorColor:Colors.transparent,
              isScrollable: true,
              onTap: (index){
                currentTabIndex = index ;
                setState(() {});
              },
              tabs:list.map((source) => buildTabwidget(source.name??"",
              currentTabIndex ==list.indexOf(source))).toList()),
          Expanded(
            child: TabBarView(children:
              list.map((source) =>
                 NewsList(source.id!)).toList()
          ))],
      ),
    );
  }

   Widget buildTabwidget(String name , bool isSelected) {
      return Container(
        padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xff31a84c) : Colors.white,
              border: Border.all(color: const Color(0xff31a84c)),
              borderRadius: BorderRadius.circular(25)),
          child: Text(name,
            style: TextStyle(color:isSelected ? Colors.white :Colors.green
                ,fontSize: 25,fontWeight: FontWeight.w400),));
   }
}
