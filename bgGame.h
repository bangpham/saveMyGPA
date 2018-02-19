
//{{BLOCK(bgGame)

//======================================================================
//
//	bgGame, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 791 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 25312 + 4096 = 29920
//
//	Time-stamp: 2017-12-05, 02:47:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGGAME_H
#define GRIT_BGGAME_H

#define bgGameTilesLen 25312
extern const unsigned short bgGameTiles[12656];

#define bgGameMapLen 4096
extern const unsigned short bgGameMap[2048];

#define bgGamePalLen 512
extern const unsigned short bgGamePal[256];

#endif // GRIT_BGGAME_H

//}}BLOCK(bgGame)
