-- 1. INSERT BOOKS
INSERT INTO books (title, subtitle, author) 
VALUES ('Moby Dick', 'The Whale', 'Herman Melville');

INSERT INTO books (title, subtitle, author) 
VALUES ('Pride and Prejudice', NULL, 'Jane Austen');

INSERT INTO books (title, subtitle, author) 
VALUES ('Frankenstein', 'The Modern Prometheus', 'Mary Shelley');


-- 2. INSERT CHAPTERS (Linking to Moby Dick, ID: 1)
INSERT INTO chapters (book_id, title, subtitle, "index") VALUES 
(1, 'Loomings', NULL, 0),
(1, 'The Carpet-Bag', NULL, 1);


-- 3. INSERT CHUNKS (Linking to Chapter IDs)

-- === CHAPTER 1: LOOMINGS (ID: 1) ===

-- Chunk 0: The famous opening
-- Added BOLD to "Ishmael" (\uE002 ... \uE003)
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(1, '\uE000Call me \uE002Ishmael\uE003. Some years ago—never mind how long precisely—having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world.\uE001', 0);

-- Chunk 1: The City
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(1, '\uE000It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people''s hats off—then, I account it high time to get to sea as soon as I can.\uE001\uE000There is now your insular city of the Manhattoes, belted round by wharves as Indian isles by coral reefs—commerce surrounds it with her surf. Right and left, the streets take you waterward. Its extreme downtown is the battery, where that noble mole is washed by waves, and cooled by breezes, which a few hours previous were out of sight of land. Look at the crowds of water-gazers there.\uE001', 1);

-- Chunk 2: The Water-Gazers
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(1, '\uE000Circumambulate the city of a dreamy Sabbath afternoon. Go from Corlears Hook to Coenties Slip, and from thence, by Whitehall, northward. What do you see?\uE001\uE000Posted like silent sentinels all around the town, stand thousands upon thousands of mortal men fixed in ocean reveries. Some leaning against the spiles; some seated upon the pier-heads; some looking over the bulwarks of ships from China; some high aloft in the rigging, as if striving to get a still better seaward peep. But these are all landsmen; of week days pent up in lath and plaster—tied to counters, nailed to benches, clinched to desks. How then is this? Are the green fields gone? What do they here?\uE001', 2);

-- Chunk 3: The Magnetic Virtue
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(1, '\uE000But look! here come more crowds, pacing straight for the water, and seemingly bound for a dive. Strange! Nothing will content them but the extremest limit of the land; loitering under the shady lee of yonder warehouses will not suffice. No. They must get just as nigh the water as they possibly can without falling in. And there they stand—miles of them—leagues. Inlanders all, they come from lanes and alleys, streets and avenues—north, east, south, and west. Yet here they all unite.\uE001\uE000Tell me, does the magnetic virtue of the needles of the compasses of all those ships attract them thither?\uE001', 3);

-- Chunk 4: The Artist
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(1, '\uE000Once more. Say you are in the country; in some high land of lakes. Take almost any path you please, and ten to one it carries you down in a dale, and leaves you there by a pool in the stream. There is magic in it. Let the most absent-minded of men be plunged in his deepest reveries—stand that man on his legs, set his feet a-going, and he will infallibly lead you to water, if water there be in all that region.\uE001\uE000Should you ever be athirst in the great American desert, try this experiment, if your caravan happen to be supplied with a metaphysical professor. Yes, as every one knows, meditation and water are wedded for ever.\uE001', 4);


-- === CHAPTER 2: THE CARPET-BAG (ID: 2) ===

-- Chunk 0: Packing up
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(2, '\uE000I stuffed a shirt or two into my old carpet-bag, tucked it under my arm, and started for Cape Horn and the Pacific. Quitting the good city of old Manhatto, I duly arrived in New Bedford.\uE001', 0);

-- Chunk 1: New Bedford gloom
-- Added ITALICS to "The Spouter-Inn" (\uE004 ... \uE005)
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(2, '\uE000It was a Saturday night in December. Much of this sort of travel is uncomfortable. I disappointedly turned back. Never mind, said I, this sort of thing is common. For the most part, I walked about much in the same condition of mind as if I were a wayfarer in a howling wilderness.\uE001\uE000Moving on, I at last came to a dim sort of light not far from the docks, and heard a forlorn creaking in the air; and looking up, saw a swinging sign over the door with a white painting upon it, faintly representing a tall straight jet of misty spray, and these words underneath—"\uE004The Spouter-Inn\uE005:—Peter Coffin."\uE001', 1);

-- Chunk 2: Entering the Inn
INSERT INTO chunks (chapter_id, content, "index") VALUES 
(2, '\uE000Coffin?—Spouter?—Rather ominous in that particular connexion, thought I. But it is a common name in Nantucket, they say, and I suppose this Peter here is an emigrant from there. As the light looked so dim, and the place, for the time, looked quiet enough, and the dilapidated little wooden house itself looked as if it might have been carted here from the ruins of some burnt district, and as the swinging sign had a poverty-stricken sort of creak to it, I thought that here was the very spot for cheap lodgings, and the best of pea coffee.\uE001', 2);
