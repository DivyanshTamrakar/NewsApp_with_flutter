import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  ArticleView({Key key, this.blogUrl}) : super(key: key);

  ArticleView_State createState() => ArticleView_State();
}

class ArticleView_State extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: widget.blogUrl,
      ),
    );
  }
}
