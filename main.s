	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #0
	mov	r1, #59
	mov	ip, #11
	mov	r5, #140
	ldr	r2, .L6
	ldr	r3, .L6+4
	ldr	lr, .L6+8
	ldr	r0, .L6+12
	str	r4, [r2]
	ldr	r2, .L6+16
	str	r4, [r3]
	ldr	r3, .L6+20
	str	r1, [r2]
	str	r5, [lr]
	str	ip, [r0]
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+28
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r1, #512
	ldr	r2, .L6+32
.L2:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	isRoundOver
	.word	vOff
	.word	hOff
	.word	playerHealthBar
	.word	enemyHealthBar
	.word	initPlayer
	.word	initEnemy
	.word	updateScreenLocation
	.word	shadowOAM
	.size	init, .-init
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, .L10
	ldr	r4, .L10+4
	mov	r0, r5
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L10+12
	mov	lr, pc
	bx	r3
	mov	r1, r5
	mov	r0, r4
	ldr	r3, .L10+16
	mov	lr, pc
	bx	r3
	mov	r1, r5
	mov	r0, r4
	ldr	r3, .L10+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+24
	mov	lr, pc
	bx	r3
	mov	lr, #15
	mov	r7, #2
	mov	r6, #230
	mov	ip, #1
	mov	r5, #872
	mov	r4, #135
	ldr	r3, .L10+28
	ldr	r0, [r3]
	ldr	r3, .L10+32
	ldr	r2, .L10+36
	ldr	r1, [r3]
	ldr	r3, .L10+40
	ldr	r2, [r2]
	rsb	r0, r0, lr
	rsb	r1, r1, lr
	add	r8, r3, #884
	add	r0, r0, #896
	rsb	r2, r2, lr
	strh	r0, [r8]	@ movhi
	add	r1, r1, #896
	add	r0, r3, #964
	strh	r1, [r0]	@ movhi
	add	r2, r2, #896
	add	r1, r3, #804
	strh	r2, [r1]	@ movhi
	add	r2, r3, #880
	strh	lr, [r2]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	add	r2, r3, #960
	ldr	r7, .L10+44
	strh	lr, [r2]	@ movhi
	add	r1, r3, #720
	strh	r6, [r2, #2]	@ movhi
	add	r2, r3, #800
	add	r3, r3, #724
	strh	r7, [r1, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	ldr	r0, .L10+48
	strh	ip, [r1]	@ movhi
	strh	ip, [r2]	@ movhi
	mov	lr, pc
	bx	r0
	ldr	r3, .L10+52
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	enemy
	.word	updatePlayer
	.word	updateEnemy
	.word	playerHitEnemy
	.word	enemyHitPlayer
	.word	drawHealth
	.word	numPlayerWin
	.word	numEnemyWin
	.word	roundNumber
	.word	shadowOAM
	.word	-32668
	.word	drawAvatar
	.word	checkWinLose
	.size	update, .-update
	.align	2
	.global	drawRound
	.type	drawRound, %function
drawRound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	mov	r1, #872
	ldr	r3, .L13
	ldr	r0, .L13+4
	add	r2, r3, #720
	add	r3, r3, #724
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	bx	lr
.L14:
	.align	2
.L13:
	.word	shadowOAM
	.word	-32668
	.size	drawRound, .-drawRound
	.align	2
	.global	drawRoundNumber
	.type	drawRoundNumber, %function
drawRoundNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r1, #135
	ldr	r3, .L16
	ldr	r2, [r3]
	ldr	r3, .L16+4
	rsb	r2, r2, #15
	add	ip, r3, #804
	add	r2, r2, #896
	add	r3, r3, #800
	strh	r2, [ip]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	roundNumber
	.word	shadowOAM
	.size	drawRoundNumber, .-drawRoundNumber
	.align	2
	.global	drawScore
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #15
	stmfd	sp!, {r4, r5, lr}
	mov	ip, #230
	mov	lr, #2
	ldr	r2, .L20
	ldr	r3, .L20+4
	ldr	r1, [r2]
	ldr	r2, [r3]
	ldr	r3, .L20+8
	rsb	r1, r1, r0
	add	r5, r3, #884
	add	r1, r1, #896
	rsb	r2, r2, r0
	add	r4, r3, #964
	strh	r1, [r5]	@ movhi
	add	r2, r2, #896
	add	r1, r3, #880
	add	r3, r3, #960
	strh	r2, [r4]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	numPlayerWin
	.word	numEnemyWin
	.word	shadowOAM
	.size	drawScore, .-drawScore
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #0
	ldr	r1, .L24
	ldr	r2, .L24+4
	str	r4, [r1]
	ldr	r0, .L24+8
	strh	r2, [r3]	@ movhi
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L24+16
	mov	r3, #1
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	ldr	r0, .L24+28
	ldr	r5, .L24+32
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	ldr	r2, .L24+36
	ldr	r3, .L24+40
	ldr	ip, .L24+44
	ldr	r0, .L24+48
	ldr	r1, .L24+52
	str	r4, [r2]
	str	r4, [r3]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	bl	init
	ldr	r2, .L24+56
	ldr	r3, .L24+60
	str	r4, [r2, #52]
	str	r4, [r3, #56]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	seed
	.word	1027
	.word	startScreenBitmap
	.word	drawFullscreenImage3
	.word	state
	.word	11025
	.word	507456
	.word	TitleSong
	.word	playSoundA
	.word	numEnemyWin
	.word	numPlayerWin
	.word	vOff
	.word	hOff
	.word	roundNumber
	.word	enemy
	.word	player
	.size	goToStart, .-goToStart
	.align	2
	.type	lose.part.1, %function
lose.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L29:
	.align	2
.L28:
	.word	buttons
	.size	lose.part.1, .-lose.part.1
	.set	win.part.0,lose.part.1
	.align	2
	.global	goToInstruction
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #1
	stmfd	sp!, {r4, lr}
	ldr	r0, .L32
	ldr	r2, .L32+4
	sub	sp, sp, #48
	strh	r0, [r3]	@ movhi
	ldr	r0, .L32+8
	ldr	r3, .L32+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	lr, .L32+16
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	strh	r3, [ip], #2	@ movhi
	mov	lr, r3, lsr #16
	strb	lr, [ip]
	add	r2, sp, #4
	ldr	r3, .L32+20
	mov	r1, #50
	mov	r0, #130
	ldr	r4, .L32+24
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	ip, .L32+28
	ldr	r0, .L32+32
	ldr	r1, .L32+36
	ldr	r2, .L32+40
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1, #52]
	str	r3, [r2, #56]
	bl	init
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	1027
	.word	state
	.word	instructionBitmap
	.word	drawFullscreenImage3
	.word	.LC0
	.word	32767
	.word	drawString
	.word	vOff
	.word	hOff
	.word	enemy
	.word	player
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r2, .L38
	sub	sp, sp, #48
	strh	r2, [r3]	@ movhi
	ldr	r0, .L38+4
	ldr	r3, .L38+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+12
	ldmia	r3, {r0, r1}
	add	r2, sp, #4
	ldr	r3, .L38+16
	str	r0, [sp, #4]
	strh	r1, [sp, #8]	@ movhi
	mov	r0, #80
	mov	r1, #100
	ldr	r4, .L38+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+24
	mov	lr, pc
	bx	r3
	mov	ip, #3
	mov	r3, #0
	mov	r1, #512
	ldr	r0, .L38+28
	ldr	r2, .L38+32
	str	ip, [r0]
.L35:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L35
	mov	r3, #0
	ldr	r1, .L38+36
	ldr	r2, .L38+40
	str	r3, [r1, #52]
	str	r3, [r2, #56]
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	1027
	.word	15855
	.word	fillScreen3
	.word	.LC1
	.word	32767
	.word	drawString
	.word	pauseSound
	.word	state
	.word	shadowOAM
	.word	enemy
	.word	player
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	ip, #67108864
	ldr	r0, .L52
	ldr	r3, [r0]
	mov	r2, r3, asl #16
	mov	r2, r2, lsr #16
	add	r3, r3, r1
	stmfd	sp!, {r4, lr}
	str	r3, [r0]
	ldr	r4, .L52+4
	strh	r2, [ip, #24]	@ movhi
	ldrh	r3, [r4]
	ldr	r0, .L52+8
	ldr	r2, .L52+12
	tst	r3, #4
	str	r1, [r0, #52]
	str	r1, [r2, #56]
	beq	.L41
	ldr	r2, .L52+16
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L50
.L41:
	tst	r3, #8
	beq	.L42
	ldr	r3, .L52+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L42:
	ldr	r3, .L52+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L52+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L52+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+32
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	bl	goToPause
	b	.L42
.L50:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L41
.L53:
	.align	2
.L52:
	.word	hOffCloud
	.word	oldButtons
	.word	enemy
	.word	player
	.word	buttons
	.word	spriteAniStateUpdate
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.size	game, .-game
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L56
	stmfd	sp!, {r4, lr}
	ldr	r3, .L56+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #4
	ldr	r2, .L56+8
	ldr	r3, .L56+12
	ldr	r0, .L56+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L56+20
	ldr	r2, .L56+24
	str	r3, [r1]
	str	r3, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	1027
	.word	stopSound
	.word	state
	.word	drawFullscreenImage3
	.word	winScreenBitmap
	.word	vOff
	.word	hOff
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	mov	r2, #67108864
	ldr	r1, .L60
	ldr	r3, .L60+4
	stmfd	sp!, {r4, lr}
	str	r0, [r3]
	strh	r1, [r2]	@ movhi
	ldr	r3, .L60+8
	mov	lr, pc
	bx	r3
	mov	r1, #5
	ldr	r2, .L60+12
	ldr	r0, .L60+16
	ldr	r3, .L60+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	ip, .L60+24
	ldr	r0, .L60+28
	ldr	r1, .L60+32
	ldr	r2, .L60+36
	str	r3, [ip, #52]
	str	r3, [r0, #56]
	str	r3, [r1]
	str	r3, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	1027
	.word	roundNumber
	.word	stopSound
	.word	state
	.word	loseScreenBitmap
	.word	drawFullscreenImage3
	.word	enemy
	.word	player
	.word	vOff
	.word	hOff
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L64
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.1
.L65:
	.align	2
.L64:
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L70
.L68:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L68
	bx	lr
.L71:
	.align	2
.L70:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L76
	ldr	r4, .L76+4
	ldr	r2, .L76+8
	ldr	r1, .L76+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L76+16
	ldr	r1, .L76+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1440
	ldr	r2, .L76+24
	ldr	r1, .L76+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L76+32
	ldr	r1, .L76+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L76+40
	ldr	r1, .L76+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L76+48
	ldr	r1, .L76+52
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L76+56
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L76+60
.L73:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L73
	ldmfd	sp!, {r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	11760
	.word	DMANow
	.word	100679680
	.word	background2Tiles
	.word	100722688
	.word	background2Map
	.word	100696064
	.word	bgCloudTiles
	.word	100714496
	.word	bgCloudMap
	.word	83886592
	.word	spritesheetsssPal
	.word	100728832
	.word	spritesheetsssTiles
	.word	updateScreenLocation
	.word	shadowOAM
	.size	initGame, .-initGame
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	ip, #5632
	mov	r1, #2
	str	lr, [sp, #-4]!
	ldr	r0, .L80
	ldr	lr, .L80+4
	ldr	r2, .L80+8
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2]
	b	initGame
.L81:
	.align	2
.L80:
	.word	22792
	.word	23812
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L96
	ldr	r2, [r4]
	add	r2, r2, #1
	str	r2, [r4]
	ldr	r2, .L96+4
.L83:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L83
	ldr	r5, .L96+8
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L84
	ldr	r2, .L96+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L94
.L84:
	tst	r3, #8
	beq	.L82
	ldr	r3, .L96+12
	ldrh	r3, [r3]
	ands	r5, r3, #8
	beq	.L95
.L82:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L95:
	ldr	r0, [r4]
	ldr	r3, .L96+16
	mov	r4, #1
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	ip, #5632
	mov	r1, #2
	ldr	r3, .L96+20
	ldr	lr, .L96+24
	ldr	r0, .L96+28
	str	r4, [r3]
	ldr	r3, .L96+32
	strh	lr, [r2, #10]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	str	r1, [r3]
	bl	initGame
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L96+40
	ldr	r1, .L96+44
	ldr	r0, .L96+48
	ldr	r4, .L96+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r4, .L96+56
	ldr	r2, .L96+40
	ldr	r1, .L96+60
	ldr	r0, .L96+64
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L94:
	bl	goToInstruction
	ldrh	r3, [r5]
	b	.L84
.L97:
	.align	2
.L96:
	.word	seed
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	roundNumber
	.word	23812
	.word	22792
	.word	state
	.word	stopSound
	.word	11025
	.word	436032
	.word	GameSong
	.word	playSoundA
	.word	playSoundB
	.word	8749
	.word	HitSound
	.size	start, .-start
	.align	2
	.global	instruction
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L112
.L99:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L99
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L112+4
	ldr	r3, .L112+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L100
	ldr	r2, .L112+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L110
.L100:
	tst	r3, #4
	beq	.L98
	ldr	r3, .L112+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L111
.L98:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L111:
	bl	goToStart
	ldr	r4, .L112+16
	mov	r3, #1
	ldr	r2, .L112+20
	ldr	r1, .L112+24
	ldr	r0, .L112+28
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L110:
	mov	r3, #67108864
	mov	ip, #5632
	mov	r1, #2
	ldr	lr, .L112+32
	ldr	r0, .L112+36
	ldr	r2, .L112+40
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r5, .L112+16
	str	r1, [r2]
	bl	initGame
	mov	r3, #1
	ldr	r2, .L112+20
	ldr	r1, .L112+44
	ldr	r0, .L112+48
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L100
.L113:
	.align	2
.L112:
	.word	shadowOAM
	.word	oldButtons
	.word	stopSoundB
	.word	buttons
	.word	playSoundA
	.word	11025
	.word	507456
	.word	TitleSong
	.word	23812
	.word	22792
	.word	state
	.word	436032
	.word	GameSong
	.size	instruction, .-instruction
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L126
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L115
	ldr	r2, .L126+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L124
.L115:
	tst	r3, #4
	beq	.L114
	ldr	r3, .L126+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L125
.L114:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L125:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L124:
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	ip, #5632
	mov	r1, #2
	ldr	lr, .L126+12
	ldr	r0, .L126+16
	ldr	r2, .L126+20
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	str	r1, [r2]
	bl	initGame
	ldrh	r3, [r4]
	b	.L115
.L127:
	.align	2
.L126:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	23812
	.word	22792
	.word	state
	.size	pause, .-pause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r3, .L151
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+8
	ldr	r0, .L151+12
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #512
	ldr	fp, .L151+16
.L129:
	strh	r1, [fp, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L129
	ldr	r3, .L151+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+24
	mov	lr, pc
	bx	r3
	mov	r10, #512
	ldr	r4, .L151+28
	ldr	r9, .L151+32
	ldr	r8, .L151+36
	ldr	r7, .L151+40
	ldr	r6, .L151+44
	ldr	r5, .L151+48
.L140:
	ldrh	r2, [r4]
	strh	r2, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r1, [r5, #48]
	strh	r1, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L130
.L132:
	.word	.L131
	.word	.L133
	.word	.L134
	.word	.L135
	.word	.L136
	.word	.L137
.L137:
	tst	r2, #8
	bne	.L150
.L130:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L140
.L136:
	tst	r2, #8
	beq	.L130
	ldr	r3, .L151+52
	mov	lr, pc
	bx	r3
	b	.L130
.L135:
	ldr	r3, .L151+56
	mov	lr, pc
	bx	r3
	b	.L130
.L134:
	ldr	r3, .L151+60
	mov	lr, pc
	bx	r3
	b	.L130
.L131:
	ldr	r3, .L151+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+68
	mov	lr, pc
	bx	r3
	mov	r3, #0
.L138:
	strh	r10, [fp, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L138
	b	.L130
.L133:
	ldr	r3, .L151+72
	mov	lr, pc
	bx	r3
	b	.L130
.L150:
	ldr	r3, .L151+76
	mov	lr, pc
	bx	r3
	b	.L130
.L152:
	.align	2
.L151:
	.word	setupSounds
	.word	setupInterrupts
	.word	loadPalette
	.word	background2Pal
	.word	shadowOAM
	.word	init
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	update
	.word	waitForVBlank
	.word	67109120
	.word	win.part.0
	.word	pause
	.word	game
	.word	start
	.word	stopSoundB
	.word	instruction
	.word	lose.part.1
	.size	main, .-main
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	roundNumber,4,4
	.comm	enemyAniState,4,4
	.comm	enemy,64,4
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	playerHealthBar,4,4
	.comm	enemyHealthBar,4,4
	.comm	isRoundOver,4,4
	.comm	numPlayerWin,4,4
	.comm	numEnemyWin,4,4
	.comm	timer2,4,4
	.comm	timer,4,4
	.comm	hOffCloud,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"HIT SELECT TO MENU\000"
	.space	1
.LC1:
	.ascii	"PAUSE\000"
	.ident	"GCC: (devkitARM release 45) 5.3.0"
