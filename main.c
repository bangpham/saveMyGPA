
/******************M2*********************

I am making a game where the player
has to fight his opponent fighter
Game stages, sprites, background currently using simple 
minimal design for testing
Currently, the backgrounds remain in
a fixed location and are not dynamic
There is no healthbar display as well as player's info
Currently the only thing working is moving player & enemy, they
can change aniState when receive certain command such as attack, defense, go back & forward
collision decreases the health.
<< MVP goal
there is no sound.
enemy doesnt follow you
enemy would go off the screen sometimes, if you collide for too long
enemy moves too fast for now.

For stretch goal hopefully I could eventually have the player to be able to travel through a map
and meet different opponents, if not I can try to make the game more complex

********************M3*********************

For this milestone, I have updated the visual of the
sprites, and back ground
I fixed the bug of moving off the screen for both sprites
Health bar now reflects both fighter's health
Cheat mode is implemented where player can hold L button to
disable opponent fighter to Defense nor Attack
Sound is implemented. There is Game sound, Title sound and Attack sound effect
My randomizer allow enemy to move more naturally.
There are 3 round of the fight until player ultimately beat Buzz
Current bug: Cannot loop to 3rd round
next milestone goal: add difficulty to opponent fighting style
stretch goal: add more complex to fighting mechanic

******************Final Game******************

For the final project I have created a single persong
fighting game, inspires by Street Fighter. Player will
play as a student who fights Buzz in campus gain his GPA to a 3.0
There are 3 rounds of fight. Each round you earn 
1.0 of GPA which is reflected on your scoreboard.
First fighter to win 3 rounds, wins the game.

Every hit you make on the opponent buzz,
you damage a portion of his health, displays on the healthbars and vice versa
Player can attack, jump , block a hit (so does Buzz, except for Buzz cannot jump)

The game has 3 sounds. 1 title song that loops in the start screen, 1 gamesong
that loops throughout the fight and 1 attack SFX when either fighter attacks
For the final product derrive from the last milestone, I have implemented
jumping with gravity for main fighter. You will be able to jump over Buzz and
fight on both sides of him on the playform.
The game has 1 cheat, that player can disable Buzz's aggressiveness by holding L

Buzz will fight more agressively from round 2. Player can not attack while holding
Right button at the same time. These are to minimize spamming/ button smashing.
From round 2, player will have to pace himself and keep a distance from Buzz in order
to win more easily (compare to button smashing).

I believe that I am qualified for the following extra credit criteria:
- Mosaic effects
- Custom art/unique art style (Even bigger upgrade from M3, which was meant to be final)
- Advance AI (round 3 of opponent aggressive fighting is not just random, makes it difficult to beat)
- Absurb school spirit with GT theme game!
- Adaption to feedback
- jumping

Known bugs:
If you press jump repeatedly at certain rate, player can levitate in the air
But this one isn't really a bug, I intentionally leave it since I think
it's kind of cool.
Dynamic background's speed is tied to player's speed when he goes left.

Fixed bugs:
Player and opponent can be push out of bound
Opponent does follows player to stay on screen
Player cannot jumped on top of bug nor overlap with its sprite
Player's defensive anistate is now flipped correctly
3 Level system now works correctly.

******************************************/
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

#include "spritesheetsss.h"
#include "bgCloud.h"
#include "background2.h"

#include "text.h"
#include "pallete.h"

//SOUND
#include "HitSound.h"
#include "GameSong.h"
#include "TitleSong.h"

#include "loseScreen.h"
#include "winScreen.h"
#include "startScreen.h"
#include "instruction.h"

int roundNumber;
// Button Variables
unsigned short buttons;
unsigned short oldButtons;
int seed;

SOUND soundA;
SOUND soundB;
// //enum states
enum {START,INSTRUCTION,GAME,PAUSE,WIN,LOSE};

//main function
int main() {
	setupSounds();
	setupInterrupts();
	loadPalette(background2Pal);
	hideSprites();
	init();
	goToStart();
	//state machine
	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state) {
			case START:
				start();
				stopSoundB();
				hideSprites();
				break;
			case INSTRUCTION:
				instruction();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case LOSE:
				lose();
				break;
			case WIN:
				win();
				break;
		}
		update();
		waitForVBlank();
	}
	return 0;
}
//init sprites
void init() {
	isRoundOver = 0;
	hOff = 140;
	vOff = 0;
	playerHealthBar = 11;
	enemyHealthBar = 59;
	initPlayer();
	initEnemy();

	updateScreenLocation();

	hideSprites();
}

void update() {
	updatePlayer(&player);
	updateEnemy(&enemy);
	playerHitEnemy(&enemy, &player);
	enemyHitPlayer(&enemy, &player);
	drawHealth();
	drawScore();
	drawRound();
	drawRoundNumber();
	drawAvatar();
	checkWinLose();
}


