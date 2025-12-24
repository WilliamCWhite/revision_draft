import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'package:revision_draft/shared/models/book_models.dart';

part 'database.g.dart';

// 1. BOOKS (Top Level)
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()(); // Added
  TextColumn get author => text()();
  // Removed 'chapter_ids' - we will fetch them via query
}

// 2. CHAPTERS (Middle Level)
class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to Books table
  IntColumn get bookId => integer().references(Books, #id)();

  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()(); // Added
  IntColumn get index => integer()(); // To keep order (1, 2, 3)
}

// 3. CHUNKS (Bottom Level)
class Chunks extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to Chapters table
  IntColumn get chapterId => integer().references(Chapters, #id)();

  IntColumn get index => integer()(); // To keep order within chapter
  TextColumn get content => text()(); // The actual HTML string (<p>...</p>)
}

@DriftDatabase(tables: [Books, Chapters, Chunks])
class AppDatabase extends _$AppDatabase {
  // Use the drift_flutter helper for easy connection
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      // Load and execute the seed SQL
      final script = await rootBundle.loadString('assets/sql/seed.sql');
      // Split by regex so any old semicolon doesn't create errors
      final statements = script.split(RegExp(r';\s*(\r\n|\n|$)'));

      for (final statement in statements) {
        if (statement.trim().isNotEmpty) {
          await customStatement(statement);
        }
      }
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Since we are in dev, simplest way is to delete everything and recreate
      if (from < 3) {
        // Warning: This deletes data. In production, write real migration logic.
        await m.deleteTable('chunks');
        await m.deleteTable('chapters');
        await m.deleteTable('books');
        await m.createAll();
      }
    },
  );

  // --- QUERIES ---
  // Book Query
  Future<List<BookModel>> getAllBooks() async {
    final rows = await select(books).get();

    return rows.map((row) {
      return BookModel(
        id: row.id,
        title: row.title,
        subtitle: row.subtitle,
        author: row.author,
      );
    }).toList();
  }

  Future<List<ChapterModel>> getChaptersForBook(int bookId) async {
    final query = select(chapters)
      ..where((tbl) => tbl.bookId.equals(bookId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.index)]);

    final rows = await query.get();
    return rows
        .map(
          (row) => ChapterModel(
            id: row.id,
            bookId: row.bookId,
            title: row.title,
            subtitle: row.subtitle,
            index: row.index,
          ),
        )
        .toList();
  }

  // 3. Get Chunks for a specific Chapter
  Future<List<ChunkModel>> getChunksForChapter(int chapterId) async {
    final query = select(chunks)
      ..where((tbl) => tbl.chapterId.equals(chapterId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.index)]);

    final rows = await query.get();
    return rows
        .map(
          (row) => ChunkModel(
            id: row.id,
            chapterId: row.chapterId,
            index: row.index,
            content: row.content,
          ),
        )
        .toList();
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
