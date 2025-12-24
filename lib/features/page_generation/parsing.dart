import 'package:flutter/material.dart';
import 'package:revision_draft/shared/models/book_models.dart';
import 'package:revision_draft/features/page_generation/models.dart';

class ChunkParser {
  bool currentlyBold = false;
  bool currentlyItalic = false;
  bool currentlyUnderlined = false;

  // Takes a database chunk and outputs it as a list of text spans
  List<TextSpan> parseChunk(ChunkModel chunk) {
    // I gotta go through the model and isolate every string somehow
    final allContent = chunk.content;
    final unprocessedStringWords = allContent.split(" ");

    final stringWords = splitHyphenatedWords(unprocessedStringWords);

    List<TextSpan> wordSpans = stringWords.map(stringWordConverter).toList();

    return wordSpans;
  }

  TextSpan stringWordConverter(String word) {
    // TODO: Update this to be wayyyy more efficient, run super frequently

    // Ensure current styles are up to date with word
    if (!currentlyBold) {
      currentlyBold = word.contains(TextMarkups.boldStart.code);
    }
    if (!currentlyItalic) {
      currentlyItalic = word.contains(TextMarkups.italicStart.code);
    }
    if (!currentlyUnderlined) {
      currentlyUnderlined = word.contains(TextMarkups.underlineStart.code);
    }

    bool isPgStart = word.contains(TextMarkups.paragraphStart.code)
        ? true
        : false;
    bool isPgEnd = word.contains(TextMarkups.pragraphEnd.code) ? true : false;
    bool isHyphenated = word.contains("-") ? true : false;

    TextSpan wordSpan = generateSpan(
      word,
      currentlyBold,
      currentlyItalic,
      currentlyUnderlined,
      isPgStart,
      isPgEnd,
      isHyphenated,
    );

    // If the style ended on this word, stop the style
    if (currentlyBold) {
      currentlyBold = !word.contains(TextMarkups.boldEnd.code);
    }
    if (currentlyItalic) {
      currentlyItalic = !word.contains(TextMarkups.italicEnd.code);
    }
    if (currentlyUnderlined) {
      currentlyUnderlined = !word.contains(TextMarkups.underlineEnd.code);
    }

    return wordSpan;
  }

  TextSpan generateSpan(
    String word,
    bool isBold,
    bool isItalic,
    bool isUnderlined,
    bool isPgStart,
    bool isPgEnd,
    bool isHyphenated,
  ) {
    // Eliminate identifier characters
    final markupRegex = RegExp(r'[\uE000-\uF8FF]');
    word = word.replaceAll(markupRegex, "");

    // Add leading tab, new line, or trailing space if necessary. Usually trailing space is necessary
    word =
        "${isPgStart ? "\u2003" : ""}word${isHyphenated ? "" : " "}${isPgEnd ? "\n" : ""}";

    return TextSpan(
      text: word,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        decoration: isUnderlined
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  }

  List<String> splitHyphenatedWords(List<String> words) {
    return words.expand((word) {
      if (!word.contains('-')) return [word];

      List<String> parts = word.split('-');
      List<String> result = [];

      for (int i = 0; i < parts.length; i++) {
        // If it's not the last part, add the hyphen back to it
        if (i < parts.length - 1) {
          result.add('${parts[i]}-');
        }
        // Add the last part only if it's not empty (handles words ending in hyphen)
        else if (parts[i].isNotEmpty) {
          result.add(parts[i]);
        }
      }
      return result;
    }).toList();
  }
}
