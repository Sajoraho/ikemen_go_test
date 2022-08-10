; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;========================================<STANDING>========================================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper

[State 0, Anim]
type = changeanim
trigger1 = ((var(1) <= 1) && anim != 0) || (var(1) = 2 && anim != 1) || (var(1) = 3 && anim != 2)
trigger1 = anim != 5
trigger2 = anim = 5 && !animtime
value = ifelse(var(1) = 3, 2, ifelse(var(1) = 2, 1, 0))

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050


;========================================<CROUCHING>========================================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 10, Anim]
type = changeanim
trigger1 = !time && anim = 12
value = 10
elem = 3 -animelemno(0)

[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = selfstate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 11, Anim]
type = changeanim
trigger1 = anim = 6 && !animtime
value = 11


[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 12, Anim]
type = changeanim
trigger1 = !time && anim = 10
value = 12
elem = 3 -animelemno(0)

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;==============================<WALKING>==============================
[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x) * ifelse(var(1) != 1, 1.10, 1.0)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x) * ifelse(var(1) != 1, 1.10, 1.0)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21


;=======================================<JUMPING>====================================
[Statedef 40]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = (prevstateno != 100)

[State 40, Keyboard Check]
type = changestate
trigger1 = !time
trigger1 = !AIlevel
trigger1 = prevstateno = 52
trigger1 = command = "holddown" && command = "holdup" 
value = 10
ctrl = 1

[State 40, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 40, Direction]
type = varset
trigger1 = !AIlevel
trigger1 = time >= 1
trigger1 = command = "holdfwd" || command = "holdback"
sysvar(1) = (command = "holdfwd") - (command = "holdback")
persistent = 0

[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, High Jump]
type = varset
trigger1 = !time
var(3) = 0

[State 40, High Jump]
type = varset
trigger1 = !time && !AIlevel
trigger1 = map(cmd_highjump)
var(3) = 3

[State 40, High Jump]
type = varset
trigger1 = !time && AIlevel
trigger1 = map(p2bodydistx) >= 160 || random < 125
var(3) = 3

[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
var(3) = 3
[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
sysvar(1) = 1

[State 40, Low Jump]
type = varset
trigger1 = !AIlevel && command != "holdup" && (var(3) != [1, 2])
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)
[State 40, Low Jump]
type = varset
trigger1 = AIlevel && (var(3) != [1, 2])
trigger1 = (enemynear, statetype = C) && random < 500
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = 0, ifelse((var(3) = [2, 3]), 41, 40)

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Short]
type = velset
trigger1 = !animtime && var(3) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.76 * const(velocity.jump.y)

[State 40, Vel Medium]
type = velset
trigger1 = !animtime && var(3) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.76 * const(velocity.jump.y)

[State 40, Vel Long]
type = velset
trigger1 = !animtime && var(3) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = selfstate
trigger1 = !animtime
value = 50
ctrl = 1


[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x, 41, ifelse(vel x > 0, 42, 43)) + 10 * (var(3) = [1, 2])
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(3) = [1, 2]
flag = noairguard

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
sprpriority = 1

[State 52, Anim 48]
type = changeanim
triggerall = !time
trigger1 = vel y >= (-1.05 * const(velocity.jump.y))
trigger2 = vel x >= (1.25 * const(velocity.jump.fwd.x))
trigger3 = vel x <= (1.25 * const(velocity.jump.back.x))
value = 48

[State 52, Anim 57]
type = changeanim
trigger1 = !time && (var(3) = [1, 2])
trigger1 = (prevstateno = [600, 699])
value = 57

[State 52, Anim 48]
type = changeanim
trigger1 = !time
trigger1 = prevstateno = 645
value = 48

[State 52, Stop]
type = velset
trigger1 = 1
x = 0
y = 0

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Ctrl]
type = ctrlset
trigger1 = !time
trigger1 = prevstateno = 50 || prevstateno = 51 || prevstateno = 703 || (prevstateno = [5000, 5999])
trigger2 = time = 1
trigger2 = anim != 57
value = 1

[State 52, Trip Guard]
type = changestate
trigger1 = var(20) <= 0
trigger1 = ctrl && command = "holdback"
trigger1 = inguarddist && (prevstateno != [260, 699])
value = 120

[State 52, No Walk]
type = assertspecial
trigger1 = anim != 5
flag = nowalk

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========================================<RUN>===============================================
[Statedef 100]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Snd]
type = playsnd
trigger1 = !time
value = 0, 100

[State 100, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Pos]
type = posset
trigger1 = 1
y = 0
[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 3 || animelem = 6)
value = 0, ifelse((animelem = 3), 103, 106)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40
[State 100, Jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = changestate
triggerall = time >= 9
trigger1 = !AIlevel
trigger1 = command != "holdfwd" || command = "holdback"
trigger2 = AIlevel && (p2movetype = A || p2dist x < 80)
trigger3 = p2dist x < -const(size.ground.back)
value = 101


;--- STOP ---
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 0, 101

[State 101, Dust]
type = explod
trigger1 = !time
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40

[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


;============================================<FORWARD DASH>==============================================
[Statedef 102]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = time <= 5
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && map(p2bodydistx) < 120
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = time = 5 && sysvar(1)
value = 100

[State 102, Freeze]
type = changeanim
trigger1 = time <= 1
trigger2 = time < 5
trigger2 = sysvar(1) = 1
value = 102
elem = 1

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = -1.33 * const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 102, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 102, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, End]
type = changestate
trigger1 = !animtime
value = 103


;--- LAND ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 0, 103

[State 103, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;============================================<BACK DASH>==============================================
[Statedef 105]
type = A
movetype = I
physics = S
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, End]
type = changestate
trigger1 = !animtime
value = 106


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Snd]
type = playsnd
trigger1 = !time
value = 0, 106

[State 106, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<GUARD>========================
;--- START ---
[Statedef 120]
type = U
physics = U
anim = 120 + (statetype = C) + (statetype = A) * 2

[State 120, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A

[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0

[State 120, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A)
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 120, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A)
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 120, End]
type = changestate
trigger1 = !animtime
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140

[State 120, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;--- STAND GUARD (Guarding) ---
[Statedef 130]
type = S
physics = S

[State 130, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, AI fix]
type = changestate
trigger1 = AIlevel && numenemy
trigger1 = time >= 120 || enemynear, time >= 60
trigger1 = random < 17
value = 40

[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52

[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
value = 131

[State 130, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140

[State 130, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;--- CROUCH GUARD (Guarding) ---
[Statedef 131]
type = C
physics = C

[State 131, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
value = 130

[State 131, AI fix]
type = changestate
trigger1 = AIlevel && numenemy
trigger1 = time >= 120 || enemynear, time >= 60
trigger1 = random < 17
value = 40

[State 131, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140


;--- AIR GUARD (Guarding) ---
[Statedef 132]
type = A
physics = N

[State 132, Do or do not]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132

[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = (vel y > 0 && (pos y > -vel y))

[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 132, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

;[State 132, Stop guarding was here]


;--- GUARD (End) ---
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A

[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 140, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk

[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51


;--- STAND GUARD HIT (Shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && p2statetype = C))

[State 150, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 150, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S


;--- STAND GUARD HIT 2 (Knocked back) ---
[Statedef 151]
type = S
physics = S
movetype = H
anim = 130

[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 151, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 151, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;--- CROUCH GUARD HIT (Shaking) ---
[Statedef 152]
type = C
physics = N
movetype = H
velset = 0, 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && p2statetype = C))

[State 152, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 152, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S


;--- CROUCH GUARD HIT 2 (Knocked back) ---
[Statedef 153]
type = C
physics = C
movetype = H
anim = 131

[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 153, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 153, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;--- AIR GUARD HIT (Shaking) ---
[Statedef 154]
type = A
physics = N
movetype = H
velset = 0, 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

;--- AIR GUARD HIT 2 (Knocked away) ---
[Statedef 155]
type = A
physics = N
movetype = H
anim = 132

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = (vel y > 0 && (pos y > -vel y))

[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;========================================<PARRY>========================================
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 700, Consecutive Parries]
type = posadd
trigger1 = !time
trigger1 = numhelper(705)
trigger1 = helper(705), var(3)
x = -8

[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 700, No walking]
type = mapset
trigger1 = 1
map = "parrynowalk"
value = 4

[State 700, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 6)
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 700, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 31, -69
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 700, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 701, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 701, No walking]
type = mapset
trigger1 = 1
map = "parrynowalk"
value = 4

[State 701, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 6)
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 701, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 25, -22
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 701, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- JUMPING ---
[Statedef 702]
type = A
physics = N
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 702, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 702, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 702, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 6)
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 702, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 40, -66
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 702, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 702, End]
type = changestate
trigger1 = !animtime
value = 703
ctrl = 1

[Statedef 703]
type = A
physics = N
movetype = I
anim = 703
ctrl = 1
[State 703, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 703, Accel]
type = gravity
trigger1 = 1
[State 703, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;--- HELPER ---
[Statedef 705]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 706, ifelse(root, statetype = A, 707, 705))
velset = 0, 0
ctrl = 0

[State 705, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 705, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "D"
trigger2 = root, AIlevel
trigger2 = (root, statetype != A) && p2statetype = C
value = 706

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "F"
trigger2 = root, AIlevel
trigger2 = anim != 706
value = ifelse((root, statetype = A), 707, 705)

[State 705, Anim]
type = changeanim
trigger1 = anim = 705 || anim = 707
value = ifelse((root, statetype = A), 707, 705)

[State 705, Consecutive Parries]
type = varset
triggerall = !time
trigger1 = root, stateno = [700, 702]
trigger2 = root, map(parrynowalk)
var(3) = 1

[State 705, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 8, 10)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = (root, stateno != [700, 702])
trigger3 = (root, stateno != 5120)
var(0) = 1

[State 705, Disable]
type = varset
triggerall = !var(0)
triggerall = !(root, AIlevel)
trigger1 = root, p2dist x >= 0
trigger1 = root, command = "holdback"
trigger2 = root, p2dist x < 0
trigger2 = root, command = "holdfwd"
trigger3 = time < 5
trigger3 = root, p2dist x >= 0
trigger3 = (root, command = "holdfwd" + root, command = "holddown") > 1
trigger4 = time < 5
trigger4 = root, p2dist x < 0
trigger4 = (root, command = "holdback" + root, command = "holddown") > 1
trigger5 = time >= 5
trigger5 = root, p2dist x >= 0
trigger5 = root, command = "holdfwd" || root, command = "holddown"
trigger6 = time >= 5
trigger6 = root, p2dist x < 0
trigger6 = root, command = "holdback" || root, command = "holddown"
trigger7 = time >= 1
trigger7 = root, p2dist x >= 0
trigger7 = (((anim = 705 || anim = 707) && root, command = "F") || (anim = 706 && root, command = "D"))
trigger8 = time >= 1
trigger8 = root, p2dist x >= 0
trigger8 = (((anim = 705 || anim = 707) && root, command = "F") || (anim = 706 && root, command = "D"))
var(0) = 1

[State 705, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9999

[State 705, Standing / Air]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 705 || anim = 707
trigger1 = (root, stateno != 5120) || !(root, animtime)
reversal.attr = SCA, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Crouching]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 706
reversal.attr = SC, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr =
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 705, End]
type = destroyself
trigger1 = time >= 23
trigger2 = (root, movetype != I)
trigger3 = !(root, ctrl) && (root, stateno != [700, 702]) && (root, stateno != 5120)
trigger4 = (root, stateno = [700, 702]) && (root, time <= 1)


;--- Success ---
[Statedef 706]
movetype = I
ctrl = 0

[State 706, Disable]
type = varset
trigger1 = 1
var(0) = 1

[State 706, End]
type = destroyself
trigger1 = root, stateno = [700, 702]
trigger2 = time >= 2


;==============================<DODGE>==============================
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 0, 7)
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 4
channel = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0

[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 220, 240)

[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 220, 240)

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<FORWARD ROLL>==============================
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 720, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 0, 6)
channel = 0

[State 720, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 2)
channel = 0

[State 720, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 5.34

[State 720, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 720, Push]
type = playerpush
trigger1 = 1
value = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<BACK ROLL>==============================
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 725, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 0, 6)
channel = 0

[State 725, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 2)
channel = 0

[State 725, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 2
x = -4.01

[State 725, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 725, Push]
type = playerpush
trigger1 = 1
value = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<POWER CHARGE>==============================
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
trigger1 = 1
value = 2 + ifelse(time < 60, 0, (time -60) / 12)

[State 740, Snd]
type = playsnd
trigger1 = time = 8
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 6, 5)
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(7241)
helpertype = normal
stateno = 7241
ID = 7241
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, End]
type = changestate
triggerall = time >= 8
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel && (command != "/b" || command != "/y")
trigger3 = AIlevel && (inguarddist || map(p2bodydistx) <= 120)
value = 741 + 0 * (var(58) := 5)


;--- END ---
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 1

[State 741, Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 741, Snd]
type = playsnd
trigger1 = !time && power >= const(data.power)
value = ifelse(var(1) = 2, 14, 4), 10 -(var(1) = 2)
channel = 0

[State 741, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<ZERO COUNTER>==============================
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "counter_p"), 1, 2)
ignorehitpause = 1

[State 750, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 1, ifelse((p2statetype = C), 2, ifelse(random < 500, 1, 2)))
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 13, 3), 7 -(var(1) = 2) * 4
channel = 0

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 16, -79
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 15
movetime = 15
anim = -1
sound = s7, 1
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = 0

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 752, 754)


;============================================<PUNCH ZERO COUNTER>=================================================
[Statedef 752]
type = S
physics = N
movetype = A
anim = 752
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 752, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 752, Snd]
type = playsnd
trigger1 = animelem = 2 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 752, Snd]
type = playsnd
trigger1 = animelem = 2 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 752, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 752, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 65), var(37) := -63
envshake.time = 10
envshake.ampl = 2
envshake.freq = 180
kill = 0

[State 752, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 752, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;============================================<KICK ZERO COUNTER>=================================================
[Statedef 754]
type = C
physics = N
movetype = A
anim = 754
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 754, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 754, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 754, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 754, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 754, Hit]
type = hitdef
trigger1 = animelem = 5
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 35) * (var(36) := 76), var(37) := -6
envshake.time = 10
envshake.ampl = 2
envshake.freq = 180
kill = 0

