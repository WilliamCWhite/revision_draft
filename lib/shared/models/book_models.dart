class BookModel {
  final int id;
  final String title;
  final String? subtitle; // Nullable
  final String author;

  const BookModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.author,
  });
}

class ChapterModel {
  final int id;
  final int bookId;
  final String title;
  final String? subtitle;
  final int index;

  const ChapterModel({
    required this.id,
    required this.bookId,
    required this.title,
    this.subtitle,
    required this.index,
  });
}

class ChunkModel {
  final int id;
  final int chapterId;
  final int index;
  final String content;

  const ChunkModel({
    required this.id,
    required this.chapterId,
    required this.index,
    required this.content,
  });
}
