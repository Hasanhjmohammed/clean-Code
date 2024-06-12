

import 'dart:convert';

import 'package:cleancode/core/erreo/exciption.dart';
import 'package:cleancode/core/uri.dart';
import 'package:cleancode/feature/post/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


abstract class RemoteDataSources {
    Future<List<PostModel>>getAllPost();
    Future<Unit>deletePost(int id);
    Future<Unit>addPost(PostModel postModel);
    Future<Unit>updataPost(PostModel postModel);
}
class RemotDataSourcesImplements implements RemoteDataSources{
  @override
  Future<Unit> addPost(PostModel postModel) async{
    final body={
      "body":postModel.body,
      "title":postModel.title
    };
final request=await http.post(Uri.parse(Getposturi),
   body: body
);
if(request.statusCode==201)
  {
  return  Future.value(unit);

  }
else
  {
    throw ServerExciption();
  }
  }

  @override
  Future<Unit> deletePost(int id) async{
   final request=await http.delete(Uri.parse('${Getposturi} ${id.toString()}'),headers: {
     'Content-type': 'application/json',
   },
 );

   if(request.statusCode==200)
     {
     return   Future.value(unit);
     }
   else
       {
       throw ServerExciption();
       }
  }

  @override
  Future<List<PostModel>> getAllPost() async{
    final request =await http.get(Uri.parse(Getposturi),headers: {
      'Connect-Type':'application/json'
    });
    if(request.statusCode==200){
     List res=json.decode(request.body) as List;
      List <PostModel>postmodelist= res.map<PostModel>((post)=>PostModel.fromJson(post)).toList();
      return postmodelist;
    }
    else
      {
        throw ServerExciption();
      }
  }
  @override
  Future<Unit> updataPost(PostModel postModel) async{

    final body={
      "body":postModel.body,
      "title":postModel.title
    };

  final request =await http.patch(Uri.parse('${Getposturi}${postModel.id.toString()}'),
      body: body);
  if(request.statusCode==200)
    {
      return Future.value(unit);
    }
  else
    {
     throw ServerExciption();
    }
  }

}