import 'dart:convert';

import 'package:cleancode/core/erreo/exciption.dart';
import 'package:dartz/dartz.dart';
import 'package:cleancode/feature/post/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cleancode/core/constant.dart';
abstract class LocalDataSources {
  Future<List<PostModel>>getCatchPost();
  Future<Unit>catchPost(List<PostModel>posts);
}


class LocalDataSourcesImplement implements LocalDataSources{

  SharedPreferences sharedPreferences ;
  LocalDataSourcesImplement({required this.sharedPreferences});
  @override
  Future<Unit> catchPost(List<PostModel>posts) async{
     final mypost=posts.map<Map<String,dynamic>>((postmodel) => postmodel.toJson()
     ).toList();
    await sharedPreferences.setString(KEYPOSTS, json.encode(mypost));
       return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCatchPost() async{

    final myposts=await sharedPreferences.getString(KEYPOSTS);

    if(myposts!=null){
       final jsonpostmodel=json.decode(myposts);
      List<PostModel> listPostmode=jsonpostmodel.map<PostModel>((postmodel)=>
      PostModel.fromJson(postmodel)
      ).toList();
      return Future.value(listPostmode);
    }
    else
      throw EmptyExciption();

  }

}