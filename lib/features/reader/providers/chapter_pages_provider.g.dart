// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_pages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chapterPages)
const chapterPagesProvider = ChapterPagesFamily._();

final class ChapterPagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PageContent>>,
          List<PageContent>,
          FutureOr<List<PageContent>>
        >
    with
        $FutureModifier<List<PageContent>>,
        $FutureProvider<List<PageContent>> {
  const ChapterPagesProvider._({
    required ChapterPagesFamily super.from,
    required (int, double, double, UserSettings) super.argument,
  }) : super(
         retry: null,
         name: r'chapterPagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chapterPagesHash();

  @override
  String toString() {
    return r'chapterPagesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<PageContent>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PageContent>> create(Ref ref) {
    final argument = this.argument as (int, double, double, UserSettings);
    return chapterPages(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChapterPagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chapterPagesHash() => r'b49fc983c2ee751eb64e26913662a337f34c014f';

final class ChapterPagesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<PageContent>>,
          (int, double, double, UserSettings)
        > {
  const ChapterPagesFamily._()
    : super(
        retry: null,
        name: r'chapterPagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChapterPagesProvider call(
    int chapterId,
    double pageWidth,
    double pageHeight,
    UserSettings userSettings,
  ) => ChapterPagesProvider._(
    argument: (chapterId, pageWidth, pageHeight, userSettings),
    from: this,
  );

  @override
  String toString() => r'chapterPagesProvider';
}
