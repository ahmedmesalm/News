import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/data/model/SourcesResponse.dart';

abstract class ApiManager{
  static const String ApiKey = "dce6ee1690e14f029434fd33e2720590";
  static Future<List<Source>>getSources()async{
    Uri url=Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$ApiKey");
   Response response= await get(url) ;
   Map json = jsonDecode(response.body);
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   if(response.statusCode >= 200 && response.statusCode < 300 &&
   sourcesResponse.sources ?.isNotEmpty == true){
     return sourcesResponse.sources! ;
   }
   throw Exception(sourcesResponse.message);
  }
  static getArticales(){

  }
}