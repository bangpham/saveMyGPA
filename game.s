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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #80
	mov	r6, #120
	mov	r5, #100
	mov	r4, #140
	mov	lr, #10
	mov	r0, #32
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L3
	str	r7, [r3, #4]
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #60]
	str	r2, [r3]
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	r2, [r3, #40]
	str	r2, [r3, #68]
	str	ip, [r3, #64]
	str	r0, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r3, #56]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r2, #0
	mov	r0, #32
	mov	r4, #100
	mov	lr, #340
	mov	r1, #3
	mov	ip, #10
	ldr	r3, .L7
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	r2, [r3, #36]
	str	r1, [r3, #48]
	str	r1, [r3, #60]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	enemy
	.size	initEnemy, .-initEnemy
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L15
	ldr	r3, [r2, #68]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L14
	ldr	r3, [r2, #8]
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	ldr	lr, [r2, #52]
	ldr	r1, [r2, #40]
	ldr	r0, .L15+4
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	add	r2, r1, lr, lsl #5
	mov	r2, r2, asl #2
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L14:
	ldr	r1, [r2, #8]
	ldr	lr, [r2, #52]
	ldr	r3, [r2, #40]
	mov	r1, r1, asl #23
	ldr	ip, .L15+8
	ldr	r0, .L15+4
	add	r3, r3, lr, lsl #5
	mov	r1, r1, lsr #23
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	orr	ip, r1, ip
	mov	r3, r3, asl #2
	strh	ip, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	shadowOAM
	.word	-28672
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldr	r3, [r3, #68]
	cmp	r3, #1
	beq	.L22
	ldr	r1, .L23+4
	ldr	r3, [r1, #4]
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #48]
	ldr	r2, [r1, #36]
	ldr	r0, .L23+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	mov	r2, r2, asl #2
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	bx	lr
.L22:
	ldr	r1, .L23+4
	ldr	r2, [r1, #4]
	str	lr, [sp, #-4]!
	ldr	r3, [r1, #36]
	ldr	lr, [r1, #48]
	mov	r2, r2, asl #23
	ldr	ip, .L23+12
	ldr	r0, .L23+8
	add	r3, r3, lr, lsl #5
	mov	r2, r2, lsr #23
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	ip, r2, ip
	mov	r3, r3, asl #2
	strh	ip, [r0, #10]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	enemy
	.word	shadowOAM
	.word	-28672
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawHealth
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	ldr	r1, [r3, #60]
	cmp	r1, #0
	ble	.L30
	mov	r3, #2
	mov	ip, #992
	mov	r0, r3
	ldr	r2, .L36+4
	add	r1, r2, r1, lsl #3
.L29:
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	add	r3, r3, #8
	add	r2, r2, #8
	mov	r3, r3, asl #16
	cmp	r2, r1
	mov	r3, r3, lsr #16
	bne	.L29
.L30:
	ldr	r3, .L36+8
	ldr	r3, [r3, #56]
	cmp	r3, #0
	ble	.L35
	str	lr, [sp, #-4]!
	mov	r2, #230
	mov	lr, #2
	mov	ip, #992
	mov	r0, r3, asl #19
	rsb	r0, r0, #15073280
	ldr	r3, .L36+12
	mov	r0, r0, lsr #16
.L31:
	sub	r1, r2, #8
	mov	r1, r1, asl #16
	strh	r2, [r3, #2]	@ movhi
	mov	r2, r1, lsr #16
	cmp	r0, r2
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	add	r3, r3, #8
	bne	.L31
	ldr	lr, [sp], #4
	bx	lr
.L35:
	bx	lr
.L37:
	.align	2
.L36:
	.word	player
	.word	shadowOAM
	.word	enemy
	.word	shadowOAM+400
	.size	drawHealth, .-drawHealth
	.align	2
	.global	drawAvatar
	.type	drawAvatar, %function
drawAvatar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r1, #10
	mov	r4, #868
	mov	ip, #864
	ldr	r3, .L40
	ldr	lr, .L40+4
	add	r0, r3, #560
	ldr	r5, .L40+8
	add	r2, r3, #640
	strh	lr, [r0, #2]	@ movhi
	add	lr, r3, #564
	add	r3, r3, #644
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [lr]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	shadowOAM
	.word	-32570
	.word	-32758
	.size	drawAvatar, .-drawAvatar
	.align	2
	.global	updateSide
	.type	updateSide, %function
updateSide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L56
	ldr	r2, .L56+4
	ldr	r0, [r3, #8]
	ldr	r1, [r2, #4]
	cmp	r0, r1
	stmfd	sp!, {r4, lr}
	ldr	r1, [r3, #12]
	bge	.L43
	cmp	r1, #100
	beq	.L55
.L42:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	cmp	r1, #100
	bne	.L42
	ldr	r0, [r3, #16]
	cmp	r0, #420
	movge	lr, #0
	movlt	lr, #1
	mov	ip, #1
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #24]
	add	r2, r1, r2
	rsb	r2, r2, r0
	ands	r2, lr, r2, lsr #31
	addne	r0, r0, #2
	str	ip, [r3, #68]
	strne	r0, [r3, #16]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	ldr	ip, [r3, #16]
	cmp	ip, #65
	movle	r4, #0
	movgt	r4, #1
	mov	lr, #0
	ldr	r0, [r3, #28]
	ldr	r1, [r2, #12]
	add	r2, ip, r0
	rsb	r2, r2, r1
	ands	r2, r4, r2, lsr #31
	subne	ip, ip, #2
	str	lr, [r3, #68]
	strne	ip, [r3, #16]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.word	enemy
	.size	updateSide, .-updateSide
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	bl	updateSide
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L59
	ldr	r3, .L96
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L60
	ldr	r4, .L96+4
.L61:
	ldr	r3, .L96
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L68
	ldr	r3, .L96+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L69
.L72:
	ldr	r3, [r4, #8]
	cmp	r3, #49
	bgt	.L71
	ldr	r1, .L96+12
	ldr	r2, [r1]
	cmp	r2, #0
	subgt	r2, r2, #2
	strgt	r2, [r1]
.L71:
	ldr	r2, [r4, #16]
	cmp	r2, #65
	ldr	r1, .L96+4
	bgt	.L93
.L68:
	ldr	r3, [r4, #12]
	cmp	r3, #99
	movgt	r1, #0
	ldr	r2, .L96+4
	ldrle	r1, [r2]
	addle	r1, r1, #2
	str	r1, [r2]
	ldr	r2, .L96
	ldrh	r2, [r2, #48]
	tst	r2, #256
	bne	.L77
	cmp	r3, #64
	ldrgt	r3, [r4]
	subgt	r3, r3, #5
	strgt	r3, [r4]
	mov	r3, #4
	str	r3, [r4, #40]
	bl	updateSide
	ldr	r3, [r4, #12]
.L77:
	ldr	r2, [r4]
	add	r3, r3, r2
	ldr	r2, .L96+4
	cmp	r3, #100
	strle	r3, [r2, #12]
	bgt	.L94
.L59:
	ldmfd	sp!, {r4, lr}
	b	drawPlayer
.L60:
	ldr	r2, .L96+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L62
	ldr	r2, .L96+16
	ldrh	r2, [r2]
	tst	r2, #1
	ldreqh	r3, [r3, #48]
	ldreq	r4, .L96+4
	beq	.L68
.L62:
	ldr	r4, .L96+4
	ldr	r2, [r4, #8]
	cmp	r2, #110
	ble	.L64
	ldr	r1, .L96+12
	ldr	r0, .L96+20
	ldr	r3, [r1]
	cmp	r3, r0
	addle	r3, r3, #2
	strle	r3, [r1]
.L64:
	ldr	r3, [r4, #16]
	cmp	r3, #420
	ldr	r0, .L96+4
	bge	.L61
	ldr	r1, .L96+24
	ldr	r1, [r1, #4]
	sub	r1, r1, #23
	cmp	r2, r1
	blt	.L66
	ldr	r2, [r0, #68]
	cmp	r2, #1
	beq	.L66
	ldr	r2, .L96
	ldrh	r2, [r2, #48]
	tst	r2, #256
	bne	.L61
.L66:
	add	r3, r3, #3
	str	r3, [r4, #16]
	b	.L61
.L94:
	mov	r3, #100
	str	r3, [r2, #12]
	bl	updateSide
	ldmfd	sp!, {r4, lr}
	b	drawPlayer
.L93:
	ldr	r0, .L96+24
	ldr	r0, [r0, #4]
	sub	r3, r3, #25
	cmp	r0, r3
	blt	.L74
	ldr	r3, [r1, #68]
	cmp	r3, #0
	bne	.L95
.L74:
	sub	r2, r2, #3
	str	r2, [r4, #16]
	b	.L68
.L69:
	ldr	r3, .L96+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L72
	b	.L68
.L95:
	ldr	r3, .L96
	ldrh	r3, [r3, #48]
	tst	r3, #256
	bne	.L68
	b	.L74
.L97:
	.align	2
.L96:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	269
	.word	enemy
	.size	updatePlayer, .-updatePlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L148
	ldr	r3, [ip]
	ldr	r2, .L148+4
	add	r3, r3, #1
	stmfd	sp!, {r4, r5, r6, lr}
	smull	lr, r1, r2, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, asl #1
	mov	r4, r0
	str	r3, [ip]
	beq	.L146
.L99:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L100
	ldr	r3, .L148+8
	ldr	r3, [r3]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L100
.L103:
	.word	.L102
	.word	.L104
	.word	.L105
	.word	.L106
	.word	.L107
.L102:
	ldr	r3, .L148+12
	ldrh	r3, [r3, #48]
	tst	r3, #512
	movne	r1, #4
	bne	.L143
.L100:
	ldr	r2, .L148+16
	ldr	r3, .L148+20
	ldr	ip, [r2, #68]
	ldr	r0, [r2, #16]
	ldr	r5, [r3, #12]
.L108:
	cmp	ip, #0
	beq	.L122
	cmp	ip, #1
	bne	.L117
.L123:
	rsb	r1, r5, r0
	cmp	r1, #160
	movgt	r1, #1
	addgt	r5, r5, #2
	strgt	r5, [r3, #12]
	strgt	r1, [r3, #36]
.L117:
	mov	lr, #67108864
	ldr	r1, .L148+24
	ldr	r1, [r1]
	mov	ip, r1, asl #16
	mov	ip, ip, lsr #16
	strh	ip, [lr, #20]	@ movhi
	ldr	ip, .L148+28
	ldr	lr, [r2, #12]
	ldr	r4, [ip]
	ldr	ip, [r3, #8]
	rsb	lr, r4, lr
	rsb	r0, r1, r0
	rsb	ip, r4, ip
	rsb	r1, r1, r5
	str	lr, [r2, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r0, [r2, #8]
	str	r1, [r3, #4]
	str	ip, [r3]
	b	drawEnemy
.L107:
	mov	r0, #2
	ldr	r2, .L148+16
	ldr	r1, [r2, #68]
	ldr	r3, .L148+20
	cmp	r1, #1
	str	r0, [r3, #36]
	beq	.L147
	cmp	r1, #0
	bne	.L144
	ldr	r5, [r3, #12]
	cmp	r5, #250
	subgt	r5, r5, #2
	strgt	r5, [r3, #12]
	ldr	r0, [r2, #16]
.L122:
	rsb	r1, r0, r5
	cmp	r1, #160
	movgt	r1, #1
	subgt	r5, r5, #2
	strgt	r5, [r3, #12]
	strgt	r1, [r3, #36]
	b	.L117
.L146:
	ldr	r5, .L148+32
	ldr	r3, [r5]
	ldr	r2, .L148+36
	add	r3, r3, #1
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	ldr	r1, [r5]
	ldr	r3, .L148+40
	smull	ip, r2, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #1
	sub	r1, r1, r3, asl #2
	ldr	r3, .L148+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L148+8
	str	r1, [r3]
	b	.L99
.L106:
	mov	r1, #0
.L143:
	ldr	r3, .L148+20
	ldr	r2, .L148+16
	str	r1, [r3, #36]
	ldr	r5, [r3, #12]
	ldr	ip, [r2, #68]
	ldr	r0, [r2, #16]
	b	.L108
.L104:
	mov	r1, #1
	ldr	r2, .L148+16
	ldr	ip, [r2, #68]
	ldr	r3, .L148+20
	cmp	ip, #0
	str	r1, [r3, #36]
	bne	.L109
	ldr	r1, [r2, #28]
	ldr	r0, [r2, #16]
	ldr	r5, [r3, #12]
	sub	r1, r1, #5
	add	r1, r1, r0
	cmp	r5, r1
	ldr	r1, .L148+48
	ldr	r1, [r1]
	subgt	r5, r5, #2
	strgt	r5, [r3, #12]
	cmp	r1, #1
	ble	.L122
	ldr	r1, .L148+12
	ldrh	r1, [r1, #48]
	tst	r1, #512
	beq	.L122
.L125:
	ldr	r1, .L148+52
	ldrh	r1, [r1]
	tst	r1, #512
	beq	.L113
	ldr	r1, .L148+56
	ldrh	r1, [r1]
	tst	r1, #512
	beq	.L108
.L113:
	ldr	r1, [r2, #28]
	add	r1, r0, r1
	rsb	r1, r1, r5
	cmp	r1, #0
	movlt	r1, #3
	strlt	r1, [r3, #36]
	b	.L108
.L105:
	ldr	r3, .L148+12
	ldrh	r3, [r3, #48]
	tst	r3, #512
	movne	r1, #3
	bne	.L143
	b	.L100
.L109:
	cmp	ip, #1
	bne	.L111
	ldr	r1, [r3, #24]
	ldr	r5, [r3, #12]
	sub	r1, r1, #5
	ldr	r0, [r2, #16]
	add	r1, r1, r5
	cmp	r0, r1
	ldr	r1, .L148+48
	ldr	r1, [r1]
	addgt	r5, r5, #2
	strgt	r5, [r3, #12]
	cmp	r1, #1
	ble	.L123
	ldr	r1, .L148+12
	ldrh	r1, [r1, #48]
	tst	r1, #512
	bne	.L125
	b	.L123
.L144:
	ldr	r0, [r2, #16]
	ldr	r5, [r3, #12]
	b	.L117
.L147:
	ldr	r5, [r3, #12]
	cmp	r5, #249
	addle	r5, r5, r0
	strle	r5, [r3, #12]
	ldr	r0, [r2, #16]
	b	.L123
.L111:
	ldr	r1, .L148+48
	ldr	r1, [r1]
	cmp	r1, #1
	ble	.L144
	ldr	r1, .L148+12
	ldrh	r1, [r1, #48]
	tst	r1, #512
	ldr	r0, [r2, #16]
	ldr	r5, [r3, #12]
	beq	.L117
	b	.L125
.L149:
	.align	2
.L148:
	.word	timer2
	.word	1717986919
	.word	enemyAniState
	.word	67109120
	.word	player
	.word	enemy
	.word	hOff
	.word	vOff
	.word	timer
	.word	rand
	.word	715827883
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	spriteAniStateUpdate
	.type	spriteAniStateUpdate, %function
spriteAniStateUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L193
	ldr	r3, .L193+4
	ldr	r5, [r4, #36]
	smull	r2, r3, r5, r3
	mov	r2, r5, asr #31
	add	r3, r3, r5
	rsb	r3, r2, r3, asr #2
	rsb	r3, r3, r3, lsl #3
	ldr	r2, [r4, #40]
	cmp	r5, r3
	str	r2, [r4, #44]
	str	r1, [r4, #40]
	beq	.L189
	ldr	r6, .L193+8
.L151:
	ldr	r3, .L193+12
	ldrh	r3, [r3]
	ands	r0, r3, #1
	beq	.L152
	ldr	r2, .L193+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L152
	ldr	r2, .L193+20
	ldrh	r2, [r2, #48]
	tst	r2, #2
	bne	.L153
.L152:
	ldr	r2, .L193+20
	ldrh	r1, [r2, #48]
	tst	r1, #1
	bne	.L154
	ldrh	r2, [r2, #48]
	tst	r2, #2
	beq	.L154
.L153:
	mov	r1, #3
	mov	r2, #0
	str	r1, [r4, #40]
	str	r2, [r4, #52]
.L154:
	ldr	r2, .L193+20
	ldrh	r1, [r2, #48]
	tst	r1, #32
	bne	.L155
	cmp	r0, #0
	bne	.L192
.L156:
	mov	r2, #2
	str	r2, [r4, #40]
.L155:
	ldr	r2, .L193+20
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L159
	cmp	r0, #0
	bne	.L160
.L161:
	mov	r2, #1
	str	r2, [r4, #40]
.L159:
	ldr	r2, .L193+20
	ldrh	r2, [r2, #48]
	tst	r2, #2
	beq	.L163
	tst	r3, #2
	beq	.L164
	ldr	r3, .L193+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L164
.L163:
	mov	r3, #4
	str	r3, [r4, #40]
.L165:
	mov	r3, #0
	ldr	r4, .L193+24
	ldr	r2, [r4, #36]
	ldr	r5, [r4, #32]
	ldr	r1, [r4, #60]
	mov	r0, r5
	str	r2, [r4, #40]
	str	r3, [r4, #36]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	addne	r5, r5, #1
	bne	.L167
	ldr	r3, [r4, #48]
	cmp	r3, #5
	movne	r5, #1
	moveq	r3, #3
	moveq	r5, #1
	addne	r3, r3, r5
	str	r3, [r4, #48]
.L167:
	str	r5, [r4, #32]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L189:
	ldr	r0, [r4, #52]
	ldr	r6, .L193+8
	add	r0, r0, #1
	ldr	r1, [r4, #64]
	mov	lr, pc
	bx	r6
	str	r1, [r4, #52]
	b	.L151
.L164:
	add	r5, r5, #1
	str	r5, [r4, #36]
	b	.L165
.L192:
	ldr	r1, .L193+16
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L156
	ldrh	r1, [r2, #48]
	tst	r1, #1
	bne	.L156
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L159
.L169:
	ldr	r2, .L193+20
	ldrh	r2, [r2, #48]
	tst	r2, #1
	bne	.L161
	b	.L159
.L160:
	ldr	r2, .L193+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L161
	b	.L169
.L194:
	.align	2
.L193:
	.word	player
	.word	-1840700269
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	enemy
	.size	spriteAniStateUpdate, .-spriteAniStateUpdate
	.align	2
	.global	updateScreenLocation
	.type	updateScreenLocation, %function
updateScreenLocation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L197
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, [r3]
	mov	r3, r4, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #20]	@ movhi
	ldr	r1, .L197+4
	ldr	r2, .L197+8
	ldr	r3, .L197+12
	ldr	r5, [r1]
	ldr	lr, [r2, #12]
	ldr	ip, [r3, #8]
	ldr	r0, [r2, #16]
	ldr	r1, [r3, #12]
	rsb	lr, r5, lr
	rsb	ip, r5, ip
	rsb	r0, r4, r0
	rsb	r1, r4, r1
	str	lr, [r2, #4]
	str	ip, [r3]
	str	r0, [r2, #8]
	str	r1, [r3, #4]
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	hOff
	.word	vOff
	.word	player
	.word	enemy
	.size	updateScreenLocation, .-updateScreenLocation
	.align	2
	.global	checkWinLose
	.type	checkWinLose, %function
checkWinLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L219
	ldr	r3, [r2, #60]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	beq	.L200
	ldr	r0, .L219+4
	ldr	r1, [r0, #56]
	cmp	r1, #0
	bne	.L216
	mov	r4, #1
	ldr	ip, .L219+8
	ldr	r3, [ip]
	ldr	lr, .L219+12
	add	r3, r3, r4
	str	r1, [r2, #56]
	str	r1, [r0, #52]
	str	r3, [ip]
	str	r4, [lr]
	b	.L203
.L200:
	mov	r5, #1
	ldr	r0, .L219+16
	ldr	r1, [r0]
	ldr	r4, .L219+12
	ldr	lr, .L219+4
	ldr	ip, .L219+8
	add	r1, r1, r5
	str	r3, [r2, #56]
	str	r3, [lr, #52]
	str	r1, [r0]
	str	r5, [r4]
	ldr	r3, [ip]
.L203:
	cmp	r3, #3
	beq	.L217
	ldr	r3, .L219+16
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L218
.L205:
	ldr	r2, .L219+20
	ldr	r3, [r2]
	cmp	r3, #2
	beq	.L207
	cmp	r3, #3
	beq	.L208
	cmp	r3, #1
	moveq	r1, #2
	ldreq	r3, .L219+24
	streq	r1, [r2]
	moveq	lr, pc
	bxeq	r3
.L199:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L216:
	ldr	r3, .L219+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L199
	ldr	r3, .L219+8
	ldr	r3, [r3]
	b	.L203
.L207:
	mov	r1, #3
	ldr	r3, .L219+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L218:
	ldr	r3, .L219+28
	mov	lr, pc
	bx	r3
	b	.L205
.L208:
	ldr	r3, .L219+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L217:
	ldr	r3, .L219+32
	mov	lr, pc
	bx	r3
	b	.L205
.L220:
	.align	2
.L219:
	.word	player
	.word	enemy
	.word	numPlayerWin
	.word	isRoundOver
	.word	numEnemyWin
	.word	.LANCHOR0
	.word	init
	.word	goToLose
	.word	goToWin
	.size	checkWinLose, .-checkWinLose
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L222
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L223:
	.align	2
.L222:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L226+8
	ldr	r2, [r2]
	ldr	r7, .L226+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r5, [r2, #20]
	mov	r1, r0
	ldr	r2, .L226+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L226+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #2]	@ movhi
	mov	r1, r6
	ldr	r3, .L226+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L226+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r9
	ldr	r7, .L226+32
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L226+36
	adr	r3, .L226
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L226+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L226+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L227:
	.align	3
.L226:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L230+8
	ldr	r2, [r2]
	ldr	r7, .L230+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r5, [r2, #32]
	mov	r1, r0
	ldr	r2, .L230+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L230+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #6]	@ movhi
	mov	r1, r6
	ldr	r3, .L230+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L230+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r9
	ldr	r7, .L230+32
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L230+36
	adr	r3, .L230
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L230+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L230+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L231:
	.align	3
.L230:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	playerHitEnemy
	.type	playerHitEnemy, %function
playerHitEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r5, .L246
	ldr	r3, [r5, #40]
	cmp	r3, #3
	sub	sp, sp, #20
	beq	.L244
.L232:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L244:
	ldr	r6, .L246+4
	ldr	r3, [r6, #36]
	cmp	r3, #4
	beq	.L232
	mov	ip, r1
	ldr	lr, [ip, #28]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	mov	r4, r0
	add	r0, r0, #8
	ldr	r7, [ip, #32]
	ldmia	r0, {r0, r1}
	str	lr, [sp, #12]
	add	ip, ip, #12
	ldmia	ip, {ip, lr}
	str	r7, [sp, #8]
	stmia	sp, {ip, lr}
	ldr	r7, .L246+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L232
	mov	r3, #0
	ldr	r2, .L246+12
	ldr	r1, .L246+16
	ldr	r0, .L246+20
	bl	playSoundB
	mov	ip, #512
	mov	lr, #4
	ldr	r1, .L246+24
	ldr	r3, [r1]
	ldr	r0, [r5, #68]
	ldr	r2, [r4, #56]
	sub	r5, r3, #1
	str	r5, [r1]
	ldr	r1, .L246+28
	mov	r3, r3, asl #3
	sub	r2, r2, #1
	cmp	r0, #0
	str	r2, [r4, #56]
	str	lr, [r6, #36]
	strh	ip, [r1, r3]	@ movhi
	beq	.L245
	cmp	r0, #1
	bne	.L232
	ldr	r3, [r6, #12]
	cmp	r3, #50
	subgt	r3, r3, #35
	strgt	r3, [r6, #12]
	b	.L232
.L245:
	ldr	r3, [r6, #12]
	cmp	r3, #400
	addlt	r3, r3, #35
	strlt	r3, [r6, #12]
	b	.L232
.L247:
	.align	2
.L246:
	.word	player
	.word	enemy
	.word	collision
	.word	11025
	.word	8749
	.word	HitSound
	.word	enemyHealthBar
	.word	shadowOAM
	.size	playerHitEnemy, .-playerHitEnemy
	.align	2
	.global	enemyHitPlayer
	.type	enemyHitPlayer, %function
enemyHitPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L266
	ldr	r3, [r4, #36]
	cmp	r3, #3
	sub	sp, sp, #20
	beq	.L265
.L248:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L265:
	ldr	r6, .L266+4
	ldr	r3, [r6, #40]
	cmp	r3, #4
	beq	.L248
	ldr	r3, [r6, #12]
	cmp	r3, #100
	bne	.L248
	mov	r5, r1
	ldr	lr, [r5, #28]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	add	r0, r0, #8
	ldr	ip, [r5, #32]
	ldmia	r0, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #16]
	str	ip, [sp, #8]
	ldr	ip, [r5, #12]
	ldr	r7, .L266+8
	stmia	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L248
	mov	r3, #0
	ldr	r2, .L266+12
	ldr	r1, .L266+16
	ldr	r0, .L266+20
	bl	playSoundB
	mov	r0, #512
	ldr	r1, .L266+24
	ldr	r3, [r1]
	ldr	r2, [r5, #60]
	sub	ip, r3, #1
	ldr	lr, [r6, #8]
	str	ip, [r1]
	ldr	r1, .L266+28
	mov	r3, r3, asl #3
	sub	r2, r2, #1
	cmp	lr, #49
	str	r2, [r5, #60]
	strh	r0, [r1, r3]	@ movhi
	bgt	.L252
	ldr	r2, .L266+32
	ldr	r3, [r2]
	cmp	r3, #0
	subgt	r3, r3, #20
	strgt	r3, [r2]
.L252:
	ldr	r3, [r6, #68]
	cmp	r3, #0
	ldr	r2, .L266+4
	bne	.L253
	ldr	r3, [r2, #16]
	cmp	r3, #64
	ldrle	r3, [r4, #12]
	subgt	r3, r3, #20
	addle	r3, r3, #20
	strgt	r3, [r2, #16]
	strle	r3, [r4, #12]
.L257:
	mov	r3, #4
	str	r3, [r6, #40]
	b	.L248
.L253:
	cmp	r3, #1
	bne	.L257
	ldr	r3, [r2, #16]
	cmp	r3, #420
	ldrge	r3, [r4, #12]
	addlt	r3, r3, #20
	subge	r3, r3, #20
	strge	r3, [r4, #12]
	strlt	r3, [r2, #16]
	b	.L257
.L267:
	.align	2
.L266:
	.word	enemy
	.word	player
	.word	collision
	.word	11025
	.word	8749
	.word	HitSound
	.word	playerHealthBar
	.word	shadowOAM
	.word	hOff
	.size	enemyHitPlayer, .-enemyHitPlayer
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L285
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L282
	ldr	r0, .L285+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L271
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L271
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L283
	ldr	r1, .L285+8
	ldr	r2, .L285+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L271:
	ldr	r0, .L285+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L275
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L275
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L284
	ldr	r1, .L285+8
	ldr	r2, .L285+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L275:
	mov	r2, #1
	ldr	r3, .L285
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L285
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L282:
	mov	r2, #1
	ldr	r3, .L285
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L283:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L271
.L284:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L275
.L286:
	.align	2
.L285:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L288
	ldr	r0, .L288+4
	ldr	r1, .L288+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L289:
	.align	2
.L288:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L291
	ldr	ip, .L291+4
	ldr	r0, .L291+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L292:
	.align	2
.L291:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L294
	ldr	ip, .L294+4
	ldr	r1, [r2]
	ldr	r0, .L294+8
	ldr	r2, .L294+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L295:
	.align	2
.L294:
	.word	dma
	.word	soundA
	.word	soundB
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	stopSoundB
	.type	stopSoundB, %function
stopSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L297
	ldr	r1, .L297+4
	ldr	r0, [r2]
	ldr	r2, .L297+8
	str	r3, [r0, #32]
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L298:
	.align	2
.L297:
	.word	dma
	.word	soundB
	.word	67109120
	.size	stopSoundB, .-stopSoundB
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L301
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L301+4
	ldr	ip, .L301+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L302:
	.align	2
.L301:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.global	whichEnemyMovement
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	lifeCount,4,4
	.global	ultimateWin
	.global	roundNumber
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
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	roundNumber, %object
	.size	roundNumber, 4
roundNumber:
	.word	1
	.bss
	.align	2
	.type	whichEnemyMovement, %object
	.size	whichEnemyMovement, 4
whichEnemyMovement:
	.space	4
	.type	ultimateWin, %object
	.size	ultimateWin, 4
ultimateWin:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
