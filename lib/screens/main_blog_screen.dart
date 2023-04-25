import 'package:blog_app/widgets/blog_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/blog_item_model.dart';

class MainBlogScreen extends StatefulWidget {
  const MainBlogScreen({super.key});

  @override
  State<MainBlogScreen> createState() => _MainBlogScreenState();
}

class _MainBlogScreenState extends State<MainBlogScreen> {
  Dio dio = Dio();

  Future<List<BlogItem>> getDatas() async {
    var res = await dio.get("http://jsonplaceholder.typicode.com/posts");
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => BlogItem.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    getDatas();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getDatas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  if ((index + 1) % 5 == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Post ${index - 3} ~ ${index + 1}",
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BlogCard(
                    blogItem: snapshot.data![index],
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
