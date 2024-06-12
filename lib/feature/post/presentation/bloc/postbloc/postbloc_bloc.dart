import 'package:bloc/bloc.dart';
import 'package:cleancode/core/constant.dart';
import 'package:cleancode/core/erreo/failer.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/domin/useCasses/add_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/delete_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/get_all_post.dart';
import 'package:cleancode/feature/post/domin/useCasses/updata_post.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  GetAllPostUseCasses getAllpost;
  AddPostuseCasses addPost;
  UpdataPostuseCasses  updatePost ;
  DeletePostUseCasses deletePost ;
  PostblocBloc({
    required this.getAllpost,
    required this.addPost ,
    required this.deletePost,
    required this.updatePost,

  }) : super(PostblocInitial()) {
    on<PostblocEvent>((event, emit) async {
       if(event is GetAllPostEvent)
    {
     // emit(LoadingPostState());
      final  posts=  await getAllpost();
    return  emit(_returnGetorRefresh(posts));
    }
       else if(event is RefreshPostEvent)
         {
           emit(LoadingPostState());
           final  posts=  await getAllpost();
      return    emit(_returnGetorRefresh(posts));
         }
       else if (event is AddPostEvent){
         emit(LoadingPostState());
         final  posts=  await addPost(event.post);
          emit(_returnSuccessorfaulir(posts,ADDPOSTSUCCESS));
       }
       else if (event is EditePostEvent){
         emit(LoadingPostState());
         final  posts=  await updatePost(event.post);
         emit(_returnSuccessorfaulir(posts,UPDATAPOSTSUCCESS));
       }
       else if (event is DeletePostEvent){
       emit(LoadingPostState());
         final  posts=  await deletePost(event.postId);
         emit(_returnSuccessorfaulir(posts,DELETEPOSTSUCCESS));
       }

    });
  }

  PostblocState _returnGetorRefresh(Either<Failure, List<Post>> posts){
  return  posts.fold(
            (failure) => ErrorPostState(message: _ruturnErrormassage(failure)),
            (post) =>LoadedPostState(post: post)
    );
  }


  PostblocState _returnSuccessorfaulir(Either<Failure, Unit> posts,String massage){
    return  posts.fold(
            (failure) =>  ErrorPostState(message: _ruturnErrormassage(failure)),
            (post) =>   SuccessPostState(message: massage )
        );
  }

  _ruturnErrormassage(Failure failure){
   switch(failure.runtimeType)
       {
     case OfflineFailuer :
       return No_INTERNT;
     case EmptylineFailuer :
       return NO_DATA;
     case ServerlineFailuer :
       return PROBLEM_SERVER;
     default:
       return PROBLEM_UNeXPICT;

   }

  }


}
