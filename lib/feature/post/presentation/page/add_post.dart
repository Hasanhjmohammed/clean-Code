import 'package:cleancode/core/Widget/custom_appbar.dart';
import 'package:cleancode/core/Widget/loading_widget.dart';
import 'package:cleancode/core/utel/snack_bar.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:cleancode/feature/post/presentation/page/home_page.dart';
import 'package:cleancode/feature/post/presentation/widget/add_post/from_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostPage extends StatelessWidget {
  bool  isupdataoradd;
  Post ?post;

  AddPostPage({super.key,required this.isupdataoradd,this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _onappbar(isupdataoradd),
      body: _onbuildbody(),
    );
  }
  AppBar _onappbar(bool isupdataoradd){
    return onappbar(isupdataoradd?'Edite Post ':'Add New Post');
  }

  Widget _onbuildbody(){
    return Padding(padding: EdgeInsets.all(10),
      child: BlocConsumer<PostblocBloc,PostblocState>(
        listener: (con,state){
          if(state is SuccessPostState)
          {
            SnackBarClass().SuccessfullSnackBar(con, state.message);
            Navigator.of(con).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
          }
          else if(state is ErrorPostState)
            SnackBarClass().ErrorSnackBar(con, state.message);
        },
        builder:(con,state) {
          if(state is LoadingPostState)
            return LoadingWidget();
          else
            return FromWidget(post: post,isupdataoradd: isupdataoradd ,);
        },
      ),
    );
  }
}




