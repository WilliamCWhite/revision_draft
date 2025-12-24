import 'package:revision_draft/shared/models/user_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import BOTH the database type AND the provider
import 'package:revision_draft/shared/models/book_models.dart';
import 'package:revision_draft/shared/models/page_content.dart';
import 'package:revision_draft/shared/database/database_provider.dart';
import 'package:revision_draft/features/page_generation/pagination.dart';

part 'chapter_pages_provider.g.dart';

@riverpod
Future<List<PageContent>> chapterPages(
  Ref ref,
  int chapterId,
  double pageWidth,
  double pageHeight,
  UserSettings userSettings,
) async {
  // 1. Watch the database instance
  final db = ref.watch(databaseProvider);

  // 2. Run the query
  final List<ChunkModel> chapterChunks = await db.getChunksForChapter(
    chapterId,
  );

  Paginator chapterPaginator = Paginator(
    pageWidth: pageWidth,
    pageHeight: pageHeight,
    userSettings: userSettings,
  );

  chapterPaginator.addChunks(chapterChunks);

  List<PageContent> pages = [];

  while (chapterPaginator.canCreatePage()) {
    PageContent page = chapterPaginator.generatePage();
    pages.add(page);
  }

  return pages;
}
