// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookList)
const bookListProvider = BookListProvider._();

final class BookListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookModel>>,
          List<BookModel>,
          FutureOr<List<BookModel>>
        >
    with $FutureModifier<List<BookModel>>, $FutureProvider<List<BookModel>> {
  const BookListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookListHash();

  @$internal
  @override
  $FutureProviderElement<List<BookModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookModel>> create(Ref ref) {
    return bookList(ref);
  }
}

String _$bookListHash() => r'7f3a160fd371bdef9daaafbe67921177668361fc';
