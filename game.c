
/*****************************************
m2
I am making a game where the player
has to fight his opponent fighter
Game stages, sprites, background4 currently using simple 
minimal design for testing
Currently, the background4s remain in
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
and meet different opponents, if not I can try to do at least 1 opponent but with map
******************************************
M3
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
stretch goal: multiple opponent
******************************************/
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

//SOUND
#include "HitSound.h"
#include "GameSong.h"
#include "TitleSong.h"

#include "text.h"
int roundNumber = 1;
int ultimateWin = 0;
int state;
int lifeCount;
int isRoundOver;


int timer;
int timer2;

SOUND soundA;
SOUND soundB;

int whichEnemyMovement = 0;

OBJ_ATTR shadowOAM[128];

//initializing player and enemy object
PLAYER player;
ENEMY enemy;


//=========initializing structs==========

void initPlayer() { 
	player.worldRowVelocity = 0;
	player.width = 32;
	player.height = 32;
	player.cdel = 1;
	player.screenRow = 160/2;
	player.screenCol = 240/2;
	player.worldRow = GROUNDROW;
	player.worldCol = 140;
	player.aniCounter = 0;
	player.curFrame = 0;
	player.aniState = PLAYERIDLE;
	player.active = 1;
	player.health = 10;
	player.numFrames = 3;
	player.side = 0;
}

void initEnemy() {
	enemy.width = 32;
	enemy.height = 32;
	enemy.worldRow = GROUNDROW;
	enemy.worldCol = 340;
	enemy.aniCounter = 0;
	enemy.curFrame = 3;
	enemy.active = 0;
	enemy.health = 10;
	enemy.aniState = ENEMYIDLE;
	enemy.numFrames = 3;
}

//=========drawing sprites==========

void drawPlayer() {
	if (player.side == 1) {
		shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = ATTR1_MEDIUM|(COLMASK &  player.screenCol) | ATTR1_HFLIP;
		shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame*4, player.aniState * 4);
	} else {
		shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = ATTR1_MEDIUM|(COLMASK &  player.screenCol);
		shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame*4, player.aniState * 4);
	}
}

void drawEnemy() {
	if (player.side == 1) {
		shadowOAM[1].attr0 = (enemy.screenRow & ROWMASK);
		shadowOAM[1].attr1 = ATTR1_MEDIUM | (enemy.screenCol & COLMASK) | ATTR1_HFLIP;
		shadowOAM[1].attr2 = (ATTR2_TILEID(enemy.curFrame*4, enemy.aniState*4));
	} else {
		shadowOAM[1].attr0 = (enemy.screenRow & ROWMASK);
		shadowOAM[1].attr1 = ATTR1_MEDIUM | (enemy.screenCol & COLMASK);
		shadowOAM[1].attr2 = (ATTR2_TILEID(enemy.curFrame*4, enemy.aniState*4));
	}
}

void drawHealth() {
	int margin = 2;
	int playerHealthBarIndex = 2;
	int j = 0;
	for (int i = 0; i < player.health; i++) {
		shadowOAM[playerHealthBarIndex].attr0 = margin;
		shadowOAM[playerHealthBarIndex].attr1 = ATTR1_TINY | (margin + j);
		shadowOAM[playerHealthBarIndex].attr2 = (ATTR2_TILEID(31, 0));
		playerHealthBarIndex++;
		j += 8;
	}

	int enemyHealthBarIndex = 50;
	int k = 0;
	for (int i = 0; i < enemy.health; i++) {
		
		shadowOAM[enemyHealthBarIndex].attr0 = margin;
		shadowOAM[enemyHealthBarIndex].attr1 = ATTR1_TINY | (230 - k);
		shadowOAM[enemyHealthBarIndex].attr2 = (ATTR2_TILEID(31, 0));
		enemyHealthBarIndex++;
		k += 8;
	}
}

void drawAvatar() {
	shadowOAM[70].attr0 = 10;
	shadowOAM[70].attr1 = ATTR1_MEDIUM | (198);
	shadowOAM[70].attr2 = (ATTR2_TILEID(27, 4));

	//player
	shadowOAM[80].attr0 = 10;
	shadowOAM[80].attr1 = ATTR1_MEDIUM | (10);
	shadowOAM[80].attr2 = (ATTR2_TILEID(27, 0));
}


//===============Updating=====================

/*
*	determine on which side of the enemy the player is positioning.
*/
void updateSide() {
	if (player.screenCol < enemy.screenCol && player.worldRow == GROUNDROW) {
		player.side = 0;
		if (enemy.worldCol - (player.worldCol + player.width) < 0) {
			if (player.worldCol > LEFTBOUND)
				player.worldCol -= 2;
		}
	}
	if (player.screenCol >= enemy.screenCol  && player.worldRow == GROUNDROW) {
		player.side = 1;
		if (player.worldCol - (enemy.worldCol + enemy.width) < 0) {
			if (player.worldCol < RIGHTBOUND)
				player.worldCol += 2;
		}
	}
}

