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
