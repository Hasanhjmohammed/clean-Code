

import 'package:cleancode/core/connect/connect_info.dart';
import 'package:cleancode/feature/post/data/dataSources/local_post.dart';
import 'package:cleancode/feature/post/data/dataSources/remot_post.dart';
import 'package:cleancode/feature/post/data/respositories/post_repo_imp.dart';
import 'package:cleancode/feature/post/domin/repositories/post_repositories.dart';
import 'package:cleancode/feature/post/domin/useCasses/add_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/delete_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/get_all_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/updata_post.dart';
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;


Future<void>init()async{

  //Bloc
  getIt.registerFactory(() => PostblocBloc(getAllpost: getIt(),
      addPost: getIt(),
      deletePost: getIt(),
      updatePost: getIt()),
  );
  //UseCases

  getIt.registerLazySingleton(() => GetAllPostUseCasses(getIt()));
  getIt.registerLazySingleton(() => AddPostuseCasses(getIt()));
  getIt.registerLazySingleton(() => UpdataPostuseCasses(getIt()));
  getIt.registerLazySingleton(() => DeletePostUseCasses(getIt()));

  //repo

  getIt.registerLazySingleton<PostRepositories>(() => PostRepositoriesImplement(


      localDataSources: getIt(), remoteDataSources:getIt(), connectInfo: getIt()));
  //data sor
  //remote
  getIt.registerLazySingleton<RemoteDataSources>(() => RemotDataSourcesImplements());
  // local
  final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();


  getIt.registerLazySingleton<LocalDataSources>(() => LocalDataSourcesImplement(sharedPreferences: sharedPreferences));
  //internt

  getIt.registerLazySingleton<ConnectInfo>(() => ConnectinfoImplement(internetconnect: getIt()));

  getIt.registerLazySingleton(() =>InternetConnectionChecker() );

}