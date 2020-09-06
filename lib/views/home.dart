import 'package:flutter/material.dart';
import 'package:newsapp_with_flutter/blog_VIew.dart';
import 'package:newsapp_with_flutter/helper/news.dart';
import 'package:newsapp_with_flutter/model/article_model.dart';
import 'package:newsapp_with_flutter/model/category_model.dart';
import 'package:newsapp_with_flutter/helper/data.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();

  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newClass = News();
    await newClass.getNews();
    articles = newClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter", style: TextStyle(color: Colors.black)),
            Text("News", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    // Categories View
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imagUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    //BLogs View
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 10.0),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,

                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// Category horizontal List
class CategoryTile extends StatelessWidget {
  final imagUrl, categoryName;

  CategoryTile({this.imagUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(right: 6),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                imagUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
