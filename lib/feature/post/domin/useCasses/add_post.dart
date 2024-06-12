import 'package:cleancode/core/erreo/failer.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/domin/repositories/post_repositories.dart';
import 'package:dartz/dartz.dart';

class AddPostuseCasses {
  PostRepositories repositories;

  AddPostuseCasses (this.repositories);
  Future<Either<Failure,Unit>>call(Post post)async{
    return await repositories.addPost(post);
  }
}