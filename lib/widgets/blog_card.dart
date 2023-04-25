import 'package:blog_app/model/blog_item_model.dart';
import 'package:blog_app/widgets/blog_bottom_modal.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blogItem,
  });

  final BlogItem blogItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(blogItem.id.toString()),
      title: Text(blogItem.title),
      subtitle: Text(blogItem.body),
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          context: context,
          builder: (context) {
            return BlogBottomModal(
              blogItem: blogItem,
            );
          },
        );
      },
    );
  }
}
