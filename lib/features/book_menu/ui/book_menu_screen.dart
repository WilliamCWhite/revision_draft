import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Import provider and model
import 'package:revision_draft/features/book_menu/providers/book_list_provider.dart';
import 'package:revision_draft/shared/models/book_model.dart';

class BookMenuScreen extends ConsumerWidget {
  const BookMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the list provider
    final booksAsync = ref.watch(bookListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Library')),
      body: booksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (books) {
          if (books.isEmpty) {
            return const Center(child: Text('No books found. Check database!'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: books.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _BookCard(book: books[index]);
            },
          );
        },
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final BookModel book;
  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    // Convert hex string to Color
    final colorInt = int.tryParse(book.color) ?? 0xFFCCCCCC;
    final bookColor = Color(colorInt);

    return Card(
      elevation: 2,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: bookColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              book.title[0],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          book.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to Reader
          context.push('/reader/${book.id}');
        },
      ),
    );
  }
}
