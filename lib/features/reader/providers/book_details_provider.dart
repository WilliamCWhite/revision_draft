import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import BOTH the database type AND the provider
import 'package:revision_draft/shared/models/book_model.dart';
import 'package:revision_draft/shared/database/database_provider.dart';

part 'book_details_provider.g.dart';

@riverpod
Future<BookModel> bookDetails(Ref ref, int bookId) async {
  // 1. Watch the database instance
  final db = ref.watch(databaseProvider);

  // 2. Run the query
  return db.getBookById(bookId);
}
