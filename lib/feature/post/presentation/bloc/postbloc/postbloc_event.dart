part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocEvent {}

class GetAllPostEvent extends PostblocEvent{}

class RefreshPostEvent extends PostblocEvent{}

class AddPostEvent extends PostblocEvent{
   final  Post post;
   AddPostEvent({required this.post});
}

class EditePostEvent extends PostblocEvent{
  final  Post post;
  EditePostEvent({required this.post});
}

class DeletePostEvent extends PostblocEvent{
final  int postId;

  DeletePostEvent({required this.postId});
}