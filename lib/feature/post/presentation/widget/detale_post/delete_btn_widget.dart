import 'package:cleancode/core/Widget/loading_widget.dart';
import 'package:cleancode/core/utel/snack_bar.dart';
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:cleancode/feature/post/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DeleteBtnWidget extends StatelessWidget {

  int PostId;

   DeleteBtnWidget({super.key,required this.PostId});

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton.icon(
        style:
        ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
        onPressed:
        () =>_delatepost(context,PostId),
        icon: Icon(Icons.delete),
        label: Text("delete"));
  }

  _delatepost(BuildContext context,int id) {
    showDialog(context: context, builder: (_) =>
        BlocConsumer<PostblocBloc, PostblocState>(
          listener: (context, state) {
            if(state is SuccessPostState)
            {
              SnackBarClass().SuccessfullSnackBar(context, state.message);
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                 builder: (_)=>HomePage()), (route) => false);
             // Navigator.pop(context);
            }
            else if(state is ErrorPostState)
            {
              SnackBarClass().ErrorSnackBar(context, state.message);
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            if(state is LoadingPostState)
            {
              return AlertDialog(
                title: LoadingWidget(),
              );

            }
            return  AlertDialog(
                content: Text('are you delete this post'),
                actions: [
                  TextButton(onPressed: () {
                    BlocProvider.of<PostblocBloc>(context).add(DeletePostEvent(postId: id));
                  }, child: Text('Yes')),
                  TextButton(onPressed: () {
                        Navigator.of(context).pop();
                  }, child: Text('No')),
                ],
              );
          },
        ),
    );
  }
}
