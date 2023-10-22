import 'package:flutter/material.dart';
import 'package:news/data/model/ArticaleResponse.dart';

class ArticalWidget extends StatelessWidget {
  final Article article ;
  const ArticalWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child:Image.network(article.urlToImage !,
              height: MediaQuery.of(context).size.height*.25,),
          ),
          SizedBox(height: 8,),
          Text(article.source?. name ?? "", style:
          TextStyle(fontSize: 20,),textAlign:TextAlign.start,),
          SizedBox(height: 9,),
          Text(article.title ??"",style: TextStyle(fontSize: 19),) ,
          SizedBox(height: 8,),
          Text(article.publishedAt??"",style:
          TextStyle(fontSize: 20),textAlign:TextAlign.end) ,
        ],
      ),
    );
  }
}
