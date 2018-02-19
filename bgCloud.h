
//{{BLOCK(bgCloud)

//======================================================================
//
//	bgCloud, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 90 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 2880 + 4096 = 7488
//
//	Time-stamp: 2017-12-05, 15:26:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGCLOUD_H
#define GRIT_BGCLOUD_H

#define bgCloudTilesLen 2880
extern const unsigned short bgCloudTiles[1440];

#define bgCloudMapLen 4096
extern const unsigned short bgCloudMap[2048];

#define bgCloudPalLen 512
extern const unsigned short bgCloudPal[256];

#endif // GRIT_BGCLOUD_H

//}}BLOCK(bgCloud)
