class BlogItem {
  int userId;
  int id;
  String title;
  String body;

  BlogItem(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory BlogItem.fromMap(Map<String, dynamic> map) {
    return BlogItem(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"],
    );
  }
}
