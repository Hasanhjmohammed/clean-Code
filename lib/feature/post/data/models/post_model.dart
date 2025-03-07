
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';

class PostModel extends Post {
   PostModel({ super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String ,dynamic>json){
    return   PostModel(id: json['id'], title: json['title'], body:json['body']);
  }

 Map<String,dynamic>  toJson (){
    return{
      'id':id,
      'title':title,
      'body':body
    };
  }
}