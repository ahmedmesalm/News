import 'package:flutter/material.dart';
import '../data/api/api_manager.dart';
import '../data/model/ArticaleResponse.dart';
import '../ui/screens/detalis/detalis_screen.dart';
import '../ui/widgets/artical_widget.dart';
import '../ui/widgets/error_view.dart';
import '../ui/widgets/loading_widget.dart';

class NewSearchDelagate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: ()=> showResults(context)
         , icon:const Icon(Icons.search))
   ] ;
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      return Navigator.of(context).pop();
    },
        icon:const Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder(
        future:ApiManager.getSearch(query),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return buildArticalesListView(snapshot.data!);
          } else if (snapshot.hasError) {
            return ErrorView(message: snapshot.error.toString()) ;
          } else {
            return const LoadingWidget();
          }
        });
  }
  Widget buildArticalesListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index ){
          return InkWell(
              onTap: (){
                Navigator.pushNamed(context, DetalisArtical.routeName,
                    arguments: articles[index]);
              },
              child: ArticalWidget(article: articles[index],)) ;
        }); ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return
    const Center(child: Text("No Result",style: TextStyle(fontSize: 35),),);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      // scaffoldBackgroundColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Color(0xff31a84c),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30))
        ),
        toolbarHeight: 85,
        titleSpacing: 50,),
    );

}
}