/*
*	update movement of the player
*/
void updatePlayer(PLAYER* p) {
	updateSide();

	if (p->active) {


	
		if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_PRESSED(BUTTON_A)) {
			if (player.screenCol > 110 && hOff < 270) {
				hOff += 2;
			}
			if (player.worldCol < RIGHTBOUND 
				&& (player.screenCol < enemy.screenCol - 23
					|| player.side == 1
					|| BUTTON_HELD(BUTTON_R)) ){
				player.worldCol += 3;
			}
		}

		if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_PRESSED(BUTTON_A)) {
			if (player.screenCol < 50 && hOff > 0) {
				hOff -= 2;
			}

			if( player.worldCol > LEFTBOUND
				// (player.screenCol - 25) because sprite is not
				//filled the rectangle box completely, 
				// this is just for visual.
				&& (enemy.screenCol < player.screenCol - 25
				|| player.side == 0 || BUTTON_HELD(BUTTON_R))){
				player.worldCol -= 3;
			}
		}

		//============gravity===============
		if (player.worldRow < GROUNDROW) {  
			//if player feet is not on ground, increase velocity
			player.worldRowVelocity += 2;
		} else {
			player.worldRowVelocity = 0;
		}

		if (BUTTON_HELD(BUTTON_R)) {
			if (player.worldRow > 64) {
				//acce constant, must be higher than velocity to jump
				player.worldRowVelocity -= 5;
			}
			player.aniState = PLAYERDEFENSE;
			updateSide();
		}

		//prevent gravity to push player under the ground row
		if (player.worldRow + player.worldRowVelocity > GROUNDROW) {
			player.worldRow = GROUNDROW;
			updateSide();
		} else {
			//gravity pulls player down
			player.worldRow += player.worldRowVelocity;
		}

		//==============endsGravity===============
	}
	drawPlayer();
}

/**
* Updating enemy's movement and position, on random basis
*/
void updateEnemy(ENEMY* e) {
	timer2++;
	if (timer2 % 10 == 0) {
		timer++;
		enemyAniState = rand() % (timer % 12);
	}

	if (e->active) {

		switch(enemyAniState) {
			case 0:

				//cheat: if button L is held, enemy will not defense
				if(!BUTTON_HELD(BUTTON_L)) {
					enemy.aniState = ENEMYDEFENSE;
				}

				break;
			case 1:
				enemy.aniState = ENEMYFORWARD;
				if (player.side == 0 && enemy.worldCol > player.worldCol + (player.width - 5)) {
					enemy.worldCol -= 2;
				}
				if (player.side == 1 && player.worldCol > enemy.worldCol + (enemy.width - 5)) {
					enemy.worldCol += 2;
				}

				//======Super difficult level AI=======
				if (roundNumber > 1) {
					if (!BUTTON_HELD(BUTTON_L) 
						&& !BUTTON_PRESSED(BUTTON_L) 
						&& enemy.worldCol - (player.worldCol + player.width) < 0) {

						enemy.aniState = ENEMYATTACK;
					}
				}
				break;
			case 2:
				//cheat: if button L is held, enemy will not attack
				if(!BUTTON_HELD(BUTTON_L)) {
					enemy.aniState = ENEMYATTACK;
				}
				break;
			case 3:
				enemy.aniState = ENEMYIDLE;
				break;
			case 4:
				enemy.aniState = ENEMYBACKWARD;
				if (player.side == 1 && enemy.worldCol < 250) {
					enemy.worldCol += 2;
				}
				if (player.side == 0 && enemy.worldCol > 250) {
					enemy.worldCol -= 2;
				}
				
		}
	}

	//maining a minimum distance between player and enemy
	if ( player.side == 0 && enemy.worldCol - player.worldCol > 160) {
		enemy.aniState = ENEMYFORWARD;
		enemy.worldCol -= 2;
	}

	if ( player.side == 1 && player.worldCol - enemy.worldCol > 160) {
		enemy.aniState = ENEMYFORWARD;
		enemy.worldCol += 2;
	}
	
	updateScreenLocation();
	drawEnemy();
}

