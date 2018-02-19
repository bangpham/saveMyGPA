typedef struct  
{
	int worldRowVelocity;
	int screenRow;
	int screenCol;
	int worldRow;
	int worldCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniCounter;
	int aniState;
	int prevAniState;
	int frameDirection;
    int curFrame;
    int active;
    int health;
    int numFrames;
    int side;

} PLAYER;

typedef struct  
{
	int screenRow;
	int screenCol;
	int worldRow;
	int worldCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniCounter;
	int aniState;
	int prevAniState;
	int frameDirection;
    int curFrame;
    int active;
    int health;
    int numFrames;
} ENEMY;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int isActive;
} BULLET;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int isActive;
} BULLET2;

#define NUMBULLET 3
#define GROUNDROW 100
#define LEFTBOUND 65
#define RIGHTBOUND 420 // ;)

enum {PLAYERIDLE, PLAYERFORWARD, PLAYERBACKWARD, PLAYERATTACK, PLAYERDEFENSE, PLAYERDAMAGE};
enum{ENEMYIDLE, ENEMYFORWARD, ENEMYBACKWARD, ENEMYATTACK, ENEMYDEFENSE, ENEMYDAMAGE};

//game variables  
int state;
int hOff;
int vOff;
int hOffCloud;

int timer;
int timer2;
int numEnemyWin;
int numPlayerWin;
int isRoundOver;
int enemyHealthBar; // index shadowOAM enemy health bar
int playerHealthBar; // index shadowOAM player health bar

OBJ_ATTR shadowOAM[128];

//initializing player and enemy object
PLAYER player;
ENEMY enemy;
int enemyAniState;

void update();
void init();
void start();
void goToStart();
void instruction();
void goToInstruction();
void initGame();
void game();
void goToGame();
void pause();
void goToPause();
void lose();
void goToLose();
void win();
void goToWin();
void hideSprites();

void initGame();
void initEnemy();
void initPlayer();

void updatePlayer(PLAYER*);
void updateEnemy(ENEMY*);

void updateOAMPlayer();

void drawHealth();
void drawAvatar();

void playerHitEnemy();
void enemyHitPlayer();

void updateScreenLocation();

void drawEnemy();
void drawPlayer();

void updatePlayer();
void updateEnemy();
void spriteAniStateUpdate();
void updateScreenLocation();
void checkWinLose();


void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();
void pauseSound();
void stopSoundB();
void unpauseSound();

void setupInterrupts();
void interruptHandler();

void drawRound();
void drawRoundNumber();
void drawScore();

void updateBullet();
void drawBullet();
void initBullet();
void collisionBulletPlayer();
void fireBullet();
extern BULLET playerBullets[3];

void updateSide();
int checkBound();