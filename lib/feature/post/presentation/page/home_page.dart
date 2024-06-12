

import 'package:cleancode/core/Widget/custom_appbar.dart';
import 'package:cleancode/core/Widget/loading_widget.dart';
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:cleancode/feature/post/presentation/page/add_post.dart';
import 'package:cleancode/feature/post/presentation/widget/error_widget.dart';
import 'package:cleancode/feature/post/presentation/widget/post_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
BlocProvider.of<PostblocBloc>(context).add(GetAllPostEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: _onbuildFloatingActionButton(
      ),
      appBar:onappbar("Post Page"),
      body:  _onbuildbody(context),

    );
  }
  Widget _onbuildFloatingActionButton(){
    return FloatingActionButton.extended(
      label: Row(
        children: [

          Text('Add Post'),
          Icon(Icons.add),
        ],
      ),
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(
            builder: (con)=>AddPostPage(isupdataoradd: false,post:null),),),);
  }

  Widget _onbuildbody(BuildContext con){

  return BlocBuilder<PostblocBloc,PostblocState>(
      builder: (con,state){
        if(state is LoadingPostState)
          return LoadingWidget();
        else if(state is LoadedPostState)
          return RefreshIndicator(
              onRefresh: ()=>_onRefresh(),
              child: PostPageWidget(mypost: state.post));
        else if(state is ErrorPostState)
        //  BlocProvider.of<PostblocBloc>(context).add(RefreshPostEvent());
          return
            ErrorsWidget(massage:state.message,);
        return LoadingWidget();
      }
  );

  }

 Future<void> _onRefresh ()async{
   BlocProvider.of<PostblocBloc>(context).add(RefreshPostEvent());

 }

}