//animation
void spriteAniStateUpdate() {
	player.prevAniState = player.aniState;
	player.aniState = PLAYERIDLE;

	if (player.aniCounter % 7 == 0) {
		player.curFrame = (player.curFrame + 1) % player.numFrames;
	}

	if ((BUTTON_PRESSED(BUTTON_A) && !BUTTON_HELD(BUTTON_B))
		|| (BUTTON_HELD(BUTTON_A) && !BUTTON_HELD(BUTTON_B))) {
		player.aniState = PLAYERATTACK;
		player.curFrame = 0;
	}

	if (BUTTON_HELD(BUTTON_LEFT) && (!BUTTON_PRESSED(BUTTON_A) || !BUTTON_HELD(BUTTON_A))) {
		player.aniState = PLAYERBACKWARD;
	}
	if (BUTTON_HELD(BUTTON_RIGHT) && (!BUTTON_PRESSED(BUTTON_A) || !BUTTON_HELD(BUTTON_A))) {
		player.aniState = PLAYERFORWARD;
	}
	if (BUTTON_HELD(BUTTON_B) || BUTTON_PRESSED(BUTTON_B)) {
		player.aniState = PLAYERDEFENSE;
	} else {
		player.aniCounter++;
	}

	//Update enemy states
	enemy.prevAniState = enemy.aniState;
	enemy.aniState = ENEMYIDLE;

	if (enemy.aniCounter % enemy.numFrames == 0) {
		enemy.aniCounter = 0;
	 	if (enemy.curFrame == 5) {
			enemy.curFrame = 3;
		} else {
			enemy.curFrame++;
		}
	}
	enemy.aniCounter++;

}

//======== Screen location=====
void updateScreenLocation() {
	REG_BG1HOFF = hOff;

	player.screenRow = player.worldRow - vOff;
	player.screenCol = player.worldCol - hOff;

	enemy.screenRow = enemy.worldRow - vOff;
	enemy.screenCol = enemy.worldCol - hOff;
}

//========collision handling====
void playerHitEnemy(ENEMY* o, PLAYER* p) {
	if (player.aniState == PLAYERATTACK && (enemy.aniState != ENEMYDEFENSE)) {
		if (collision(o->worldRow, o->worldCol, o->height,o->width, p->worldRow, p->worldCol, p->height,p->width )) {
			playSoundB(HitSound, HITSOUNDLEN, HITSOUNDFREQ, 0);
			enemy.aniState = ENEMYDEFENSE;
			o->health--;
			shadowOAM[enemyHealthBar].attr0 = ATTR0_HIDE;
			enemyHealthBar--;
			if (player.side == 0 && enemy.worldCol < 400) {
				enemy.worldCol += 35;
			} else if (player.side == 1 && enemy.worldCol > 50) {
				enemy.worldCol -= 35;
			}
		}
	
	}
}


void enemyHitPlayer(ENEMY* o, PLAYER* p) {
	if ((enemy.aniState == ENEMYATTACK 
		&& (player.aniState != PLAYERDEFENSE)) 
		&& (player.worldRow == GROUNDROW)) {

		if (collision(o->worldRow, o->worldCol, o->height,o->width, p->worldRow, p->worldCol, p->height,p->width )) {
			playSoundB(HitSound, HITSOUNDLEN, HITSOUNDFREQ, 0);
			p->health--;
			shadowOAM[playerHealthBar].attr0 = ATTR0_HIDE;
			playerHealthBar--;	//healthbar decrease
			
			if (player.screenCol < 50 && hOff > 0) {
				hOff -= 20;
			}


			if (player.side == 0) {
				if (player.worldCol >= LEFTBOUND) {
					player.worldCol -= 20;
				} else {
					enemy.worldCol += 20;
				}
			}

			if (player.side == 1) {
			 	if (player.worldCol >= RIGHTBOUND) {
					enemy.worldCol -= 20;
				} else {
					player.worldCol += 20;
				}
			}
			player.aniState = PLAYERDEFENSE;
		}
	
	}
}



/**
* Check win or lose
*/
void checkWinLose() {
	if (player.health == 0 || enemy.health == 0) {
		isRoundOver = 1;
		player.active = 0;
		enemy.active = 0;
	}

	if(isRoundOver) {

		if (player.health == 0) {
			numEnemyWin++;
		} else if (enemy.health == 0) {
			numPlayerWin++;
		}

		if (numPlayerWin == 3) {
			goToWin();
		} else if (numEnemyWin == 3) {
			goToLose();
		}

		switch(roundNumber) {
			case 1:
				roundNumber = 2;
				init();
				break;
			case 2:
				roundNumber = 3;
				init();
				break;
			case 3:
				roundNumber = 3;
				init();
				break;
		}
	}
}

//=====Sound======

void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.vbCount = 0;     
}

void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {
        dma[2].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.vbCount = 0;
}

void pauseSound() {
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0;
    REG_TM1CNT = 0;
}

void unpauseSound() {
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

void stopSound() {
    soundA.isPlaying = 0;
	soundB.isPlaying = 0;
    dma[1].cnt = 0;
    dma[2].cnt = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
}

void stopSoundB() {
	soundB.isPlaying = 0;
	dma[2].cnt = 0;
	REG_TM1CNT = 0;
}

void setupInterrupts() {
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler() {
	REG_IME = 0;
	if(REG_IF & INT_VBLANK) {
		if (soundA.isPlaying) {
			soundA.vbCount++;
			if (soundA.vbCount > soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		} 
		if (soundB.isPlaying) {
			soundB.vbCount++;
			if (soundB.vbCount > soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}
		REG_IF = INT_VBLANK; 
	}
	REG_IME = 1;
}


