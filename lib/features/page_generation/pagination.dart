// Goals:
// 1 - Get chunks based on the chapterId (async)
// 2 - Loop through a chunk, converting everything into a TextSpan
// 3 - Add all the TextSpans for a chunk to the textPainter
//   3.1 - If the textspans don't fill a page, add another chunk
//   3.2 - If the textspans do fill a page,
//     3.2.1 - Cut off the textspans at the WORD that matters
//     3.2.2 - Store the index of the word to continue from, and of the chunk
//     3.2.3 - output a page somehow
//     3.2.4 - continue where left off with the context of the page
//
//

import 'package:flutter/material.dart';
import 'package:revision_draft/shared/models/page_content.dart';
import 'package:revision_draft/features/page_generation/parsing.dart';
import 'package:revision_draft/shared/models/book_models.dart';
import 'dart:math';

class Paginator {
  final double pageWidth;
  final double pageHeight;
  // i.e. x font, x font size, x color, should include textBaseline: alphabetic
  final TextStyle defaultStyle;
  // i.e. justify, left, right, center
  final TextAlign alignment;
  int wordsPerIteration;

  Paginator({
    required this.pageWidth,
    required this.pageHeight,
    required this.defaultStyle,
    required this.alignment,
    this.wordsPerIteration = 100,
  });

  List<TextSpan> spans = [];

  PageContent generatePage() {
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: alignment,
    );

    bool isFull = false;
    List<TextSpan> totalWords = [];

    while (!isFull) {
      // add words to consideration
      List<TextSpan> wordsToAdd = spans.sublist(
        0,
        min(spans.length, wordsPerIteration),
      );

      totalWords.addAll(wordsToAdd);

      TextSpan parentSpan = TextSpan(style: defaultStyle, children: totalWords);

      textPainter.text = parentSpan;

      textPainter.layout(maxWidth: pageWidth);

      if (textPainter.height > pageHeight) {
        // begin cutoff
        isFull = true;

        int cutoffCharIndex = textPainter
            .getPositionForOffset(Offset(pageWidth, pageHeight))
            .offset;
        int totalCharsSeen = 0;

        int lastWordIndex = -1;

        for (int i = 0; i < totalWords.length; i++) {
          String word = totalWords[i].text!;
          totalCharsSeen += word.length;

          // totalCharsSeen is 1 more than the cutoff char.
          // "code-" cutoff char: 4; chars seen: 5
          if (totalCharsSeen > cutoffCharIndex + 1) {
            // we know to cutoff at this word
            lastWordIndex = i;
          }
        }

        final pageSpans = spans.sublist(0, lastWordIndex + 1);
        spans = spans.sublist(lastWordIndex + 1);

        return PageContent(words: pageSpans);
      }
      // If there's no more words left to populate a page with
      else if (totalWords.length >= spans.length) {
        isFull = true;
        final pageSpans = spans;
        spans = [];

        return PageContent(words: pageSpans);
      }
      // Otherwise keep looping
    }

    throw Exception("Should have returned, but ending up exiting loop");
  }

  final chunkParser = ChunkParser();

  // Parse the chunks and add them to our textSpan list
  void addChunks(List<ChunkModel> chunks) {
    // Parse all chunks, into 2d list
    List<List<TextSpan>> parsedChunks = List.generate(
      chunks.length,
      (index) => chunkParser.parseChunk(chunks[index]),
    );

    List<TextSpan> flattened = parsedChunks.expand((list) => list).toList();

    spans.addAll(flattened);
  }
}
