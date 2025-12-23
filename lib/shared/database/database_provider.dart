import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import the database file
import 'package:revision_draft/shared/database/database.dart';

part 'database_provider.g.dart';

@riverpod
AppDatabase database(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
