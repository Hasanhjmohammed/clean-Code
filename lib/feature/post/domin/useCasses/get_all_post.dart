import 'package:cleancode/core/erreo/failer.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/domin/repositories/post_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
class GetAllPostUseCasses {
  PostRepositories repositories;
  GetAllPostUseCasses(this.repositories);
  Future<Either<Failure,List<Post>>>call()async{
    return await repositories.getAllPost();

  }
}