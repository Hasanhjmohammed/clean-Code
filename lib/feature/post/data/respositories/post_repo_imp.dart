import 'package:cleancode/core/connect/connect_info.dart';
import 'package:cleancode/core/erreo/exciption.dart';
import 'package:cleancode/core/erreo/failer.dart';
import 'package:cleancode/feature/post/data/models/post_model.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/domin/repositories/post_repositories.dart';
import 'package:cleancode/feature/post/data/dataSources/local_post.dart';
import 'package:cleancode/feature/post/data/dataSources/remot_post.dart';
import 'package:dartz/dartz.dart';

typedef StatePost = Future<Unit> Function();

class PostRepositoriesImplement implements PostRepositories {
  RemoteDataSources remoteDataSources;
  LocalDataSources localDataSources;
  ConnectInfo connectInfo;

  PostRepositoriesImplement({
    required this.localDataSources,
    required this.remoteDataSources,
    required this.connectInfo
  });

 @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
    if(await connectInfo.connectchecker)
    {
      try{
        List<PostModel> posts=await remoteDataSources.getAllPost();
       await localDataSources.catchPost(posts);
        return   Right(posts);
      }
      on ServerExciption
      { return Left(ServerlineFailuer()); }
    }
    else {
      try{
        final myposts=await localDataSources.getCatchPost();
       return Right(myposts);
      }
      on EmptyExciption{
        return Left(EmptylineFailuer());
      }

    }
  }
  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    PostModel postModel =PostModel(id: post.id, title: post.title, body: post.body);
    return   _messages(() async=> await remoteDataSources.addPost(postModel));

  }
  @override
  Future<Either<Failure, Unit>> deletePost(int PostId) {

    return   _messages(()async =>await remoteDataSources.deletePost(PostId));
  }
  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {

    PostModel postModel =PostModel(id: post.id, title: post.title, body: post.body);
      return   _messages(() async=> await remoteDataSources.updataPost(postModel));
  }

  Future<Either<Failure, Unit>>   _messages (StatePost statePost)async{

        if (await connectInfo.connectchecker) {
          try {
           await statePost ();
            return Right(unit);
        }
          on ServerExciption{
            return Left (ServerlineFailuer());
          }
        }
        else {
          return Left(OfflineFailuer());
      }
      }
  }


