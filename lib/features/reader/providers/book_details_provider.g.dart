// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookDetails)
const bookDetailsProvider = BookDetailsFamily._();

final class BookDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookModel>,
          BookModel,
          FutureOr<BookModel>
        >
    with $FutureModifier<BookModel>, $FutureProvider<BookModel> {
  const BookDetailsProvider._({
    required BookDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsHash();

  @override
  String toString() {
    return r'bookDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BookModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<BookModel> create(Ref ref) {
    final argument = this.argument as int;
    return bookDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsHash() => r'4b43bd5f411d6316be9ea61080f4d713150054b9';

final class BookDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BookModel>, int> {
  const BookDetailsFamily._()
    : super(
        retry: null,
        name: r'bookDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsProvider call(int bookId) =>
      BookDetailsProvider._(argument: bookId, from: this);

  @override
  String toString() => r'bookDetailsProvider';
}
