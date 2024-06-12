import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:cleancode/feature/post/presentation/widget/add_post/elevated_add_updata_widget.dart';
import 'package:cleancode/feature/post/presentation/widget/add_post/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FromWidget extends StatefulWidget {
  bool isupdataoradd;
  Post ?post;
  FromWidget ({super.key,required this.post,required this.isupdataoradd});

  @override
  State<FromWidget> createState() => _FromWidgetState();
}

class _FromWidgetState extends State<FromWidget> {

  TextEditingController textEditingControllertitle=TextEditingController();
  TextEditingController textEditingControllerbody=TextEditingController();

  @override
  void initState() {
if(widget.isupdataoradd)
  {
    textEditingControllertitle.text=widget.post!.title;
    textEditingControllerbody.text=widget.post!.body;
  }
    super.initState();
  }

  final keyForm=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(

        key: keyForm,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              controller: textEditingControllertitle,
              name: 'title',
              multylins: false,
            ),
            TextFormFieldWidget(
           controller: textEditingControllerbody,
              name: 'body',
              multylins: true,
            ),
            ElevatedButtonWidget(label:widget.isupdataoradd?'Edit':'add',
                onpressed:()=>AddEditPostButton(widget.isupdataoradd),
                iconData:widget.isupdataoradd?Icons.edit:Icons.add ),
          ],
        ),
    );
  }

  AddEditPostButton(bool isEditorAdd){
    final isvalid=keyForm.currentState!.validate();
    if(isvalid){
  isEditorAdd? BlocProvider.of<PostblocBloc>(context).add(EditePostEvent(post: Post(
      title: textEditingControllertitle.text,
      body: textEditingControllerbody.text,)))
      :BlocProvider.of<PostblocBloc>(context).add(AddPostEvent(post: Post(
     title: textEditingControllertitle.text,
     body: textEditingControllerbody.text,
   )
  )
  );
    }
  }

}
