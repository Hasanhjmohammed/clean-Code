import 'package:cleancode/feature/post/domin/entities/post_entities.dart';
import 'package:cleancode/feature/post/presentation/page/detale_post.dart';
import 'package:flutter/material.dart';



class PostPageWidget extends StatelessWidget {
  List<Post>mypost;
   PostPageWidget({super.key,required this.mypost});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(25),

     child: ListView.separated(itemBuilder: (con,index)=>ListTile(
       onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
           builder: (_)=>DetalePostPage(post:mypost[index]),
       ),
       ),
      leading: Text(mypost[index].id.toString(),style: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 20
      ),
      ),
      title: Text(mypost[index].title.toString(),style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20
      ),),
      subtitle: Text(mypost[index].body.toString()),
    ),
        separatorBuilder: (con,index)=>Divider(thickness: 1,),
        itemCount: mypost.length),
    );
  }
}
