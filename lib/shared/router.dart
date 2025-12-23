// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your screens
import 'package:revision_draft/features/book_menu/ui/book_menu_screen.dart';
import 'package:revision_draft/features/reader/ui/reader_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // Home Route
      GoRoute(path: '/', builder: (context, state) => const BookMenuScreen()),
      // Reader Route (Dynamic ID)
      GoRoute(
        path: '/reader/:id',
        builder: (context, state) {
          final idStr = state.pathParameters['id']!;
          final id = int.parse(idStr);
          return ReaderScreen(bookId: id);
        },
      ),
    ],
  );
});
