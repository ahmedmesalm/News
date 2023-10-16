import 'package:flutter/material.dart';
import 'package:news/data/model/SourcesResponse.dart';
import '../../../../../data/api/api_manager.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}
class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder:(context , snapshot) {
          if (snapshot.hasData) {
            return buliderTab(snapshot.data !);
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
          SizedBox(height: 10,),
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
              list.map((source) => Container(color: Colors.red,)).toList()),
          )
        ],
      ),
    );
  }

   Widget buildTabwidget(String name , bool isSelected) {
    return Container(
      padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: isSelected ? Color(0xff9952a2) : Colors.white,
            border: Border.all(color: Color(0xffffffff)),
            borderRadius: BorderRadius.circular(25)),
        child: Text(name,
          style: TextStyle(color:isSelected ? Colors.white :Colors.black
              ,fontSize: 25,fontWeight: FontWeight.w400),));
   }
}
