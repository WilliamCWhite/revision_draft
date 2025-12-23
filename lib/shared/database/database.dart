import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'package:revision_draft/shared/models/book_model.dart';

part 'database.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get color => text()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [Books])
class AppDatabase extends _$AppDatabase {
  // Use the drift_flutter helper for easy connection
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      // Load and execute the seed SQL
      final script = await rootBundle.loadString('assets/sql/seed.sql');
      final statements = script.split(';');

      for (final statement in statements) {
        if (statement.trim().isNotEmpty) {
          await customStatement(statement);
        }
      }
    },
  );

  // --- QUERIES ---
  Future<List<BookModel>> getAllBooks() async {
    final driftBooks = await select(books).get();

    return driftBooks.map((row) {
      return BookModel(
        id: row.id,
        title: row.title,
        color: row.color,
        content: row.content,
      );
    }).toList();
  }

  Future<BookModel> getBookById(int id) async {
    final row = await (select(
      books,
    )..where((tbl) => tbl.id.equals(id))).getSingle();

    return BookModel(
      id: row.id,
      title: row.title,
      color: row.color,
      content: row.content,
    );
  }
}

// Helper function to open the database
QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'my_app_db',
    native: const DriftNativeOptions(
      // By default, this puts the DB in the standard documents folder
      shareAcrossIsolates: true,
    ),
  );
}
