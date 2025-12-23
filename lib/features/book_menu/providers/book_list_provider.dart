import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import BOTH the database type AND the provider
import 'package:revision_draft/shared/models/book_models.dart';
import 'package:revision_draft/shared/database/database_provider.dart';

part 'book_list_provider.g.dart';

@riverpod
Future<List<BookModel>> bookList(Ref ref) async {
  // 1. Watch the database instance
  final db = ref.watch(databaseProvider);

  // 2. Run the query
  return db.getAllBooks();
}
