import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager.dart';
import 'package:news/data/model/ArticaleResponse.dart';
import 'package:news/ui/widgets/error_view.dart';
import 'package:news/ui/widgets/loading_widget.dart';

import '../../../../../widgets/artical_widget.dart';

  class NewsList extends StatelessWidget {
   final String sourceID ;
  const NewsList({required this.sourceID , super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future:ApiManager.getArticales(sourceID),
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
          return ArticalWidget(article: articles[index],) ;
        });
  }
}
