import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revision_draft/shared/router.dart';

void main() {
  runApp(
    // 1. Wrap the entire app in ProviderScope
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Watch the router provider
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'My Reader App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      // 3. Connect GoRouter
      routerConfig: router,
    );
  }
}
