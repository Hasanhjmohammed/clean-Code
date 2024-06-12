import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:cleancode/core/erreo/failer.dart';
abstract class PostRepositories{
  Future<Either<Failure,List<Post>>> getAllPost();
  Future<Either<Failure,Unit>> deletePost (int id);
  Future<Either<Failure,Unit>> updatePost (Post post);
  Future<Either<Failure,Unit>>addPost(Post post);
}