void drawRound() {
	shadowOAM[90].attr0 = 1;
	shadowOAM[90].attr1 = ATTR1_MEDIUM | (100);
	shadowOAM[90].attr2 = (ATTR2_TILEID(27, 8));
}

void drawRoundNumber() {
	int whichRound = 15 - roundNumber;
	shadowOAM[100].attr0 = 1;
	shadowOAM[100].attr1 = ATTR1_TINY | (135);
	shadowOAM[100].attr2 = (ATTR2_TILEID(28, whichRound));
}

void drawScore() {
	int playerScore = 15 - numPlayerWin;
	shadowOAM[110].attr0 = 15;
	shadowOAM[110].attr1 = ATTR1_TINY | (2);
	shadowOAM[110].attr2 = (ATTR2_TILEID(28, playerScore));

	int enemyScore = 15 - numEnemyWin;
	shadowOAM[120].attr0 = 15;
	shadowOAM[120].attr1 = ATTR1_TINY | (230);
	shadowOAM[120].attr2 = (ATTR2_TILEID(28, enemyScore));
}

// ________________________STATE MACHINE METHOD____________
void goToStart() {
	seed = 0;
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	drawFullscreenImage3(startScreenBitmap);
	state = START;
	playSoundA(TitleSong,TITLESONGLEN,TITLESONGFREQ, 1);

	vOff = 0;
	hOff = 0;
	roundNumber = 0;
	numEnemyWin = 0;
	numPlayerWin = 0;
	init();
	enemy.active = 0;
	player.active = 0;
}
void start() {
	seed++;
	hideSprites();
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		goToInstruction();

	} if(BUTTON_PRESSED(BUTTON_START)) {
		srand(seed);
		roundNumber = 1;
		goToGame();
		stopSound();
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		playSoundB(HitSound, HITSOUNDLEN, HITSOUNDFREQ, 0);
	}
}

void goToInstruction() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	state = INSTRUCTION;

	drawFullscreenImage3(instructionBitmap);
	char buffer[41];
	sprintf(buffer, "HIT SELECT TO MENU");
	drawString(130, 50, buffer, WHITE);


	vOff = 0;
	hOff = 0;

	enemy.active = 0;
	player.active = 0;
	init();
}
void instruction() {
	hideSprites();
	stopSoundB();
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
		playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);
	}
}

void goToGame() {
	REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
	REG_BG1CNT = BG_SCREENBLOCK(29) | BG_CHARBLOCK(1) | BG_SIZE_WIDE; //long background2 stadium background2

	REG_BG2CNT = BG_SCREENBLOCK(25) | BG_CHARBLOCK(2) | BG_SIZE_WIDE; //long background2 cloud
	
	state = GAME;
	initGame();
}
void game() {
	enemy.active = 1;
	player.active = 1;

	REG_BG2HOFF = hOffCloud++;
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}

	spriteAniStateUpdate();
	DMANow(3, shadowOAM, OAM, 128*4);
	waitForVBlank();
}

void goToPause() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	fillScreen3(GRAY);
	char buffer[41];
	sprintf(buffer, "PAUSE");
	drawString(80, 100, buffer, WHITE);
	pauseSound();
	state = PAUSE;
	hideSprites();
	enemy.active = 0;
	player.active = 0;

}
void pause() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		unpauseSound();
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}
}

void goToWin() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	stopSound();
	state = WIN;
	drawFullscreenImage3(winScreenBitmap);
		
	vOff = 0;
	hOff = 0;
}

void win() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void goToLose() {
	roundNumber = 1;
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	stopSound();
	state = LOSE;
	drawFullscreenImage3(loseScreenBitmap);
	
	enemy.active = 0;
	player.active = 0;
	

	vOff = 0;
	hOff = 0;

}
void lose() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}



void hideSprites() {
    // TODO 3.2: Complete this function
    // Loop through all the shadowOAM sprites and hide them.
    // This is where you will see the dreaded Corner Face if you do not implement it correctly
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}
 
void initGame() {
	//front background2
	DMANow(3, background2Tiles, &CHARBLOCK[1], background2TilesLen/2);
	DMANow(3, background2Map, &SCREENBLOCK[29], background2MapLen/2);

	//moving background2
	DMANow(3, bgCloudTiles, &CHARBLOCK[2], bgCloudTilesLen/2);
	DMANow(3, bgCloudMap, &SCREENBLOCK[25], bgCloudMapLen/2);

	DMANow(3, spritesheetsssPal, SPRITEPALETTE, spritesheetsssPalLen/2);
	DMANow(3, spritesheetsssTiles, &CHARBLOCK[4], spritesheetsssTilesLen/2);
    
updateScreenLocation();


	hideSprites();
}