[State 754, Spr]
type = sprpriority
trigger1 = animelem = 6
value = -1

[State 754, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 754, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;========================================<CUSTOM COMBO>========================================
;--- GROUND ---
[Statedef 760]
type = S
physics = S
movetype = A
anim = ifelse(var(1) = 2, 761, 760)
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 760, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 760, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 760, Var]
type = varset
trigger1 = time >= 4
var(20) = 300

[State 760, Snd]
type = playsnd
trigger1 = time = 4
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 9, 10)
channel = 0

[State 760, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = ifelse(anim = 760, -3, -4), ifelse(anim = 760, -64, -56)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 760, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = 0

[State 760, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- AIR ---
[Statedef 765]
type = A
physics = N
movetype = A
anim = 765
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 765, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 765, Var]
type = varset
trigger1 = time >= 4
var(20) = 240

[State 765, Snd]
type = playsnd
trigger1 = time = 4
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 9, 10)
channel = 0

[State 765, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = -2, -85
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 765, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = 0

[State 765, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 765, End]
type = changestate
trigger1 = !animtime
value = 766
ctrl = 1

[State 765, Stop]
type = posfreeze
trigger1 = 1
value = 1


[Statedef 766]
type = A
physics = N
movetype = I
anim = 766
ctrl = 1

[State 766, Accel]
type = gravity
trigger1 = 1

[State 766, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;====================<CHEAP K.O.>====================
[Statedef 5950]
type = S
movetype = H
physics = S
anim = 5950
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0
[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 11, ifelse((var(1) = 2), 4, 3)

[State 5950, Pos]
type = posadd
trigger1 = animelem = 6
x = ceil(-10 * const(size.xscale))

[State 5981, Snd]
type = playsnd
trigger1 = animelem = 6
value = F7, 0

[State 5981, FX]
type = explod
trigger1 = animelem = 6
anim = F60
postype = p1
pos = 0, 0
sprpriority = -3

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==============================<TAUNT>==============================
[Statedef 195]
type = S
ctrl = 0
velset = 0, 0
physics = S

[State 195, taunt]
type = changestate
triggerall = !time
trigger1 = var(1) = 2
trigger2 = var(1) = 3 && command = "holddown"
value = 199

[State 195, taunt]
type = changeanim
trigger1 = !time
value = ifelse(command = "holddown", 198, ifelse(command = "holdfwd", 195, ifelse(command = "holdback", 197, 196)))

[State 195, Snd]
type = playsnd
trigger1 = anim = 195 && animelem = 2
trigger2 = anim = 196 && animelem = 2
trigger3 = anim = 197 && animelem = 4
trigger4 = anim = 198 && animelem = 4
value = 4, ifelse(random < 250, 8, ifelse(random < 333, 9, ifelse(random < 500, 10, 11)))
channel = 0

[State 195, Snd]
type = playsnd
trigger1 = anim = 198
trigger1 = animelem = 3 || animelem = 7
value = 1, 1
channel = 1
volumescale = 67

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<EVIL TAUNT>==============================
[Statedef 199]
type = S
physics = S
movetype = I
sprpriority = 1
anim = 199

[State 199, Snd]
type = playsnd
trigger1 = animelem = 4
value = 14, 6
channel = 0

[State 199, Shake]
type = envshake
trigger1 = animelemtime(4) >= 0 && animelemtime(4) <= 20
trigger1 = !(animelemtime(4) % 4)
time = 4
freq = 180
ampl = 4 - ceil(animelemtime(4) * 0.15)

[State 199, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3

[State 199, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -32, 0
ownpal = 1

[State 199, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==============================<LOSE (Time over)>==============================
[Statedef 170]
type = S
ctrl = 0
anim = 175 -(var(1) = 2) * 5
velset = 0, 0

[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 170, Snd]
type = playsnd
trigger1 = anim = 170 && animelem = 2
value = 0, 52

[State 170, Dust]
type = explod
trigger1 = anim = 170 && animelem = 2
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
pos = -5, 0
scale = 0.33, 0.33
ownpal = 1


;==============================<DRAWGAME (Time over)>==============================
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0
[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;========================================<INITIALIZE>========================================
;--- After Config ---
[Statedef 5902]
type = S

[State 5902, Wait for Ryu]
type = varset
trigger1 = !time
var(0) = 0

[State 5902, Intro vs Ryu]
type = varset
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
var(0) = 1

[State 5902, Intro Master vs Evil]
type = changestate
trigger1 = var(0) = 1
trigger1 = (var(1) = 2 && enemy, var(1) = 3) || (var(1) = 3 && enemy, var(1) = 2)
value = ifelse(random < 333, 368, ifelse(random < 333, 360, 377))

[State 5902, Intro Ryu vs Evil]
type = changestate
trigger1 = var(0) = 1
trigger1 = (var(1) = 1 && enemy, var(1) = 2) || (var(1) = 2 && enemy, var(1) = 1)
value = ifelse(random < 500, 360, 377)

[State 5902, Intro Evil vs Shin Gouki]
type = changestate
triggerall = (var(1) = [2, 3]) && numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Shin Gouki"
trigger2 = enemy, name = "Akuma"
trigger2 = enemy, authorname = "DeathScythe" || enemy, authorname = "DivineWolf"
value = 368

[State 5902, Intro Ryu vs Sakura]
type = changestate
trigger1 = var(1) != 2 && numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Sakura Kasugano"
value = 373

[State 5902, Intro vs CvS2 Another Kyo]
type = changestate
trigger1 = numenemy && roundno = 1
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Mouser && Byakko" && enemy, name = "CvS2AKyo"
value = 370

[State 5902, Intro vs CvS2 Ryo]
type = changestate
triggerall = numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, name = "Ryo Sakazaki"
trigger2 = enemy, authorname = "Byakko" && enemy, name = "CvS2Ryo"
trigger3 = enemy, name = "cvsryo"
value = 369

[State 5902, Intro vs Pocket Shin Gouki]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, name = "Pocket Shin Gouki" && enemy, authorname = "Phantom.of.the.Server"
value = 363

[State 5902, Intro vs Evil Ken]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = var(1) != 2
trigger1 = enemy, name = "Evil Ken" && enemy, authorname = "Reu"
value = 358

[State 5902, Intro Ryu vs Sagat];from patch
type=changestate
triggerall = var(1)!=2 && numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted && !(enemy, roundsexisted)
trigger1= enemy,name="Sagat" || enemy,name="cvssagat" || enemy,name="SagatMG"
value=374

[State 5902, Intro Ryu vs Kyo Kusanagi];from patch
type=changestate
triggerall = var(1)!=2 && numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted && !(enemy, roundsexisted)
trigger1= (enemy,name="Kyo" || enemy,name="Kyo Kusanagi"|| enemy,name="cvskyo" || enemy,name="cvskyo_normal" || enemy,name="Kyo_WLS") && Enemy,authorname != "Jmorphman"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, Authorname = "Jmorphman" && Enemy, var(40) != 1
value=375

[State 5902, Simul Intro with Ken]
type = ChangeState
trigger1 = var(1) != 2
trigger1 = NumEnemy && RoundNo = 1
trigger1 = TeamMode = Simul && NumPartner
trigger1 = Partner, AuthorName = "Jmorphman" && Partner, Name = "Ken Masters" && (Partner, var(40) != 1)
value = 355

[State 5902, vs Ken (P2 side)]
type = ChangeState
triggerAll = var(1)!=2
triggerAll = !numpartner && numenemy = 1
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters"
trigger1 = Enemy, StateNo = [6800,6801]
value = ifElse(Enemy, StateNo = 6800, 192, 193)

[State 5902, Intro vs Ken (P1 side)]
type = ChangeState
triggerAll = var(1)!=2
triggerAll = !numpartner && numenemy = 1
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters"
value = 192 + (Random % 2)

[State 5902, Intro Evil Ryu vs Violent Ken]
type = ChangeState
triggerAll = var(1)=2
triggerAll = !numpartner && numenemy = 1
triggerAll = RoundNo = 1 || (!RoundsExisted && !Enemy, RoundsExisted)
trigger1=enemy,authorname="Jmorphman" && enemy,name="Ken Masters"
value = 5982

[State 5902, Turns Intro]
type = changestate
trigger1 = ifelse(var(0) = 1, time >= 1, 1)
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, End]
type = changestate
trigger1 = ifelse(var(0) = 1, time >= 1, 1)
value = ifelse(roundno = 1, 190, 0)


;==============================<PREINTRO>==============================
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Intro]
type = changestate
trigger1 = var(1) = 2
value = ifelse(random < 500, 354, 356)

[State 190, Intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 355, ifelse(random < 500, 191, 353))


;==============================<INTRO 1>==============================
[Statedef 191]
type = S
anim = 191

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Snd]
type = playsnd
trigger1 = animelem = 16
value = 4, 10
channel = 0

[State 191, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 12 || animelem = 16
value = 1, 1
channel = 1
volumescale = 67

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO 2>==============================
[Statedef 353]
type = S
anim = 353

[State 353, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 353, Snd]
type = playsnd
trigger1 = animelem = 29
value = 4, ifelse(random < 500, 8, 9)
channel = 0

[State 353, Snd]
type = playsnd
trigger1 = animelem = 27
value = 1, 1
channel = 1
volumescale = 67

[State 353, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO 3>==============================
[Statedef 355]
type = S
anim = 355
sprpriority = -1

[State 355, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 355, Spr]
type = sprpriority
trigger1 = animelemtime(7) >= 0
value = 0

[State 355, Bag]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Bag"
postype = p1
pos = 61, -46
ownpal = 1
size.shadowoffset = -6

[State 355, Snd]
type = playsnd
trigger1 = animelem = 8
value = 4, 13
channel = 0

[State 355, Snd]
type = playsnd
trigger1 = animelem = 12
value = 1, 1
channel = 1
volumescale = 67

[State 355, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<EVIL INTRO 1>==============================
[Statedef 356]
type = S
anim = 356
sprpriority = -1
[State 356, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 356, Spr]
type = sprpriority
trigger1 = animelemtime(8) >= 0
value = 0
[State 356, Snd]
type = playsnd
trigger1 = animelem = 5
value = 14, 4
channel = 0

[State 356, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 3

[State 356, Dust]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -32, 0
ownpal = 1

[State 356, Shake]
type = envshake
trigger1 = animelemtime(10) >= 0 && animelemtime(10) <= 20
trigger1 = !(animelemtime(10) % 4)
time = 4
freq = 180
ampl = 4 - ceil(animelemtime(10) * 0.15)

[State 356, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<EVIL INTRO 2>==============================
[Statedef 354]
type = S
anim = 354
sprpriority = -1

[State 354, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 354, Snd]
type = playsnd
trigger1 = animelem = 9
value = 14, ifelse(random < 500, 6, 9)
channel = 0

[State 354, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO RYU vs EVIL RYU (ORIGINAL)>==============================
[Statedef 360]
type = S
physics = N
anim = 360 + (var(1) = 2)
sprpriority = 1 -(var(1) = 2) * 2

[State 360, Fix]
type = changestate
trigger1 = time <= 1 && p2stateno = 368
trigger2 = time <= 1 && p2stateno = 377
value = p2stateno

[State 360, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 360, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 360, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 360, Pos]
type = posset
trigger1 = time <= 2
x = -9 * facing

[State 360, Snd]
type = playsnd
trigger1 = (var(1) = 2) && animelemtime(1) = 30
value = 14, 7
channel = 0

[State 360, Snd]
type = playsnd
trigger1 = (var(1) != 2) && animelem = 3
value = 4, 9
channel = 0

[State 360, Pos]
type = posadd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
x = -6
[State 360, Vel]
type = velset
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
x = (helper(7650), rootdist x) / -12
[State 360, Pos]
type = posset
trigger1 = var(1) != 2 && animelemtime(10) >= 0
trigger2 = var(1) = 2 && animelemtime(14) >= 0
trigger3 = animelemtime(10) >= 0 && (helper(7650), rootdist x) <= 0
x = ceil(helper(7650), pos x)
[State 360, Vel]
type = velset
trigger1 = var(1) != 2 && animelemtime(10) >= 0
trigger2 = var(1) = 2 && animelemtime(14) >= 0
trigger3 = animelemtime(10) >= 0 && (helper(7650), rootdist x) <= 0
x = 0

[State 360, Snd]
type = playsnd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
value = 0, 105
[State 360, Dust]
type = explod
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = -1, 0
scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 360, Snd]
type = playsnd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
value = ifelse(var(1) = 2, 13, 3), (var(1) = 2) * 3
[State 360, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO RYU vs EVIL RYU (SFZ3)>==============================
[Statedef 377]
type = S
physics = N
anim = 377 + (var(1) = 2)
sprpriority = ifelse(var(1) = 1, 2, 1)

[State 377, Fix]
type = changestate
trigger1 = time <= 1 && p2stateno = 368
trigger2 = time <= 1 && p2stateno = 360
value = p2stateno

[State 377, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 377, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 377, screen]
type = screenbound
trigger1 = anim = 378
value = 1
movecamera = 0, 1

[State 377, Snd]
type = playsnd
trigger1 = anim = 378 && animelem = 2
value = 14, 6
channel = 0

[State 377, Snd]
type = playsnd
trigger1 = anim = 378 && animelem = 12
value = 1, 3
channel = 1

[State 377, Vel]
type = velset
trigger1 = anim = 378 && animelem = 12
x = (p2dist x - 80) / 6.0

[State 377, Vel]
type = velset
trigger1 = anim = 378 && animelem = 13
x = 0

[State 377, Vel]
type = posadd
trigger1 = anim = 378 && animelem = 13
x = ceil(p2dist x - 80)

[State 377, Snd]
type = playsnd
trigger1 = anim = 378 && animelem = 12
value = 5, 12

[State 377, Dust]
type = explod
trigger1 = anim = 378 && !(animelemtime(12) % 2)
trigger1 = animelemtime(12) >= 0 && animelemtime(13) < 0
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 377, Guard Snd]
type = playsnd
trigger1 = anim = 378 && animelem = 13
trigger2 = anim = 377 && animelem = 15
value = 2, 0
channel = 2

[State 377, Spark]
type = helper
trigger1 = anim = 378 && animelem = 13
helpertype = normal
stateno = 8000
ID = 8000
name = "Spark"
postype = p1
pos = 64, -63
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 377, Snd]
type = playsnd
trigger1 = anim = 377 && animelem = 4
value = 3, 7
channel = 0

[State 377, Snd]
type = playsnd
trigger1 = anim = 377 && animelem = 4
value = 7, 1

[State 377, Counter FX]
type = helper
trigger1 = anim = 377 && animelem = 4
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 16, -79
ownpal = 1
persistent = 0
supermovetime = 999

[State 377, Hadouken]
type = playsnd
trigger1 = anim = 377 && animelem = 13
value = 4, 0
channel = 0

[State 377, Hadouken]
type = playsnd
trigger1 = anim = 377 && animelem = 15
value = 5, 0

[State 377, Hadouken]
type = explod
trigger1 = anim = 377 && animelem = 15
anim = 1006
sprpriority = 3
postype = p1
pos = 80, -66
scale = 0.5, 0.5
ownpal = 1

[State 377, Spark]
type = helper
trigger1 = anim = 377 && animelem = 15
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p1
pos = 80, -66
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 377, Shake]
type = offset
trigger1 = anim = 378
trigger1 = animelemtime(18) >= 0 && animelemtime(19) < 0
x = ifelse(time % 2, 1, -1)

[State 377, Vel]
type = velset
trigger1 = anim = 378 && animelem = 19
trigger1 = numhelper(7650)
x = (helper(7650), rootdist x) / -12.0

[State 377, Vel]
type = velset
trigger1 = anim = 378 && animelem = 20
x = 0

[State 377, Pos]
type = posset
trigger1 = numhelper(7650)
trigger1 = anim = 378 && animelemtime(20) >= 0
x = ceil(helper(7650), pos x)

[State 377, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO EVIL vs SHIN GOUKI>==============================
[Statedef 368]
type = S
physics = N
anim = 368
sprpriority = 0

[State 368, Fix]
type = changestate
trigger1 = time <= 1 && p2stateno = 360
trigger2 = time <= 1 && p2stateno = 377
value = p2stateno

[State 368, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 368, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 368, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 368, Vel]
type = posset
trigger1 = !time
x = -240 * facing
[State 368, Vel]
type = velset
trigger1 = !time
x = 6

[State 368, Snd]
type = playsnd
trigger1 = !time
value = 5, 4
[State 368, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && p2dist x <= 72
value = 368
elem = 2
[State 368, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 9, 10)
channel = 0
[State 368, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0
[State 368, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -36 * facing

[State 368, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80

[State 368, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0

[State 368, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 368, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
value = 2, 0
channel = 2

[State 368, Spark]
type = helper
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p2
pos = -30 + (random % 61), -100 + (random % 61)
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 368, Shake]
type = envshake
trigger1 = teamside = 1
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
time = 12
ampl = 2
freq = 180

[State 368, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 72 && animelemtime(3) < 0
value = 368
elem = 3
[State 368, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 5, 2)
channel = 0

[State 368, Snd]
type = playsnd
trigger1 = animelem = 3 && teamside = 1
value = 7, 1
[State 368, Lightning]
type = helper
trigger1 = animelem = 3 && teamside = 1
helpertype = normal
stateno = 7250
ID = 7250
postype = left
pos = 160, -60
ownpal = 1
supermovetime = 999

[State 368, Vel]
type = velset
trigger1 = animelem = 3
x = -6
[State 368, Pos]
type = posset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = ceil(helper(7650), pos x)
[State 368, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = 0
[State 368, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO vs SAKURA>==============================
[Statedef 373]
type = S
anim = 373
[State 373, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 373, Flash]
type = palfx
trigger1 = animelem = 23
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 373, Snd]
type = playsnd
trigger1 = animelem = 23
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 6)
channel = 0

[State 373, Snd]
type = playsnd
trigger1 = animelem = 23
value = 7, 3

[State 373, Spark]
type = explod
trigger1 = animelem = 23
anim = 7200
ID = 7200
ontop = 1
postype = p1
pos = 31, -69
removetime = -2
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 373, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO vs CvS2 ANOTHER KYO>==============================
[Statedef 370]
type = S
physics = N
anim = ifelse(var(1) != 2, 372, 370)
sprpriority = 0
[State 370, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 370, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 370, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 370, Anim]
type = changeanim
trigger1 = time >= 120 && anim != 371
value = 371
[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelem = 1
x = ((p2dist x / 2) -25) / 12
[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelemtime(5) >= 0 && animelemtime(33) < 0
trigger2 = anim = 371 && animelemtime(37) >= 0
x = 0

[state 370, posfix]
type = posadd
trigger1 = anim = 371 && (animelem = 16 || animelem = 17 || animelem = 18)
x = ifelse((animelem = 16), -10, ifelse((animelem = 17), -6, -5))

[State 370, Snd]
type = playsnd
trigger1 = time = 15
value = ifelse(var(1) = 2, 14, 4), 8 -(var(1) = 2) * 2
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 5
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 3, 6)
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 11
value = ifelse(var(1) = 2, 13, 3), 4 -(var(1) = 2) * 4
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 18
value = ifelse(var(1) = 2, 13, 3), 2 -(var(1) = 2)
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 27
value = ifelse(var(1) = 2, 13, 3), 3 -(var(1) = 2)
channel = 0

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && (animelem = 11 || animelem = 18)
value = 1, 3
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 27
value = 1, 6

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && (animelem = 19 || animelem = 28)
value = 2, 8

[State 370, Sparks]
type = helper
trigger1 = anim = 371 && (animelem = 19 || animelem = 28)
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = back
pos = 160, -72
ownpal = 1
ignorehitpause = 1

[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelem = 35
x = (helper(7650), rootdist x) / -12

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 2
value = 0, 105

[State 370, Dust]
type = explod
trigger1 = anim = 371 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 35
value = 0, 105

[State 370, Dust]
type = explod
trigger1 = anim = 371 && animelem = 35
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -1, 0
scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 370, Pos]
type = posset
trigger1 = anim = 371 && animelemtime(38) >= 0
x = ceil(helper(7650), pos x)
[State 370, End]
type = changestate
trigger1 = anim = 371 && !animtime
value = 0


;==============================<INTRO vs CvS2 RYO>==============================
[Statedef 369]
type = A
physics = N
anim = 369
[State 369, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 369, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 369, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 369, Pos]
type = posset
trigger1 = !time
x = -20 * facing
[State 369, Snd]
type = playsnd
trigger1 = time = 15
value = ifelse(var(1) = 2, 14, 4), 9;-(var(1) = 2) * 3
channel = 0

[State 369, Snd]
type = playsnd
trigger1 = animelem = 7
value = 0, 40
[State 369, Dust]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 369, Vel]
type = velset
trigger1 = anim = 369 && animelem = 7
x = (helper(7650), rootdist x) / -50
y = -8
[State 369, Accel]
type = veladd
trigger1 = anim = 369 && animelemtime(7) >= 0
y = 0.35
[State 369, Anim]
type = changeanim
trigger1 = anim = 369 && animelemtime(7) >= 0 && vel y > 0 && (pos y > -vel y)
value = 48
[State 369, Pos]
type = posset
trigger1 = anim = 48
x = ceil(helper(7650), pos x)
y = 0
[State 369, Vel]
type = velset
trigger1 = anim = 48
x = 0
y = 0
[State 369, Snd]
type = playsnd
trigger1 = anim = 48 && animelem = 1
value = 0, 52
[State 369, Dust]
type = explod
trigger1 = anim = 48 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
[State 369, End]
type = changestate
trigger1 = anim = 48 && !animtime
value = 0


;==============================<INTRO VS EVIL KEN>==============================
[Statedef 358]
type = S
anim = 358

[State 358, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 358, Safety]
type = changeanim
trigger1 = numenemy && time >= 60
trigger1 = enemy, stateno != 11010
trigger1 = animelemtime(2) < 0
value = 358
elem = 2

[State 358, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO vs POCKET SHIN GOUKI>==============================
[Statedef 363]
type = S
anim = 363

[State 363, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 363, Snd]
type = playsnd
trigger1 = var(1) != 2
trigger1 = animelemtime(5) = 15
value = 4, 11
channel = 0

[State 363, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelemtime(5) = 30
value = 13, 3
channel = 0

[State 363, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO VS KEN (FIST BUMP)>==============================
[Statedef 192]
type = S
anim = 192
sprpriority = -1

[State 192, Fix]
type = changestate
trigger1 = numenemy
trigger1 = enemy,var(40) = 1
value = 353

[State 192, Fix]
type=changestate
trigger1 = numenemy
trigger1 = enemynear, authorname = "Jmorphman" && enemynear,name = "Ken Masters"
trigger1 = enemynear, stateno = 6801
value = 193

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Snd]
type = playsnd
trigger1= animelemtime(1) = 50
value = 4, 12
channel = 0

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<INTRO vs KEN VS (NOOGIE)>==============================
[Statedef 193]
type=S
anim=193
sprpriority=1

[State 193, Fix]
type = changestate
trigger1 = enemy,authorname = "Jmorphman" && enemy,name = "Ken Masters" && enemy,var(40) = 1
value = 353

[State 193, Fix]
type=changestate
trigger1 = numenemy
trigger1 = enemynear, authorname = "Jmorphman" && enemynear,name = "Ken Masters"
trigger1 = enemynear, stateno = 6800
value = 192

[State 193, Intro]
type=assertspecial
trigger1= 1
flag=intro

[State 193, Snd]
type=playsnd
trigger1=animelem=13
value=0,800

[State 193, Snd]
type=playsnd
trigger1=animelem=19
value=3,4

[State 193, End]
type=changestate
trigger1= !animtime
value=0


;==============================<INTRO VS SAGAT>==============================
[Statedef 374]
type=S
anim=374

[State 374, Intro]
type=assertspecial
trigger1= 1
flag=intro

[State 374, End]
type=changestate
trigger1= !animtime
value=0


;==============================<INTRO vs KYO>==============================
[Statedef 375]
type=S
anim=375
[State 375, Intro]
type=assertspecial
trigger1= 1
flag=intro

[State 375, Intro]
type = changestate
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, var(40) = 1
value = ifelse(random < 333, 355, ifelse(random < 500, 191, 353))

[State 375, changeanim]
type=changeanim
triggerAll = AnimElemTime(1)=20
trigger1 = !(Enemy, AuthorName = "Hero")
trigger1 = !(Enemy, AuthorName = "Jmorphman")
value=375
elem=2

[State 375, Snd]
type=playsnd
trigger1= animelem=8
value=4,10
channel=0

[State 375, End]
type=changestate
trigger1= !animtime
value=0


;==============================<EVIL INTRO VS VIOLENT KEN>==============================
[Statedef 5982]
type=S
anim=1000
sprpriority=-1

[State 5982, Change to Regular Intro]
type = PosSet
trigger1 = numhelper(7650)
trigger1 = time = 1 && numenemy
trigger1 = enemy,authorname="Jmorphman" && enemy,name="Ken Masters" && enemy,var(40) != 1
x = Helper(7650), pos x
y = 0

[State 5982, ChangeAnim]
type = turn
trigger1 = time = 1 && numenemy
trigger1 = enemy,authorname="Jmorphman" && enemy,name="Ken Masters" && enemy,var(40) != 1

[State 5982, Change to Regular Intro]
type=changestate
trigger1 = time = 1 && numenemy
trigger1 = enemy,authorname="Jmorphman" && enemy,name="Ken Masters" && enemy,var(40) != 1
value=ifelse(random < 500, 354, 356)

[State 5982, Intro]
type=assertspecial
trigger1= 1
flag=intro

[State 5982, No Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 5982, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5982, camera]
type=helper
trigger1= !numhelper(7650)
helpertype=normal
stateno=7650
ID=7650
name="Camera"
postype=p1

[State 5982, screen]
type=screenbound
trigger1= 1
value=0
movecamera=0,0

[State 5982, PosAdd]
type = PosAdd
trigger1 = !Time
x = 220

[State 5982, ChangeAnim]
type = Turn
trigger1 = !Time

[State 5982, strengthvar]
type=varset
trigger1=!time
var(10)=3

[State 1000, Hadouken]
type = Explod
triggerall=Anim=1000
trigger1= animelemtime(5)=1
anim = 1005
pos=80,-68
postype = p1
facing = 1
vel = 10,0
scale = .5,.5
removetime = 200
sprpriority=4

[State 5982, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 1000
value = 1400

[State 1000, Snd]
type=playsnd
triggerall=Anim=1000
trigger1= animelem=3
value=4+(var(1)=2)*10,0
channel=0

[State 1000, Snd]
type=playsnd
triggerall=Anim=1000
trigger1= animelemtime(5)=1
value=5,0

[State 1000, afterimage]
type=afterimage
trigger1 =Anim = 1400
trigger1= animelem=3
time=2
timegap=1
framegap=6
length= 24
palbright=0,0,0
paladd=0,0,0
palmul=.9,.9,.9
palcontrast=160,160,160
palpostbright=0,0,0
trans=add1

[State 1400, Vel]
type=velset
trigger1 = Anim = 1400
trigger1= animelemtime(2)>0 && animelemtime(6)<0
x=-8*sin((time-44)/2)

[State 1400, Vel]
type=velset
trigger1 = numhelper(7650)
trigger1 = Anim = 1400 && animelem=6
x = (Helper(7650), rootdist x) / 20

[State 1400, Snd]
type=playsnd
trigger1 = Anim = 1400
trigger1= animelem=2
value = 3 + (var(1)=2)*10, 4 * (var(1)!=2)
channel=0

[State 1400, Snd]
type=playsnd
trigger1 = Anim = 1400 && animelem=6
value=5,4
persistent=0

[State 5982, ChangeAnim]
type = Turn
trigger1 = p2dist x <= 0

[State 5972, PosSet]
type = PosSet
trigger1 = AnimElemTime(6) = 20 && Anim = 1400
x = Helper(7650), pos x
y = 0

[State 5982, End]
type = velset
trigger1 = AnimElemTime(6) = 20 && Anim = 1400
x = 0

[State 5982, End]
type=changestate
trigger1 = AnimElemTime(6) = 20 && Anim = 1400
trigger2 = time >= 120
value=0


;========================================<TURNS INTRO>========================================
[Statedef 6900]
type = A
anim = 6900
velset = 0, 0
ctrl = 0

[State 6900, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 6900, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 6900, Pos]
type = posset
trigger1 = !time
x = (-320 + abs(pos x)) * facing

[State 6900, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -40.0
y = -10.25
[State 6900, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 6900, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0 && (pos y > -vel y)
value = 6901


;--- Land ---
[Statedef 6901]
type = S
physics = S
anim = ifelse(var(1) = 2, 6902, 6901)
velset = 0, 0

[State 6901, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6901, Pos]
type = posset
trigger1 = !time && numhelper(7650)
x = ceil(helper(7650), pos x)

[State 6901, Pos]
type = posset
trigger1 = !time
y = 0

[State 6901, Snd]
type = playsnd
trigger1 = anim = 6901 && animelem = 6 && var(1) != 2
value = 4, 13
channel = 0

[State 6901, Snd]
type = playsnd
trigger1 = anim = 6902 && animelem = 5 && var(1) = 2
value = 13, 4
channel = 0

[State 6901, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6901, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, Shake]
type = envshake
trigger1 = anim = 6902
trigger1 = animelemtime(7) = [0, 20]
trigger1 = !(animelemtime(7) % 5)
time = 5
freq = 120
ampl = 6 - ceil(animelemtime(7) * 0.25)

[State 6901, Snd]
type = playsnd
trigger1 = anim = 6902 && animelem = 7
value = 5, 3

[State 6901, Dust]
type = helper
trigger1 = anim = 6902 && animelem = 7
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -32, 0
ownpal = 1

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 0


;==============================<WIN POSE DECIDER>==============================
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = var(1) != 2
value = 1 + (random % 12)

[State 180, Quote]
type = victoryquote
trigger1 = var(1) = 2
value = 50 + (random % 5)

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemy, name = "Ken" || enemy, name = "Ken Masters"
trigger2 = enemy, name = "cvsken" || enemy, name = "svcken"
value = ifElse(Enemy, Authorname = "Jmorphman" && enemy, var(40) = 1, 35, 30);patch

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Sagat"
trigger2 = enemy, name = "cvssagat" || enemy, name = "svcsagat"
value = ifelse(var(1) = 2, 81, 31)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Gouki" || enemy, name = "Akuma"
trigger2 = enemy, name = "Shin Gouki" || enemy, name = "Shin Akuma"
trigger3 = enemy, name = "Cyber Akuma" || enemy, name = "Mech Gouki"
trigger4 = enemy, name = "cvsgouki" || enemy, name = "svcgouki"
value = ifelse(var(1) = 2, 80, 32)

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemy, name = "Sakura Kasugano" || enemy, name = "cvssakura"
value = 33

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemynear, name = "Vega" && enemynear, authorname = "Phantom.of.the.Server"
trigger2 = enemynear, name = "cvsvega" && (enemynear, authorname = "Warusaki3" || enemynear, authorname = "Gargoyle")
trigger3 = enemynear, name = "M.Bison" && enemynear, authorname = "N -Mario"
trigger4 = enemynear, name = "M. Bison" && enemynear, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemynear, name = "CvSBison" && enemynear, authorname = "Team Kai (Saiai and Koga)"
value = 34

[State 180, Win vs Ken]
type = ChangeState
trigger1 = var(1) != 2
trigger1 = (var(0) = [3000, 4999]) || enemynear, receiveddamage >= 300
trigger1 = teammode = single || (teammode = turns && matchover) || teammode = tag
trigger1 = numenemy
trigger1 = enemynear, name = "Ken Masters" && (enemynear, var(40) != 1)
trigger1 = enemynear, authorname = "Jmorphman" || enemynear, authorname = "Phantom.of.the.Server&Jmorphman"
trigger1 = enemynear, pos y = 0 && enemynear, frontedgedist >= 55
value = 184

[State 180, Win SGS]
type = changestate
trigger1 = prevstateno = 4099
value = 4099

[State 180, Win RKH]
type = changestate
trigger1 = prevstateno = 3052
value = 3052

[State 180, win Shin Shoryuken]
type = changestate
trigger1 = !time
trigger1 = var(23) = 3120
value = 3199

[State 180, win]
type = changestate
trigger1 = !time && var(1) != 2
trigger1 = command = "/x" || command = "/y" || command = "/z" || command = "/a" || command = "/b" || command = "/c"
value = ifelse((command = "/x" || command = "/a"), 182, ifelse((command = "/y" || command = "/b"), 181, 183))

[State 180, win]
type = changestate
trigger1 = !time && var(1) != 2
value = ifelse(random < 333, 181, ifelse(random < 500, 182, 183))

[State 180, win]
type = changestate
trigger1 = !time && var(1) = 2
trigger1 = command = "/x" || command = "/y" || command = "/z" || command = "/a" || command = "/b" || command = "/c"
value = ifelse((command = "/x" || command = "/y" || command = "/z"), 185, 186)

[State 180, win]
type = changestate
trigger1 = !time && var(1) = 2
value = ifelse(random < 500, 185, 186)


;========================================<WIN VS KEN>========================================
[StateDef 184]
type = S
physics = S
anim = 20
ctrl = 0

[State 184, Assert: RoundNotOver]
type = assertspecial
trigger1 = anim != 184
trigger2 = anim = 184 && animelemtime(1) < 200
flag = roundnotover

[State 184, velset]
type = velset
trigger1 = anim = 20
x = const(velocity.walk.fwd.x)

[State 184, ChangeAnim]
type = changeanim
trigger1 = enemy, facing = facing
trigger1 = enemy, p2dist x <= 68 && (enemy, p2dist x >= 58)
value = 5

[State 184, Turn]
type = turn
trigger1 = enemy, facing = facing
trigger1 = enemy, p2dist x <= 68 && (enemy, p2dist x >= 58)

[State 184, ChangeAnim]
type = changeanim
trigger1 = enemy, facing != facing
trigger1 = anim = 20
trigger1 = vel x > 0
trigger1 = enemy, p2dist x <= 68 && (enemy, p2dist x >= 28)
trigger2 = anim = 5 && !animtime
value = 184

[State 184, PosAdd]
type = posadd
trigger1 = anim = 5 || anim = 184
x = ceil(enemy, p2dist x - 68)

[State 184, velset]
type = velset
trigger1 = anim != 20
x = 0


;==============================<WIN 1>==============================
[Statedef 181]
type = S
anim = 181
ctrl = 0

[State 181, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 181, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 4, 17
channel = 0

[State 181, Leaf]
type = explod
trigger1 = animelem = 7
trigger1 = random < 333 || command = "/s"
anim = 6010
sprpriority = 2
postype = p1
pos = -21, -28
vel = -1, 1.5
accel = 0.2, -0.1
removetime = -2
ownpal = 1


;==============================<WIN 2>==============================
[Statedef 182]
type = S
anim = 182
ctrl = 0

[State 182, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 182, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 16
channel = 0


;==============================<WIN 3>==============================
[Statedef 183]
type = S
anim = 183
ctrl = 0

[State 183, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 183, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State 183, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 1
channel = 1

[State 183, Snd]
type = playsnd
trigger1 = animelem = 12 || animelem = 16
value = 1, 1
channel = 1
volumescale = 67


;==============================<WIN by S.G.S.>==============================
[Statedef 4099]
type = S
sprpriority = -1

[State 4099, Anim]
type = changeanim
trigger1 = !time && prevstateno = 4001
value = 4099

[State 4099, Kanji]
type = helper
trigger1 = !time
trigger1 = prevstateno = 4001 && !numhelper(8610)
helpertype = normal
stateno = 7610
ID = 8610
postype = left
ownpal = 1
persistent = 0

[State 4099, Snd]
type = playsnd
trigger1 = time = 10 && prevstateno = 4001
value = 14, 10
channel = 0

[State 4099, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;==============================<WIN by SHORYUKEN>==============================
[Statedef 3199]
type = S
anim = 3199
ctrl = 0

[State 3199, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 3199, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==============================<WIN by R.K.H.>==============================
[Statedef 3052]
type = S

[State 3052, Anim]
type = changeanim
trigger1 = !time && anim != 170
value = 170

[State 3052, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000 + (var(1) = 2) * 10, 3
channel = 0

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52

[State 3052, Dust]
type = explod
trigger1 = animelem = 2
anim = 7102
ID = 7102
sprpriority = -4
postype = p1
pos = -5, 0
scale = 0.33, 0.33
ownpal = 1

[State 3052, win]
type = changestate
trigger1 = time >= 60 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;==============================<EVIL WIN 1>==============================
[Statedef 185]
type = S
anim = 185
ctrl = 0

[State 185, Intro]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 185, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 185, Snd]
type = playsnd
trigger1 = animelem = 5
value = 14, 8
channel = 0


;==============================<EVIL WIN 2>==============================
[Statedef 186]
type = S
anim = 186
ctrl = 0

[State 186, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 186, Snd]
type = playsnd
trigger1 = animelem = 4
value = 14, 9
channel = 0

[State 186, Shake]
type = envshake
trigger1 = animelem = 4
time = 18
ampl = 2
freq = 180

[State 186, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3

[State 86, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -32, 0
ownpal = 1


;==============================<CONTINUE?>==============================
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==============================<FALL RECOVERY>==============================
[Statedef 5200]
type = A
movetype = H
physics = N

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 5200, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5201


[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0
[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0
[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), 0
channel = 0

[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-16 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), 3 * (var(1) = 2)
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5210, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-74 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[state 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[state 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[state 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[state 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[state 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[state 5210, Back]
type = veladd
trigger1 = !time
trigger1 = command = "holdback"
x = const(velocity.air.gethit.airrecover.back)

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;========================================<K.O.>========================================
;from patch
[StateDef 5150]
type = L
physics = N
movetype = H
sprpriority = -3

[State 5150, ChangeAnim]
type = changeanim
trigger1 = !time
value = 5150

[State 5150, Anim]
type = changeanim
trigger1 = anim != 171
trigger1 = pos y = 0
trigger1 = numenemy
trigger1 = enemy, anim = 184
trigger1 = enemy, authorname = "Jmorphman" && enemy, name = "Ken Masters" && (enemy, var(40) != 1)
value = 171

[State 5150, SprPriority]
type = sprpriority
trigger1= anim = 171
value = 3

[State 5150, VelMul]
type = velmul
trigger1 = 1
x= 0.85

[State 5150, velset]
type = velset
trigger1 = abs(vel x) < 0.05
x = 0

[State 5150, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5150, ChangeAnimElem to sync with Ken (P2 side)]
type = changeanim
trigger1 = numenemy
trigger1 = anim = 171 && animelemtime(7) >= 0
trigger1 = enemy, anim = 184 && enemy, animelemtime(4) < 0
value = 171
elem = 6

[State 5150, ChangeAnimElem to sync with Ken (P2 side)]
type = changeanim
trigger1 = numenemy
trigger1 = anim = 171 && animelemtime(7) < 0
trigger1 = enemy, anim = 184 && enemy, animelemtime(4) >= 0
value = 171
elem = 7


;========================<TARGET AIR RESET>========================
[Statedef 1115040]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1115040, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = gethitvar(hitshaketime) + ceil((-gethitvar(yvel) + ((gethitvar(yvel) ** 2) - 4 * (0.5 * gethitvar(yaccel)) * (pos y)) ** 0.5) / gethitvar(yaccel)) + 2

[State 1115040, End]
type = selfstate
trigger1 = 1
value = 5020


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, Mode]
type = varset
trigger1 = !var(1)
trigger1 = roundstate >= 2
var(1) = ifelse(random < 500, 1, 2)

[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = moveguarded = 1
value = 2, 0
channel = 2
ignorehitpause = 1

[State -2, Sparks Custom]
type = helper
triggerall = map(mysparks)
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = moveguarded = 1
trigger2 = var(34) = 8000 || var(34) = 8001
helpertype = normal
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Sparks Screenpack]
type = explod
triggerall = !map(mysparks)
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = moveguarded = 1
trigger2 = var(34) = 8000 || var(34) = 8001
anim = Fifelse(moveguarded, 40, ifelse(var(33) = 8014, 3, ifelse(var(33) = 8012 || var(33) = 8013, 2, ifelse(var(33) = 8011, 1, 0))))
ID = 8000
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1

[State -2, Counter FX]
type = helper
trigger1 = movehit = 1
trigger1 = movecountered = 1
trigger1 = map(counterhit)
trigger1 = var(30) = hitpausetime
trigger1 = hitdefattr != SCA, AT
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -2, Counter Flag]
type = mapset
trigger1 = numenemy
map = "counterhit"
value = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Hit Detection]
type = varset
trigger1 = 1
var(30) = -1
[State -2, Hit Detection]
type = varrangeset
trigger1 = movetype = I
trigger2 = movetype = H && time
first = 30
last = 37
value = -1
ignorehitpause = 1

[State -2, P2 Facing]
type = targetfacing
triggerall = movecontact = 1 && numtarget
triggerall = !(target, hitfall) && (target, time <= 1)
trigger1 = !(target, hitshakeover)
trigger2 = target, stateno = [150, 155]
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Air Reset]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, stateno = 5020
trigger1 = target, prevstateno != 1115040
trigger1 = target, alive && !(target, hitfall)
value = 1115040
ignorehitpause = 1

[State -2, P2 Air Reset Trip Guard]
redirectID = enemynear, ID
type = ctrlset
trigger1 = numenemy
trigger1 = enemynear, ctrl = 0
trigger1 = enemynear, stateno = 52
trigger1 = enemynear, prevstateno = [5000, 5999];5040 really
value = 1
ignorehitpause = 1

[State -2, P2 Safe Fall]
redirectID = enemynear, ID
type = selfstate
trigger1 = numenemy
;trigger1 = enemynear, command = "recovery";currently broken in Ikemen
trigger1 = (enemynear, command = "x" + enemynear, command = "y" + enemynear, command = "z") >= 2 || (enemynear, command = "$D")
trigger1 = (enemynear, stateno = [5030, 5050]) || (enemynear, incustomstate)
trigger1 = enemynear, pos y >= enemynear, const(movement.air.gethit.groundrecover.ground.threshold)
trigger1 = enemynear, gethitvar(isbound) = 0
trigger1 = enemynear, vel y > 0
trigger1 = enemynear, hitfall
trigger1 = enemynear, movetype = H
trigger1 = enemynear, statetype = A
trigger1 = enemynear, gethitvar(fall.recover)
trigger1 = enemynear, dizzy = 0
trigger1 = enemynear, alive
value = 5200
ignorehitpause = 1

[State -2, Juggle Increase]
type = varadd
trigger1 = numenemy
trigger1 = !numhelper(7260) && !numhelper(7500)
trigger1 = enemynear, hitfall
trigger1 = enemynear, time = [0, 1]
trigger1 = enemynear, gethitvar(damage)
var(15) = 1
ignorehitpause = 1

[State -2, Juggle Reset Single]
type = varset
triggerall = numenemy = 1 && var(15)
trigger1 = (enemy, statetype != A) && (enemy, stateno != 5080) && (enemy, time >= 1)
trigger2 = (enemy, movetype != H) || (enemy, stateno = [120, 155]) || (enemy, ctrl) || !(enemy, hitfall)
var(15) = 0
ignorehitpause = 1
[State -2, Juggle Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(15)
trigger1 = (enemynear(0), statetype != A) && (enemynear(0), stateno != 5080) && (enemynear(0), time >= 1)
trigger1 = (((enemynear(0), pos x) - pos x) * facing) >= 0
trigger2 = (enemynear(0), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl) || !(enemynear(0), hitfall)
trigger2 = (((enemynear(0), pos x) - pos x) * facing) >= 0
trigger3 = (enemynear(1), statetype != A) && (enemynear(1), stateno != 5080) && (enemynear(1), time >= 1)
trigger3 = (((enemynear(1), pos x) - pos x) * facing) = [0, 160]
trigger4 = (enemynear(1), movetype != H) || (enemynear(1), stateno = [120, 155]) || (enemynear(1), ctrl) || !(enemynear(1), hitfall)
trigger4 = (((enemynear(1), pos x) - pos x) * facing) = [0, 160]
var(15) = 0
ignorehitpause = 1
[State -2, Free Juggling]
type = varset
trigger1 = roundstate != 2
var(15) = 0
ignorehitpause = 1

[State -2, Super Cancel Juggle]
type = varset
triggerall = time <= 10
triggerall = prevstateno = [1000, 4999]
trigger1 = stateno = 3000 || stateno = 3020 || stateno = 3040 || stateno = 3100 || stateno = 3120 || stateno = 3140 || stateno = 3160 || stateno = 3180
trigger2 = stateno = 3200 || stateno = 3300 || stateno = 4000
var(15) = 0
ignorehitpause = 1

[State -2, Wall Bounce Limit]
type = mapset
map = "wallbounce"
trigger1 = map(wallbounce)
trigger1 = p2movetype != H
trigger1 = !numtarget(1310)
value = 0
ignorehitpause = 1

[State -2, Unthrowable Flag]
type = mapadd
trigger1 = map(unthrowable) > 0
trigger1 = numenemy
trigger1 = enemynear, stateno != 52 || enemynear, time >= 6
map = "unthrowable"
value = -1
ignorehitpause = 1

[State -2, Unthrowable Flag]
type = mapset
triggerall = numenemy
triggerall = enemynear, anim != 5300
triggerall = enemynear, stateno != const(statedizzy)
trigger1 = enemynear, stateno = 40
trigger1 = enemynear, anim != [0, 29]
trigger2 = enemynear, stateno = [140, 155]
trigger3 = enemynear, stateno = 51
trigger3 = enemynear, prevstateno = [140, 155]
trigger4 = enemynear, stateno = 5040
trigger5 = enemynear, stateno = 5120;just in case
trigger6 = enemynear, stateno = [5200, 5201]
trigger7 = !var(20)
trigger7 = enemynear, movetype = H
trigger7 = enemynear, statetype != A
trigger8 = enemynear, movetype = H
trigger8 = enemynear, statetype = A
trigger8 = enemynear, hitfall = 0
map = "unthrowable"
value = 3
ignorehitpause = 1

[State -2, Damage Scaling - Reset]
type = varset
trigger1 = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, dizzy = 0
trigger1 = enemynear, stateno != enemynear, const(statedizzy)
var(42) = 0 + (var(43) := 0)
ignorehitpause = 1

[State -2, Damage Scaling - Attack Connected Flag]
type = varset
trigger1 = movecontact = 1
trigger1 = hitcount <= 1
trigger2 = var(18)
var(43) = 1
ignorehitpause = 1

[State -2, Damage Scaling - Force Second Hit]
type = varset
trigger1 = p2movetype = H
trigger1 = var(42) = 0
trigger1 = var(43) = 0
var(43) = 1
ignorehitpause = 1

[State -2, Damage Scaling - Formula]
type = varset
trigger1 = 1
fvar(10) = ifelse(var(42) <= 0, 1, ifelse(var(42) >= 9, 0.1, 1 - 0.1 * var(42)))
ignorehitpause = 1

[State -2, Damage Scaling - Add Guts]
type = varset
trigger1 = numenemy
trigger1 = enemynear, receiveddamage >= (enemynear, lifemax * 0.50)
fvar(10) = fvar(10) * ifelse(enemynear, receiveddamage >= (enemynear, lifemax * 0.85), 0.75, ifelse(enemynear, receiveddamage >= (enemynear, lifemax * 0.70), 0.90, 0.95))
ignorehitpause = 1

[State -2, Damage Scaling - Custom Combos]
type = varset
trigger1 = var(20)
fvar(10) = 0.75 * fvar(10)
ignorehitpause = 1

[State -2, Damage Scaling - Chain Combos]
type = varset
trigger1 = !var(20)
trigger1 = var(1) = 3
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
fvar(10) = 0.75 * fvar(10)
ignorehitpause = 1

[State -2, Damage Scaling - Override Fall Defense Bonus]
type = varset
trigger1 = numenemy = 1
trigger1 = enemynear, gethitvar(fallcount) >= 1
trigger1 = enemynear, const(data.fall.defence_mul) = 1.50;default
fvar(10) = fvar(10) / ((2.0 / 3.0) ** enemynear, gethitvar(fallcount))
ignorehitpause = 1

[State -2, Damage Scaling - Counter Hit Bonus]
type = varset
trigger1 = 1
fvar(11) = fvar(10) * ifelse(map(counterhit), 1.2, 1)
ignorehitpause = 1

[State -2, Damage Scaling - Multiplier]
type = attackmulset
trigger1 = 1
value = fvar(11)
ignorehitpause = 1

[State -2, ProjContact Reset]
type = varset
triggerall = var(18)
trigger1 = stateno != 1000 && stateno != 1010 && stateno != 1020 && stateno != 3000 && stateno != 3020 && stateno != 3042 && stateno != 3050
trigger2 = stateno = 1000 && animelemtime(5) < 0
trigger3 = stateno = 1010 && animelemtime(5) < 0
trigger4 = stateno = 1020 && animelemtime(5) < 0
trigger5 = stateno = 3000 && animelemtime(8) < 0
trigger6 = stateno = 3020 && anim = 3020
var(18) = 0

[State -2, ProjContact Timer]
type = varadd
trigger1 = var(18)
var(18) = 1

[State -2, Evil Ryu Life Points]
type = defencemulset
trigger1 = var(1) = 2
value = 0.90
onhit = 0
multype = 1
ignorehitpause = 1

[State -2, Master Ryu Life Points]
type = defencemulset
trigger1 = var(1) = 3
value = 0.80
onhit = 0
multype = 1
ignorehitpause = 1

[State -2, Evil Ryu Stun Points]
type = dizzypointsset
trigger1 = var(1) = 2
trigger1 = dizzypoints > (0.90 * dizzypointsmax)
value = 0.90 * dizzypointsmax
ignorehitpause = 1

[State -2, Master Ryu Stun Points]
type = dizzypointsset
trigger1 = var(1) = 3
trigger1 = dizzypoints > (0.80 * dizzypointsmax)
value = 0.80 * dizzypointsmax
ignorehitpause = 1

[State -2, Custom Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1
[State -2, Custom Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Custom Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 24 + ceil(sin(var(20) / 16.0 * pi) * 24), 24 + ceil(sin(var(20) / 16.0 * pi) * 24), 24 + ceil(sin(var(20) / 16.0 * pi) * 24)
ignorehitpause = 1
[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
trigger1 = !(gametime % 4)
time = 2
add = 0, 96, 256
ignorehitpause = 1

[State -2, Dizzy Off - Reset];placeholder until dizzy points are individually specified or you can turn them off altogether
type = mapset
trigger1 = 1
map = "dizzyoff"
value = 0
ignorehitpause = 1

[State -2, Dizzy Off - Check Conditions]
type = mapset
trigger1 = var(20)
map = "dizzyoff"
value = 1
ignorehitpause = 1

[State -2, Dizzy Off - Save Points]
type = mapset
trigger1 = !map(dizzyoff)
map = "dizzysave"
value = enemynear, dizzypoints
ignorehitpause = 1

[State -2, Dizzy Off - Save Points]
type = mapset
trigger1 = map(dizzyoff)
trigger1 = map(dizzysave) < enemynear, dizzypoints
map = "dizzysave"
value = enemynear, dizzypoints
ignorehitpause = 1

[State -2, Dizzy Off - Freeze Points]
redirectID = enemynear, ID
type = dizzypointsset
trigger1 = map(dizzyoff)
trigger1 = numenemy
trigger1 = (enemynear, dizzypoints) < map(dizzysave)
value = map(dizzysave)
ignorehitpause = 1

[State -2, Dizzy Off - Freeze Points]
redirectID = enemynear, ID
type = dizzypointsset
trigger1 = map(dizzyoff)
trigger1 = numenemy
trigger1 = enemynear, dizzypoints <= 0
value = enemynear, dizzypointsmax
ignorehitpause = 1

[State -2, Stopsnd 3]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3041
channel = 3
[State -2, Stopsnd 4]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3041
channel = 4

[State -2, KO snd]
type = mapset
trigger1 = alive
trigger1 = map(kosound) > 0
trigger2 = !alive
map = "kosound"
value = ifelse(alive, 0, map(kosound) + 1)
ignorehitpause = 1

[State -2, KO snd]
type = playsnd
trigger1 = !alive
trigger1 = map(kosound) = 1
trigger1 = stateno != 5950
value = 11, ifelse((var(1) = 2), 2, 1)
ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
trigger1 = target, stateno = 5040
trigger2 = target, stateno = [5200, 5210]
ignorehitpause = 1

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = ifelse(var(1) = 2, 5010, 5000), 3
channel = 0

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Mode = %d Damage = %.2f Juggle = %d Unthrowable = %d"
params = var(1), fvar(11), var(15), (map(unthrowable) != 0)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - https://network.mugenguild.com/pots/"
ignorehitpause = 1


;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[Statedef -3]

[State -3, Turning Threshold]
type = assertspecial
trigger1 = roundstate = 2
trigger1 = backedgebodydist > 0
trigger1 = p2dist x >= -const(size.ground.back)
flag = noautoturn

[State -3, Infinite Prevention]
redirectID = enemynear, ID
type = hitfallset
trigger1 = numenemy
trigger1 = teammode != simul
trigger1 = enemynear, hitfall = 0
trigger1 = enemynear, movetype = H
trigger1 = enemynear, statetype != A
trigger1 = enemynear, gethitvar(hitcount) >= 50
trigger1 = stateno != [3000, 4999]
trigger1 = !var(20)
value = 1
ignorehitpause = 1

[State -3, Unguardable Freeze]
type = assertspecial
triggerall = movetype = A
triggerall = !movecontact && !numtarget
triggerall = var(20) || stateno = 3120 || stateno = 3160
trigger1 = numenemy >= 1
trigger1 = enemynear(0), time <= 0
trigger1 = enemynear(0), stateno = 120
trigger1 = enemynear(0), anim != [120, 155]
trigger2 = numenemy >= 2
trigger2 = enemynear(0), time <= 0 && enemynear(1), time <= 0
trigger2 = enemynear(0), stateno = 120 && enemynear(1), stateno = 120
trigger2 = (enemynear(0), anim != [120, 155]) && (enemynear(1), anim != [120, 155])
flag = unguardable

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2
triggerall = !numhelper(705) && !var(20)
triggerall = (movetype = I && ctrl) || (stateno = [700, 702]) || stateno = 5120
trigger1 = !AIlevel
trigger1 = command != "rlsdir"
trigger1 = statetype = S || statetype = C || stateno = 5120
trigger1 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B") || (command = "D")
trigger2 = !AIlevel
trigger2 = command != "rlsdir"
trigger2 = statetype = A
trigger2 = var(3) != 1 && var(3) != 2
trigger2 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B")
trigger3 = AIlevel
trigger3 = inguarddist
trigger3 = stateno != [700, 702]
trigger3 = random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = AIlevel
trigger4 = stateno = [700, 702]
trigger4 = time = 14 && random < 667
helpertype = normal
stateno = 705
ID = 705
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = helper(705), stateno = 706
value = ifelse((helper(705), anim = 707), 702, ifelse((helper(705), anim = 706), 701, 700))
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 705)
attr = SA, AP
stateno = 700
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 706)
attr = C, AP
stateno = 701
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 707)
attr = SCA, AP
stateno = 702
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 =  map(parrynowalk) > 0
flag = nowalk

[State -3, NoWalk after Parry]
type = mapadd
trigger1 = map(parrynowalk) > 0
map = "parrynowalk"
value = -1

[State -3, Projectile Flag]
type = mapset
trigger1 = 1
map = "projflag"
value = 0
ignorehitpause = 1

[State -3, Projectile Flag]
type = mapset
triggerall = var(20) <= 0
triggerall = map(projflag) != 1
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1010 && numhelper(1015)
trigger2 = helper(1015), stateno = 1015
trigger3 = stateno != 1020 && numhelper(1025)
trigger3 = helper(1025), stateno = 1025
trigger4 = stateno != 3000 && numhelper(3005)
trigger4 = helper(3005), stateno = 3005
trigger5 = stateno != 3020 && numhelper(3025)
trigger5 = helper(3025), stateno = 3025
trigger6 = stateno != 3042 && numhelper(3045)
trigger6 = helper(3045), stateno = 3045
trigger7 = stateno != 3050 && numhelper(3055)
trigger7 = helper(3055), stateno = 3055
map = "projflag"
value = 1
ignorehitpause = 1

[State -3, Cancel into Normals Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(4) = 0
ignorehitpause = 1
[State -3, Cancel into Normals Check]
type = varset
triggerall = var(20)
trigger1 = var(20) && (stateno = [200, 699]) && (movecontact + movereversed)
trigger2 = var(20) && (stateno = [1000, 2999]) && statetype != A && ((movecontact + movereversed) || var(18))
var(4) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(6) = 0
ignorehitpause = 1
[State -3, Cancel Check]
type = varset
triggerall = stateno = [200, 2999]
trigger1 = var(20) && (stateno = [200, 699])
trigger2 = var(20) && (stateno = [1000, 2999]) && ((movecontact + movereversed) || var(18))
trigger3 = (stateno = [200, 699]) && time <= 2
trigger3 = prevstateno != [200, 699]
trigger4 = stateno = 200
trigger5 = stateno = 210 && anim = 210
trigger5 = (movecontact + movereversed) && animelemtime(5) < 0
trigger5 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger6 = stateno = 210 && anim = 211
trigger6 = (movecontact + movereversed) && animelemtime(4) < 0
trigger6 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger7 = stateno = 210 && anim = 212
trigger7 = (movecontact + movereversed) && animelemtime(5) < 0
trigger7 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger8 = stateno = 220 && anim = 221
trigger8 = (movecontact + movereversed) && animelemtime(4) < 0
trigger8 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger9 = stateno = 225
trigger9 = animelemtime(6) < 0 || ((movecontact + movereversed) && animelemtime(8) < 0)
trigger9 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger10 = stateno = 226
trigger10 = (movecontact + movereversed) && animelemtime(5) < 0
trigger10 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger11 = stateno = 230
trigger11 = (movecontact + movereversed) && animelemtime(5) < 0
trigger11 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger12 = stateno = 240 && anim = 241
trigger12 = (movecontact + movereversed) && animelemtime(5) < 0
trigger12 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger13 = stateno = 400
trigger14 = stateno = 410
trigger14 = (movecontact + movereversed) && animelemtime(5) < 0
trigger14 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger15 = stateno = 420
trigger15 = (movecontact + movereversed) && animelemtime(5) < 0
trigger15 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger16 = stateno = 430
trigger17 = stateno = 440
trigger17 = (movecontact + movereversed) && animelemtime(6) < 0
trigger17 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger18 = stateno = 450 && var(1) = 3
trigger18 = (movecontact + movereversed) && animelemtime(5) < 0
trigger18 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger19 = stateno = 600
trigger19 = (movecontact + movereversed) && animelemtime(4) < 0
trigger19 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger20 = stateno = 610 && anim = 611
trigger20 = (movecontact + movereversed) && animelemtime(5) < 0
trigger20 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger21 = stateno = 630 && anim = 630
trigger21 = (movecontact + movereversed) && animelemtime(4) < 0
trigger21 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger22 = stateno = 630 && anim = 631
trigger22 = (movecontact + movereversed) && animelemtime(4) < 0
trigger22 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger23 = stateno = 650 && anim = 651
trigger23 = (movecontact + movereversed) && animelemtime(6) < 0
trigger23 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
var(6) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(7) = 0
ignorehitpause = 1
[State -3, Super Cancel Check]
type = varset
triggerall = stateno = [200, 2999]
trigger1 = var(6)
trigger2 = stateno = 220 && anim = 220
trigger2 = (movecontact + movereversed) && animelemtime(7) < 0
trigger2 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger3 = stateno = 220 && anim = 221
trigger3 = (movecontact + movereversed) && animelemtime(7) < 0
trigger3 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger4 = stateno = 220 && anim = 222
trigger4 = (movecontact + movereversed) && animelemtime(5) < 0
trigger4 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger5 = stateno = 250 && anim = 250
trigger5 = (movecontact + movereversed) && animelemtime(6) < 0
trigger5 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger6 = stateno = 250 && anim = 251
trigger6 = (movecontact + movereversed) && animelemtime(6) < 0
trigger6 = ifelse(var(1) = 3, (prevstateno != [200, 699]), 1)
trigger7 = stateno = 1000
trigger7 = animelemtime(9) < 0 && var(18)
trigger8 = stateno = 1010
trigger8 = animelemtime(10) < 0 && var(18)
trigger9 = stateno = 1020
trigger9 = animelemtime(10) < 0 && var(18)
trigger10 = stateno = 1100
trigger10 = (movecontact + movereversed) = [1, 8]
trigger11 = stateno = 1110
trigger11 = (movecontact + movereversed) = [1, 8]
trigger12 = stateno = 1300
trigger12 = (movecontact + movereversed) = [1, 8]
trigger13 = stateno = 1310
trigger13 = (movecontact + movereversed) = [1, 8]
trigger14 = stateno = 1500
trigger14 = (movecontact + movereversed) = [1, 8]
trigger15 = stateno = 1520
trigger15 = (movecontact + movereversed) = [1, 8]
var(7) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(8) = 0
ignorehitpause = 1
[State -3, Hyper Cancel]
type = varset
triggerall = stateno = [3000, 4999]
trigger1 = stateno = 3000 && animelemtime(12) < 0 && var(18)
trigger2 = stateno = 3020 && anim = 3021 && animelemtime(7) < 0 && var(18)
trigger3 = stateno = 3100
trigger3 = !var(51)
trigger3 = (movecontact + movereversed) = [1, 8]
trigger4 = stateno = 3140
trigger4 = (movecontact + movereversed) = [1, 8]
trigger5 = stateno = 3160
trigger5 = (movecontact + movereversed) = [1, 8]
trigger6 = stateno = 3180
trigger6 = (movecontact + movereversed) = [1, 8]
trigger7 = stateno = 3310
trigger7 = animelemtime(5) >= 1
trigger7 = numtarget(3300)
trigger7 = target(3300), stateno = 3321;hitpause
var(8) = 1
ignorehitpause = 1

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && (var(3) = [2, 3])
trigger2 = stateno = 710 || stateno = 720 || stateno = 725
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
trans = add1

[State -3, EX Snd]
type = playsnd
triggerall = time = 1
trigger1 = stateno = 1010 || stateno = 1110 || stateno = 1210 || stateno = 1260 || stateno = 1310 || stateno = 1520
value = 7, 6
ignorehitpause = 1

[State -3, ExFlash]
type = palfx
triggerall = time >= 0
triggerall = !(gametime % 2) && time < 25
trigger1 = stateno = 1010 || stateno = 1110 || stateno = 1210 || stateno = 1260 || stateno = 1310 || stateno = 1520
time = 1
color = 0
mul = 256, 224, 0
add = 96, 96, 96
ignorehitpause = 1

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3000 && time = 3
trigger2 = stateno = 3020 && time = 3
trigger3 = stateno = 3100 && time = 3
trigger4 = stateno = 3140 && time = 3
trigger5 = stateno = 3180 && time = 3
trigger6 = stateno = 3200 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 0, 64, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3160 && time = 3
trigger2 = stateno = 3300 && time = 3
trigger3 = stateno = 3310 && animelem = 5
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 128, 0, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 3040 && time = 3
trigger2 = stateno = 3120 && time = 3
trigger3 = stateno = 3601 && time = 3
trigger4 = stateno = 4000 && time = 3
trigger5 = stateno = 368 && time = 1
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 || (stateno = [600, 699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20) > 0
trigger3 = stateno = 710 || stateno = 720 || stateno = 725 || stateno = 1400 || (stateno = 5982 && anim =1400)
trigger4 = (stateno = [3000, 4999])
trigger4 = (anim != [1101, 1102]) && (anim != [1111, 1112]) && stateno != 3052
trigger5 = stateno = 368 && animelemtime(2) < 0
time = 2
ignorehitpause = 1

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
redirectID = enemynear, ID
type = posset
trigger1 = numenemy
trigger1 = enemynear, pos y > 0
trigger1 = enemynear, time <= 0
trigger1 = enemynear, movetype = H
trigger1 = !(enemynear, hitshakeover)
y = 0
ignorehitpause = 1

[State -3, Jump Reset]
type = varset
trigger1 = var(3)
trigger1 = stateno != 40 && statetype != A
var(3) = 0

[State -3, Force Crossup]
type = width
triggerall = p2statetype != L
trigger1 = statetype = A && var(3) = 3
trigger2 = stateno = 1400 && animelemtime(6) >= 0
edge = -2, 0
ignorehitpause = 1

[State -3, Shin P2BodyDist X]
type = mapset
trigger1 = numenemy
trigger1 = p2dist x <= (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
trigger1 = p2dist x >= (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))
map = "p2bodydistx"
value = 0
ignorehitpause = 1
[State -3, Shin P2BodyDist X]
type = mapset
trigger1 = numenemy
trigger1 = p2dist x > 0
trigger1 = p2dist x > (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
map = "p2bodydistx"
value = p2dist x - (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
ignorehitpause = 1
[State -3, Shin P2BodyDist X]
type = mapset
trigger1 = numenemy
trigger1 = p2dist x < 0
trigger1 = p2dist x < (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))
map = "p2bodydistx"
value = p2dist x - (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A
triggerall = movetype != H && numenemy
triggerall = !(vel y > 0 && (pos y > -vel y))
triggerall = (vel x > 0 && (map(p2bodydistx) = [-vel x, 0])) || (vel x < 0 && (map(p2bodydistx) = [0, -vel x]))
trigger1 = p2statetype = S
trigger1 = (p2dist y - vel y) > (enemynear, const(size.height) + 13 - ifelse((stateno = [100, 106]), 16, 32))
trigger2 = p2statetype = C
trigger2 = (p2dist y - vel y) > (enemynear, const(size.height) - 13 - ifelse((stateno = [100, 106]), 16, 32))
trigger3 = p2statetype = L
trigger3 = (p2dist y - vel y) > (12 - ifelse((stateno = [100, 106]), 16, 32))
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < 250
value = 5000 + (var(1) = 2) * 10, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000 + (var(1) = 2) * 10, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive
trigger1 = stateno = [5000, 5010]
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5950
ignorehitpause = 1

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = var(20) && !numhelper(8600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(18)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(18)
trigger4 = stateno = 805 && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger5 = stateno = 810 && (animelemtime(4) = [0, 1])
helpertype = normal
stateno = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = !numhelper(8600) && !numhelper(7610)
trigger1 = movehit = [1, 4]
trigger1 = stateno = [3000, 4999]
trigger1 = var(23) := stateno
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(18)
trigger2 = var(23) := 3000
trigger3 = numhelper(3025)
trigger3 = helper(3025), var(18)
trigger3 = var(23) := 3020
trigger4 = numhelper(3045)
trigger4 = helper(3045), var(18)
trigger4 = var(23) := 3040
trigger5 = numhelper(3055)
trigger5 = helper(3055), var(18)
trigger5 = var(23) := 3050
trigger6 = stateno = 3310
trigger6 = var(23) := 3300
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1


[State -3, Antifreeze]
type = changestate
triggerall = !ctrl
triggerall = time >= 300
triggerall = roundstate = 2
trigger1 = pos y > 0 && screenpos y > gameheight
trigger2 = !selfanimexist(anim)
value = 5040

[State -3, Antifreeze]
type = targetstate
trigger1 = numtarget = 1
trigger1 = movetype != A
trigger1 = target, time >= 300
value = 51


;========================================<IKEMEN ENGINE FIXES>========================================
;Probably temporary

[State -3, OTG Position Fix]
redirectID = enemynear, ID
type = posset
trigger1 = numenemy
trigger1 = enemynear, pos y
trigger1 = enemynear, stateno = [5080, 5081]
y = 0
ignorehitpause = 1

[State -3, Drop Target];ReversalDef bug
type = targetdrop
trigger1 = numtarget
trigger1 = target, movetype != H
trigger1 = target, movereversed = 0

[State -3, Dizzy HitFall Reset]
redirectID = enemynear, ID
type = hitfallset
trigger1 = numenemy
trigger1 = enemynear, dizzy
trigger1 = enemynear, hitfall
trigger1 = enemynear, stateno = enemynear, const(statedizzy)
value = 0
ignorehitpause = 1

[State -3, No Redizzy]
type = mapset
trigger1 = numenemy
trigger1 = enemynear, dizzy
map = "redizzy"
value = 1
ignorehitpause = 1

[State -3, No Redizzy]
redirectID = enemynear, ID
type = dizzypointsset
trigger1 = map(redizzy)
value = enemynear, dizzypointsmax
ignorehitpause = 1

[State -3, No Redizzy]
type = mapset
trigger1 = numenemy
trigger1 = enemynear, movetype != H
map = "redizzy"
value = 0
ignorehitpause = 1

[State -3, Dizzy NHB];like classic games plus it bypasses the dizzy juggle issues
redirectID = enemynear, ID
type = nothitby
triggerall = numenemy
triggerall = enemynear, alive
triggerall = enemynear, stateno != const(statedizzy)
trigger1 = enemynear, dizzy
trigger2 = enemynear, dizzypoints <= 0
value = SCA
time = 2
ignorehitpause = 1

[State -3, Dizzy Points Regen Fix]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = target, gethitvar(damage)
trigger1 = (target, dizzypoints - target, gethitvar(dizzypoints)) >= target, dizzypointsmax
value = -10
ignorehitpause = 1

[State -3, Allow Win Pose Selection]
type = assertspecial
trigger1 = !AIlevel
trigger1 = roundstate = [3, 4]
flag = postroundinput

[State -3, Allow Win Pose Selection]
type = assertspecial
trigger1 = !AIlevel
trigger1 = roundstate = [3, 4]
trigger1 = command = "/a" || command = "/b" || command = "/c" || command = "/x" || command = "/y" || command = "/z" || command = "/s"
trigger1 = command != "a" || command != "b" || command != "c" || command != "x" || command != "y" || command != "z" || command != "s"
flag = roundnotskip
