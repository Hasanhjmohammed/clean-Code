import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/presentation/page/add_post.dart';
import 'package:cleancode/feature/post/presentation/widget/detale_post/delete_btn_widget.dart';
import 'package:flutter/material.dart';


class DetalePostWidget extends StatelessWidget {
  Post post;

  DetalePostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            post.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Text(
            post.body,
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
          ),
        ),
        Divider(),
        SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                onPressed: () =>
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => AddPostPage(post: post,isupdataoradd: true))),
                icon: Icon(Icons.edit),
                label: Text("Edit")),
            DeleteBtnWidget(PostId:post.id!)
          ],
        )
      ],
    );
  }
}
