import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/data/model/ArticaleResponse.dart';
import 'package:news/data/model/SourcesResponse.dart';

abstract class ApiManager{
  static const String ApiKey = "dce6ee1690e14f029434fd33e2720590";
  static Future<List<Source>>getSources(String category)async{

    // Uri url=Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$ApiKey");
   Response response=
   await get(Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$ApiKey&category=$category")) ;
   Map json = jsonDecode(response.body);
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

   if( response.statusCode >= 200 &&
       response.statusCode < 300 &&
        sourcesResponse.sources ?.isNotEmpty == true){
     return sourcesResponse.sources! ;
   }
   throw Exception(sourcesResponse.message);
  }

  static Future<List<Article>> getArticales(String? sourceId)async {
    Response serverResponse= await get(Uri.parse
          ("https://newsapi.org/v2/everything?apiKey=$ApiKey&sources=$sourceId")) ;
    Map json =jsonDecode(serverResponse.body) ;
    ArticaleResponse articaleResponse = ArticaleResponse.fromJson(json);

    if( serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articaleResponse.articles ?.isNotEmpty == true){
      return articaleResponse.articles! ;
    }
    throw Exception("Try again later");



  }
  
  static Future<List<Article>> getSearch(String? query)async {
    Response serverResponse=
    await get(Uri.parse
      ("https://newsapi.org/v2/everything?apiKey=$ApiKey&q=$query")) ;
    Map json =jsonDecode(serverResponse.body) ;
    ArticaleResponse articaleResponse = ArticaleResponse.fromJson(json);

    if( serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articaleResponse.articles ?.isNotEmpty == true){
      return articaleResponse.articles! ;
    }
    throw Exception("Try again later");



  }
}
