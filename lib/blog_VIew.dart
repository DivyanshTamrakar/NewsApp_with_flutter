import 'package:flutter/material.dart';
import 'package:newsapp_with_flutter/views/article_views.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl)),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                desc,
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
