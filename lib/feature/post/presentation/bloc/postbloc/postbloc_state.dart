part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocState {}

final class PostblocInitial extends PostblocState {}


class LoadingPostState extends PostblocState{}

class LoadedPostState extends PostblocState{
 final  List<Post>post;
  LoadedPostState({required this.post});
}
class ErrorPostState extends PostblocState{
 final  String message;
  ErrorPostState({required this.message});
}

class SuccessPostState extends PostblocState{
 final  String message;
 SuccessPostState({required this.message});
}
