-- 1. INSERT BOOK (Moby Dick)
INSERT INTO books (title, subtitle, author) 
VALUES ('Moby Dick', 'The Whale', 'Herman Melville');

-- 2. INSERT CHAPTERS (Linking to Book ID 1)
INSERT INTO chapters (book_id, title, subtitle, "index") VALUES 
(1, 'Loomings', NULL, 0),          -- This becomes Chapter ID 1
(1, 'The Carpet-Bag', NULL, 1);    -- This becomes Chapter ID 2

-- 3. INSERT CHUNKS (Linking to Chapter IDs)

-- Chunks for Chapter 1 (Loomings)
INSERT INTO chunks (chapter_id, book_id, content, "index") VALUES 
(1, 1, '<p>Call me Ishmael. Some years ago—never mind how long precisely—having little or no money in my purse...</p>', 0),
(1, 1, '<p>There is now your insular city of the Manhattoes, belted round by wharves as Indian isles by coral reefs.</p>', 1),
(1, 1, '<p>Circumambulate the city of a dreamy Sabbath afternoon. What do you see?</p>', 2);

-- Chunks for Chapter 2 (The Carpet-Bag)
INSERT INTO chunks (chapter_id, book_id, content, "index") VALUES 
(2, 1, '<p>I stuffed a shirt or two into my old carpet-bag, tucked it under my arm, and started for Cape Horn.</p>', 0),
(2, 1, '<p>It was a Saturday night in December. Much of this sort of travel is uncomfortable.</p>', 1);
