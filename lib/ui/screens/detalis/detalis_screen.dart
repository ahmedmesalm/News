import 'package:flutter/material.dart';
import 'package:news/data/model/ArticaleResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago ;

class DetalisArtical extends StatelessWidget {
  static const String routeName = "Detalis Artical" ;
  const DetalisArtical({super.key});

  @override
  Widget build(BuildContext context) {
    final artical = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff31a84c),
        shape: const RoundedRectangleBorder(borderRadius:
        BorderRadius.vertical(bottom: Radius.circular(20))),
        title: const Text('News Title',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child:Image.network(artical.urlToImage !,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height*.4,),
              ),
              const SizedBox(height: 8,),
              Text("${artical.source?. name} *" ?? "", style:
              const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign:TextAlign.start,),
              const SizedBox(height: 9,),
              Text(artical.title ??"",style: const TextStyle(fontSize: 22,
              fontWeight: FontWeight.normal),) ,
              const SizedBox(height: 8,),
              Text(artical.publishedAt??"",
                  style:
              const TextStyle(fontSize: 18),textAlign:TextAlign.end) ,
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    (Text(artical.description ??'',style:
                    const TextStyle(fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color:Colors.green ))
                    ),
                  const SizedBox(height: 30,),
                   Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: (){
                        Uri url=Uri.parse(artical.url??'') ;
                        launchUrl(url);
                      },
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("View full Article",
                            style: TextStyle(fontSize: 22,
                            ),),
                          Icon(Icons.play_arrow_sharp)
                        ],
                      ),
                    ),
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
