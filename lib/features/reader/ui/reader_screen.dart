import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revision_draft/features/reader/providers/book_details_provider.dart';

class ReaderScreen extends ConsumerWidget {
  final int bookId;

  const ReaderScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the specific book detail
    final bookAsync = ref.watch(bookDetailsProvider(bookId));

    return Scaffold(
      body: bookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (book) {
          final colorInt = int.tryParse(book.color) ?? 0xFFCCCCCC;
          final bookColor = Color(colorInt);

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                backgroundColor: bookColor,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    book.title,
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                    ),
                  ),
                  background: Container(color: bookColor),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    book.content,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.6, // Better readability
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
