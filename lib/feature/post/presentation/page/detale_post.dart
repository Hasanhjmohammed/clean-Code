import 'package:cleancode/core/Widget/custom_appbar.dart';
import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/presentation/widget/detale_post/detale_post_widget.dart';
import 'package:flutter/material.dart';
class DetalePostPage extends StatelessWidget {
  Post post;
  DetalePostPage({super.key,required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onappbar('Detale Post'),
      body: _buildbody(),
    );
  }
Widget  _buildbody(){
    return Padding(padding: EdgeInsets.all(10),
    child: Center(
      child:
      DetalePostWidget(post:post),
    ),
    );
}
}
