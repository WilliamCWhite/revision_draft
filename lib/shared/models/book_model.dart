class BookModel {
  final int id;
  final String title;
  final String color;
  final String content;

  const BookModel({
    required this.id,
    required this.title,
    required this.color,
    required this.content,
  });

  // Optional: A manual "copyWith" method in case you need it later.
  // You don't need this to run the app right now, but it's useful to have.
  BookModel copyWith({int? id, String? title, String? color, String? content}) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      content: content ?? this.content,
    );
  }
}
