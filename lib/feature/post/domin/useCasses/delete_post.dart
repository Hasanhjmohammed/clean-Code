import 'package:cleancode/core/erreo/failer.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/domin/repositories/post_repositories.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCasses {
  PostRepositories repositories ;
  DeletePostUseCasses (this.repositories);

  Future<Either<Failure,Unit>> call (int idpost)async{
    return await repositories.deletePost(idpost);
  }
}