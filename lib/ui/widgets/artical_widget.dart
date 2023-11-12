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
              height: MediaQuery.of(context).size.height*.32,
            fit: BoxFit.fill,),
          ),
          const SizedBox(height: 8,),
          Text(article.source?. name ?? "", style:
          const TextStyle(fontSize: 20,),textAlign:TextAlign.start,),
          const SizedBox(height: 9,),
          Text(article.title ??"",style: const TextStyle(fontSize: 19),) ,
          const SizedBox(height: 8,),
          Text(article.publishedAt??"",style:
          const TextStyle(fontSize: 20),textAlign:TextAlign.end) ,
        ],
      ),
    );
  }
}
