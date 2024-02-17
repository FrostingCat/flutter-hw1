import 'package:flutter/material.dart';
import 'package:hw1/helper/news.dart';
import 'package:hw1/helper/widgets.dart';
import 'package:hw1/models/article.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> articles = [];
  bool _loading = true;

  Future getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('News'),
                Text(
                  'List',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            elevation: 0.5,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.anchor_sharp),
              ),
              Tab(icon: Icon(Icons.favorite))
            ]),
          ),
          body: _loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                                itemCount: articles.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return NewsTile(
                                    imgUrl: articles[index].urlToImage,
                                    title: articles[index].title,
                                    desc: articles[index].description,
                                    content: articles[index].content,
                                    posturl: articles[index].articleUrl,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Theme.of(context).primaryColor,
                        child: const Icon(Icons.favorite))
                  ],
                )),
    );
  }
}
