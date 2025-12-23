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
          return Scaffold(
            body: Column(children: [Text(book.title), Text(book.author)]),
          );
        },
      ),
    );
  }
}
