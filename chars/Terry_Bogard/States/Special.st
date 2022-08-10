;                          ____________________
;=========================|Terry Bogard by Memo|=========================
;                          ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Power Wave
[Statedef 1000]
type=S
physics=S
movetype=A
anim=1000
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1000, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim =1004
ID =1004
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Power Wave]
type = Helper
trigger1 = animelem = 7
stateno = 1001
ID =1001
name = "PowerWave"
postype = p1
pos = 60,0
keyCtrl = 1
size.xscale=.4*const(size.xscale)
size.yscale=.4*const(size.yscale)
ownpal = 1
sprpriority = 5

[STATE 1000,WIDTH]
type = Width
trigger1 = 1
edge = 55,0

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Power Wave
[Statedef 1030]
type=S
physics=S
movetype=A
anim=1030
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1030,Posset]
type=posset
trigger1=!time
y=0

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1030, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim =1004
ID =1004
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(5) = 2
x = 8

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(6) = 1
x = 6

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(6) = 2
x = 4

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(7) = 1
x = 2

[STATE 1030,WIDTH]
type = Width
trigger1 = 1
edge = 55,0

[State 1030, EX Power Wave]
type = Helper
trigger1 = animelem = 7 
stateno = 1001
ID =1001
name = "EXPowerWave"
postype = p1
pos = 60,0
size.xscale=.4*const(size.xscale)
size.yscale=.4*const(size.yscale)
ownpal = 1

[State 1000, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim =1034
ID =1034
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1030, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Round Wave
[Statedef 1050]
type=S
physics=S
movetype=A
anim=1000
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,2
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 3000, Fire1]
type = Explod
trigger1 = AnimElem = 7
Anim = 3008
pos = 85,0
postype = p1
ownpal = 1
sprpriority = 5
supermovetime = -1
scale = .4,.4

[State 3000, Fire1]
type = Explod
trigger1 = AnimElem = 7
Anim = 1290
pos = 70, 0
postype = p1
ownpal = 1
sprpriority = 5
supermovetime = -1
scale = 1,1

[State 1000, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim =1004
ID =1004
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Round Wave]
type = Helper
trigger1 = animelem = 7
stateno = 1002
ID =1002
name = "RoundWave"
postype = p1
pos = 85,0
keyCtrl = 1
size.xscale = .4
size.yscale = .4
ownpal = 1
sprpriority = 5

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1030, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Round Wave
[Statedef 1055]
type=S
physics=S
movetype=A
anim=1030
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1030,Posset]
type=posset
trigger1=!time
y=0

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,2
channel = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1030, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim =1004
ID =1004
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(5) = 2
x = 8

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(6) = 1
x = 6

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(6) = 2
x = 4

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElemtime(7) = 1
x = 2


[State 1030, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1030, EX Round Wave]
type = Helper
trigger1 = animelem = 7 
stateno = 1003
ID =1003
name = "EXRoundWave"
postype = p1
pos = 42,0
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1030, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Rising Tackle
[Statedef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1100,Posset]
type=posset
trigger1=!time
y=0

[State 1100, Button]
type=varset
trigger1= !time && !AILevel
var(10)= ifelse((command="z" || command="rlsz"), 2, ifelse((command="y" || command="rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0 && !var(10)
trigger2 = AnimElemTime(4) < 0 && var(10)
value = SCA
time = 1

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1120, ifelse(var(10)=1, 1110, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,2

[State 1100, Woosh Sound]
type = PlaySnd
triggerall = anim=1100
trigger1 = AnimElem = 6 || AnimElem = 7
value = 1100,2

[State 1100, Woosh Sound]
type = PlaySnd
triggerall = Anim = 1110
trigger1 = AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
value = 1100,2

[State 1100, Woosh Sound]
type = PlaySnd
triggerall = Anim = 1120
trigger1 = AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11
value = 1100,2

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 3

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
statetype = A
physics = N

[State 1100, Dust]
type = helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = animelem = 4
x = ifElse(var(10) = 2, 5.12493896484375, ifElse(var(10) = 1, 3.309860229492188, 1.494781494140625))
y = ifElse(var(10) = 2, -9.75, ifElse(var(10) = 1, -8.75, -7.75))

[State 1100, Velmul]
type = Velmul
trigger1 = animelemtime(4) > 0
x= 0.85415773463179600253159388334252

[State 1100, VelAdd]
type = VelAdd
trigger1 = animelemtime(5) > 0
Y = 0.5

[State 1100, First Hit]
type=hitdef
triggerall = (var(15)=0) || var(20)
trigger1 = AnimElem = 3
id = 1100
kill = 0
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 8,4
guard.pausetime = 8,8
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 3.5,-8.5;1,-7
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = 1,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1100, Anim 1100 Hit]
type = HitDef
id = 1100
triggerall = anim=1100
trigger1 = AnimElem = 6 || AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1,-8
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -1,-8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Anim 1110 Hit]
type = HitDef
id = 1100
triggerall = Anim = 1110
trigger1 = AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = MA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1,-8
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -1,-8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Anim 1110 Hit]
type = HitDef
id = 1100
triggerall = Anim = 1120
trigger1 = AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11
attr = A, SA
hitFlag = MAF
guardFlag = MA
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1,-8
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -1,-8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101

;------------------------------------
;Rising Tackle (Land)
[Statedef 1101]
type=S
physics=N
movetype=I
anim=1101
ctrl=0
velset=0,0
sprpriority=1

[state 1101,Posset]
type=posset
trigger1=!time
y=0

[State 1101, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1101, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1101, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Rising Tackle
[Statedef 1130]
type=S
physics=N
movetype=A
anim=1130
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1130,Posset]
type=posset
trigger1=!time
y=0

[State 1130, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1130, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1130, ExFX]
type = varset
trigger1 = !time
var(25) = 49

[State 1130, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -38, -10
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 =AnimElemNo(0) = [1,2]
value = SCA
time = 1

[State 1130, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = animelemtime(5)>=0
trigger1 = animelemtime(11)<0
trigger2 = AnimElem = 17
value = 1100,2

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 1130, Dust]
type = helper
trigger1 = !animtime
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1130, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A
physics = N

[State 1130, Dust]
type = helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 7.940017700195313
y = -9.75

[State 1130, Velmul]
type = Velmul
trigger1 = animelemtime(4) > 0
x= 0.85415773463179600253159388334252

[State 1130, VelAdd]
type = VelAdd
trigger1 = animelemtime(6) > 1
Y = 0.5

[State 1130, Hit]
type=hitdef
triggerall= (var(15)<18 || var(20))
trigger1 = animelemtime(5)>=0
trigger1 = animelemtime(11)<0
id = 1130
kill = 0
attr = S,SA
hitflag = MAF
guardflag = M
damage = 10,1
getPower = 0,0
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = .2,-8
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = 1,-8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
forcestand = 1

[State 1130, Hit 2]
type = HitDef
trigger1 = AnimElem = 15
id = 1130
attr = A, SA
hitFlag = MAF
guardFlag = MA
damage = 23,1
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.16, -10.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -10.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=8), var(36):=-56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
forcestand = 1

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(18) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101	

;---------------------------------------------------------------------------
;Burn Knuckle
[Statedef 1200]
type=S
physics=N
movetype=A
anim=1200
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[state 1200,Posset]
type=posset
trigger1=!time
y=0

[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1200, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1220, ifelse(var(10)=1, 1210, 1200))

[State 1200, Snd]
type = playsnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1200, Snd]
type = playsnd
trigger1 = AnimElemTime(2) = 6
value = 1200,2
channel = 1

[State 1200, StateType]
type = StateTypeSet
trigger1 = AnimElem=8
StateType = A
physics = N

[State 1200, Dust]
type = helper
trigger1 = Animelem=8
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1200, Width]
type = Width
trigger1 = 1
edge = 50,0

[STATE 1200,DUST]
type = helper
trigger1 = animelem = 8 || animelem = 9
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 6603
pos = 89,-76
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
removetime = -1
ID = 6603
sprpriority = 2
scale = .5,.5

[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 6604
pos = 89,-76
postype = p1
ownpal = 1
bindtime = 1
vel = -.6,0
removeongethit = 1
pausemovetime = 255
removetime = -2
ID = 6604
sprpriority = 3
scale = .5,.5

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem=8 
x = ifElse(var(10) = 2, 14, ifElse(var(10) = 1, 11, 9))
y = ifElse(var(10) = 2, -1.5, ifElse(var(10) = 1, -1.3, -1))

[State 1200, Gravity]
type = Veladd
trigger1 = AnimElemTime(8) > 0
y = 0.21875

[State 1200, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1200
trigger1 = AnimElemNo(0) = [1,7]
trigger2 = Anim = 1210
trigger2 = AnimElemNo(0) = [1,7]
trigger3 = Anim = 1220
trigger3 = AnimElemNo(0) = [1,7]
value = ,NP,SP,AP
time = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity =-6.5,-4.5; -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity =-6.5,-4.5; -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
air.cornerpush.veloff = 0
yaccel = .49;0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, ChangeState]
type = ChangeState
triggerall = Animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1201

;------------------------------------
;Burn Knuckle (Land)
[Statedef 1201]
type=S
physics=N
movetype=I
anim=1201
velset=0,0
ctrl=0

[state 1201,Posset]
type=posset
trigger1=!time
y=0

[State 1201, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 6603

[State 1201, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 1201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1201, PosSet]
type = PosSet
trigger1 = AnimElem = 2
y = 0

[State 1201, velSet]
type = VelSet
trigger1 = AnimElem = 2
y = 0

[State 1201, Velmul]
type = Velmul
trigger1 = !Time
x = .92

[State 1201, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 52,0

[State 1201, Dust]
type = explod
trigger1 = AnimElem = 2
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Burn Knuckle
[Statedef 1230]
type=S
physics=N
movetype=A
anim=1230
ctrl=0
velset=0,0
sprpriority=1
powerAdd = -500
facep2=1

[state 1230,Posset]
type=posset
trigger1=!time
y=0

[State 1230, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1230, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1230, ExFX]
type = varset
trigger1 = !time
var(25) = 28

[State 1230, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -32, -74
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1230, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1230, Snd]
type = playsnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1230, Snd]
type = playsnd
trigger1 = AnimElemTime(2) = 6
value = 1200,2
channel = 3

[State 1230, Dust]
type = helper
trigger1 = Animelem=5
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1230, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 1230, Explod]
type = Explod
trigger1 = animelem =5
anim = 6644
ID = 6644
pos = 82,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 24
removeongethit = 1
ignorehitpause = 1

[State 1230, Explod]
type = Explod
trigger1 = AnimElem = 5
Anim = 6186
pos = 5, 0
postype = p1
facing = 1
ownpal = 1
sprpriority = 3
supermovetime = -1
scale = .5,.5

[State 1230, Spark]
type = Explod
trigger1 = AnimElem = 5
anim = 2290
pos = 95,-78
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
ignorehitpause = 0
removetime = -2
ID = 2290
sprpriority = 3
scale = .5,.5

[State 1230, Velocity]
type = VelSet
trigger1 = AnimElem = 5
x = 20

[State 1230, VelMul]
type = Velmul
trigger1 = AnimElemtime(11) >= 1
x = .88

[State 1230, VelMul]
type = Velset
trigger1 = AnimElemtime(13) >= 1
x = 0

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1230
trigger1 = animelemtime(1)<0
value = SCA,NP
time = 1

[State 1230, Hit]
type=hitdef
trigger1= (var(15)<5 || var(20))
trigger1 = animelemtime(5)>=0
trigger1 = animelemtime(11)<0
ID = 1230
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = -7.81851892471313, -2.7484527587891
ground.cornerpush.veloff = 0
guard.velocity = -7.81851892471313
guard.cornerpush.veloff = 0
air.velocity = -7.81851892471313, -2.7484527587891
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
persistent = 2
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1230, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Power Dunk
[Statedef 1300]
type=S
physics=S
movetype=A
anim=1300
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1300,Posset]
type=posset
trigger1=!time
y=0

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(((Power < 1000 && Random < 500) || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, Dust]
type = helper
trigger1 = Animelem=4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = AnimElem = 11
value = 1200,2
channel = 2

[State 1300, Explod]
type = Explod
trigger1 = AnimElemTime(11) = 0
anim = 1492
ID =1492
pos = 70,-20
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause=1

[State 1300, Explod]
type = Explod
trigger1 = AnimElemTime(9) = 0
anim = 66046
ID =66046
pos = 70,-20
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 20,9
channel = 0

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S80,9
channel = 1
ignorehitpause = 1
persistent = 1

[State 1300, VelSet]
type = VelSet
trigger1 = animelemtime(4) = 0
x = ifElse(var(10) = 2, 5.05, ifElse(var(10) = 1, 4.75, 2.25))
y = ifElse(var(10) = 2, -12, ifElse(var(10) = 1, -9.75, -9.75))

[State 1300, VelAdd]
type = VelAdd
trigger1 = Animelemtime(4) > 0
y = .65

[State 1300, StateTypeSet]
type = StateTypeSet
trigger1 = Animelemtime(4) = 0
statetype = A
physics = N

[State 1200, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 1200, Width]
type = Width
trigger1 = animelem=12
edge = 50,0

;First Punch Light
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 1300
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage = 28,1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -1.03655853271484, -3.46969699859619
ground.velocity = -1.03655853271484, -6.76163694859619
ground.cornerpush.veloff = 0
guard.velocity = -4.03655853271484
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Second Punch Light
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11 
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
damage = 70,2
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
guard.pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
animtype = Heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
air.velocity = -4,11
ground.velocity = -4,11
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
air.fall = 1
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -24
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;First Punch Medium
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 1300
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage =  28,1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -1.03655853271484, -4.46969699859619
ground.velocity = -1.03655853271484, -6.76163694859619
ground.cornerpush.veloff = 0
guard.velocity = -4.03655853271484
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Second Punch Medium
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
damage = 75,2
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
guard.pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
animtype = Heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
air.velocity = -4,11
ground.velocity = -4,11
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
air.fall = 1
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -24
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;First Punch Heavy
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 1300
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage = 28,1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -2.03655853271484, -6.26969699859619
ground.velocity = -1.03655853271484, -9.06969699859619
ground.cornerpush.veloff = 0
guard.velocity = -4.03655853271484
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Second Punch Heavy
[State 1300, Hit]
type = hitdef
triggerall = Var(10)=2
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
damage = 80,2
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
guard.pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
animtype = Heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
air.velocity = -4,11
ground.velocity = -4,11
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
air.fall = 1
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -24
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

[State 1300, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301

;------------------------------------
;Power Dunk (Land)
[Statedef 1301]
type=S
physics=N
movetype=I
anim=1301
velset=0,0
ctrl=0

[state 1301,Posset]
type=posset
trigger1=!time
y=0

[State 1301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1301, PosSet]
type = PosSet
trigger1 = AnimElem = 2
y = 0

[State 1301, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = 0

[State 1301, Velmul]
type = Velmul
trigger1 = !Time
x = .92

[State 1301, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 66046

[State 1301, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1301, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Power Dunk
[Statedef 1330]
type=S
physics=S
movetype=A
anim=1330
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1330,Posset]
type=posset
trigger1=!time
y=0

[State 1330, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1330, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1330, ExFX]
type = varset
trigger1 = !time
var(25) = 157

[State 1330, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 11,-62
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1330, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1330, Dust]
type = helper
trigger1 = Animelem=4
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1330, Snd]
type = playsnd
trigger1 = AnimElem = 11
value = 1200,2
channel = 1

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13
trigger2 = AnimElem = 16 || AnimElem = 19 || AnimElem = 22 || AnimElem = 25
value = 1,2

[State 1330, Explod]
type = Explod
trigger1 = AnimElemTime(11) = 0
anim = 1492
ID =1492
pos = 70,-20
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause=1

[State 1330, Explod]
type = Explod
trigger1 = AnimElemTime(9) = 0
anim = 66046
ID =66046
pos = 70,-20
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 20,9
channel = 0

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S80,9
channel = 1
ignorehitpause = 1
persistent = 1

[State 1330, PosAdd]
type = PosAdd
trigger1 = animelemtime(3) = 1
x = 16

[State 1330, VelSet]
type = VelSet
trigger1 = animelemtime(4) = 0
x =  5.62493896484375
y = -12.05

[State 1330, VelAdd]
type = VelAdd
trigger1 = Animelemtime(4) > 0
y = .75

[State 1330, StateTypeSet]
type = StateTypeSet
trigger1 = Animelemtime(4) = 0
statetype = A
physics = N

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1330
trigger1 = AnimElemNo(0) = [1,2]
value = SCA,NP
time = 1

;First Punch 
[State 1330, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
ID = 1330
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 6, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -0.03655853271484, -7.26969699859619
ground.velocity = -0.03655853271484, -7.96969699859619
ground.cornerpush.veloff = 0
guard.velocity = -4.03655853271484
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Second Punch
[State 1330, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 4
ID = 1330
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givepower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 12, 12), ifElse(var(20), 12, 12)
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -0,-7
ground.velocity = -0,-7
ground.cornerpush.veloff = 0
guard.velocity = -6
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 42), var(36) := -75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Third Punch 
[State 1330, Hit]
type = hitdef
p2stateno = 242;===Ground bounce state
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 11
ID = 1330
attr = S, SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
air.velocity = -4,11
ground.velocity = -4,11
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
air.fall = 1
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -24
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

[State 1330, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301

;---------------------------------------------------------------------------
;Fire Kick
[Statedef 1400]
type=S
physics=S
movetype=A
anim=1400
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1400,Posset]
type=posset
trigger1=!time
y=0

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 64, 2, ifElse(P2Dist x > 46, 1, 0))

[State 1400, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1420, ifelse(var(10)=1, 1410, 1400))

[State 1400, PlaySnd]
type=playsnd
trigger1= !Time 
value= s1400,0
channel=0
[State 1400, PlaySnd]
type=playsnd
trigger1= !Time 
value= s1400,0
channel=2

[State 1400, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 101,0
channel = 1

[STATE 1400,DUST]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1400, Velocity]
type = VelSet
trigger1 = AnimElem=3
x = ifElse(var(10) = 2, 21.5886793136597, ifElse(var(10) = 1, 17.5886793136597, 11.5630588531494))

[State 1400, Gravity]
type = Veladd
trigger1 = AnimElem=5
x = 0.938345646381378
y = 0

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1400
trigger1 = AnimElemNo(0) = [1,7]
trigger2 = Anim = 1410
trigger2 = AnimElemNo(0) = [1,7]
trigger3 = Anim = 1420
trigger3 = AnimElemNo(0) = [1,7]
value = ,NP,SP
time = 1

[State 1400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 1400
kill = 0
attr = S,SA
hitflag = M
guardflag = L
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 48, ifElse(var(10), 45, 40)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 48, ifElse(var(10), 45, 40)))), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 20
ground.slidetime = 20
guard.hittime = 20
air.hittime = 120
ground.velocity = 1
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.83, -2.64)
guard.cornerpush.veloff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=79), var(36):=-11
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1400, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1400)
value = 1401

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1400, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Fire Kick (Follow Up)
[Statedef 1401]
type=S
physics=S
movetype=A
anim=1401
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1401,Posset]
type=posset
trigger1=!time
y=0

[State 1401, Snd]
type=playsnd
trigger1= animelem=5
value= 1400,1
channel=0
[State 1401, Snd]
type=playsnd
trigger1= animelem=5
value= 1400,1
channel=1
[State 1401, Snd]
type=playsnd
trigger1= animelem=5
value= 1400,1
channel=2

[State 1401, Position]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
x = 12

[State 1401, Velocity]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1401, Position]
type = PosAdd
trigger1 = AnimElem = 8
x = 18

[State 1401, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1401
trigger1 = AnimElemNo(0) = [1,5]
value = ,NP,SP
time = 1

[State 1401, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= !Time
ID = 1401
attr = S,SA
hitflag = MAF
guardflag = M
damage = 50,1
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2,-11.5750007629395
ground.cornerpush.veloff = 0
guard.velocity = -2
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
air.fall = 1
fall.recover = 0
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=74), var(36):=-116
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1401, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1401, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && roundstate = 2 && enemy, stateno != 1455
triggerall = p2statetype != A ;&& p2bodydist x < 60 && numenemy
trigger1 = movehit && animelem = 8
value = ifelse((power = [1000, 1999]), 3300, 3000)

;---------------------------------------------------------------------------
;EX Fire Kick
[Statedef 1430]
type=S
physics=S
movetype=A
anim=1430
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1430,Posset]
type=posset
trigger1=!time
y=0

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, ExFX]
type = varset
trigger1 = !time
var(25) = 48

[State 1430, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -32, -0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1430, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1430, PlaySnd]
type=playsnd
trigger1= !Time 
value= s1400,0
channel=0

[State 1430, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 101,0
channel = 2

[STATE 1430,DUST]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1430, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 28.5886793136597

[State 1430, Velset]
type = Velset
trigger1 = AnimElemTime(5) > 0
x = 0

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1430
trigger1 = AnimElemNo(0) = [1,7]
value = ,NP,SP
time = 1

[State 1430, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= !Time
ID = 1430
kill = 0
attr = S,SA
hitflag = M
guardflag = L
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.83, -2.64)
guard.cornerpush.veloff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=79), var(36):=-11
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1430, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1430)
value = 1431

[State 1430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1430, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Fire Kick (Follow Up)
[Statedef 1431]
type=S
physics=S
movetype=A
anim=1431
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[state 1431,Posset]
type=posset
trigger1=!time
y=0

[State 1431, Snd]
type=playsnd
trigger1= animelem=3
value= 1700,0
channel=0

[State 1431, ExFX]
type = varset
trigger1 = !time
var(25) = 25

[State 1431, Position]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
x = 12

[State 1431, Velocity]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1431, Position]
type = PosAdd
trigger1 = AnimElem = 8
x = 18

[State 1431, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1431
trigger1 = AnimElemNo(0) = [1,3]
value = ,NP,SP
time = 1

[State 1431, Hit]
type=hitdef
trigger1= AnimElem = 5
p2stateno = 1125;===wall bounce state
ID = 1431
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -7,-8
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -7, -7)
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
air.fall = 1
air.fall = 1
fall.recover = 0
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=72), var(36):=-116
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1431, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1431, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Crack Shot
[Statedef 1500]
type=S
physics=N
movetype=A
anim=1500
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1500,Posset]
type=posset
trigger1=!time
y=0

[State 1500, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 1502
pos = 0,0
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
ID = 1502
sprpriority = 2

[State 1500, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 150, 2, ifElse(P2Dist x > 120, 1, 0))

[State 1500, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1520, ifelse(var(10)=1, 1510, 1500))

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 1

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0
channel = 0

[State 1500, Width]
type=Width
trigger1=AnimElemTime(3)=1
player = 24, 0
edge = 10, 0

[State 1500, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1500, VelSet]
type = VelSet
trigger1 = animelemtime(3) = 0
x = ifElse(var(10) = 2, 4.75, ifElse(var(10) = 1, 4.75, 4.5))
y = ifElse(var(10) = 2, -9.37, ifElse(var(10) = 1, -7.86, -7))

[State 1500, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = 0.9

[State 1500, Dust]
type = helper
trigger1 = animelem = 3
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1500, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A
physics = N

[State 1500, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1500
trigger1 = AnimElemNo(0) = [1,7]
trigger2 = Anim = 1510
trigger2 = AnimElemNo(0) = [1,7]
trigger3 = Anim = 1520
trigger3 = AnimElemNo(0) = [1,7]
value = ,NP,SP,AP
time = 1

[State 1500, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5 
ID = 1500
attr = A,SA
hitflag = MAF
guardflag = HA
damage = 32,1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 20
ground.slidetime = 20
guard.hittime = 20
air.hittime = 120
ground.velocity = -3.1796875
ground.cornerpush.veloff = 0
guard.velocity =-3.1796875
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall.yvelocity = -3
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-96
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1500, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
ID = 1500
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 74, ifElse(var(10), 67, 60)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 74, ifElse(var(10), 67, 60)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 20
ground.slidetime = 20
guard.hittime = 20
air.hittime = 120
ground.velocity = -11.1796875
ground.cornerpush.veloff = 0
guard.velocity =-11.1796875
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall.yvelocity = -3
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=64), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1500, End]
type = ChangeState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1501

;-----------------------------------
;Crack Shot (Land)
[Statedef 1501]
type=S
anim=1501
physics=N
movetype=A
velset=0,0

[state 1501,Posset]
type=posset
trigger1=!time
y=0

[State 1501, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1501, Anim]
type=changeanim
trigger1= !time
value= ifelse(prevstateno = 1530, 1531, ifelse(var(10)=2, 1521, ifelse(var(10)=1, 1511, 1501)))

[State 1501, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1501, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1501, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Crack Shot
[Statedef 1530]
type=S
physics=N
movetype=A
anim=1530
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1530,Posset]
type=posset
trigger1=!time
y=0

[State 1530, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1530, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1530, ExFX]
type = varset
trigger1 = !time
var(25) = 30

[State 1530, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -39, -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1530, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1500, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 1532
pos = 0,0
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
ID = 1532
sprpriority = 2

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 3

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0
channel = 0

[State 1530, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 4

[State 1530, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 8.75
y = -7.37

[State 1530, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 0
y = 0.9

[State 1530, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1530, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = N

[State 1530, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1530
trigger1 = AnimElemNo(0) = [1,3]
value = SCA,NP
time = 1

[State 1530, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= Animelem = 4 
ID = 1530
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -1.40
ground.cornerpush.veloff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -2.40, -6.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=15), var(36):=-110
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1530, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= Animelem = 5 
ID = 1530
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.40
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4.40, -6.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-96
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1530, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= Animelem = 6
ID = 1530
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getpower = 0, 0
givepower = 36,36
pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pauseTime = 10,10
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 20
ground.slidetime =20
guard.hittime = 20
air.hittime = 120
ground.velocity = -8.5,-3
ground.cornerpush.veloff = 0
guard.velocity = -15.52
guard.cornerPush.velOff = 0
air.velocity = -7.40, 6.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=66), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1530, ChangeState]
type = ChangeState
trigger1 = pos y - 30 > -vel y
value = 1501

;-------------------------------------
;Power Charge
[Statedef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1600,Posset]
type=posset
trigger1=!time
y=0

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1620, ifElse(var(10) = 1, 1610, 1600))

[State 1600, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 1

[State 1600, Snd]
type=playsnd
trigger1= animelem=4
value=1700,0
channel=0

[State 1600, Dust]
type = helper
trigger1 = animelem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1600, VelSet]
type = VelSet
trigger1 = animelem = 4
x = ifElse(var(10) = 2, 13.5, ifElse(var(10) = 1, 10.8, 8))

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1600, VelMul]
type = VelMul
trigger1 = Movehit
x = .88

[State 1600, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .88

[State 1600, Explod]
type = Explod
trigger1 = animelem =4
anim = 6044
ID = 6044
pos = 25,0
postype = p1
facing = 1
vfacing = 1
bindtime = 12
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 30
removeongethit = 1
ignorehitpause = 1

[State 1600, NotHitBy]
type = NotHitBy
trigger1 =animelemtime(3)<0
value = SCA
time = 1

[State 1600, Hit]
type = HitDef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
id=1600
attr = S, SA
hitFlag = MA
guardFlag = MA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 102 , ifElse(var(10), 95, 90)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 102, ifElse(var(10), 95, 90)))), 7
getPower = 0,0
givePower = 0,0
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.75, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -11.1796875
guard.cornerPush.velOff = 0
air.velocity = -2.75, -7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.yvelocity = -3
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1600, Idle]
type=statetypeset
trigger1= animelem = 5
movetype=I

[State 1600, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Power Charge
[Statedef 1630]
type=S
physics=N
movetype=A
anim=1630
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[state 1630,Posset]
type=posset
trigger1=!time
y=0

[State 1630, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1630, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1630, ExFX]
type = varset
trigger1 = !time
var(25) = 104

[State 1630, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 20, -79
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1630, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 0

[State 1600, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 18.5

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1600, VelSet]
type = VelMul
trigger1 = Movehit
x = .88

[State 1600, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .88

[State 1630, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 3

[State 1630, Snd]
type=playsnd
trigger1= animelem=4
value=1700,0
channel=1

[State 1630, Dust]
type = helper
trigger1 = animelem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1630, NotHitBy]
type = NotHitBy
trigger1 =AnimElemNo(0) = [1,2]
value = SCA
time = 1

[State 1630, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
id=1630
attr = S, SA
hitFlag = MA
guardFlag = MA
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
getPower = 0,0
givePower = 0,0
pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.75, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -5.75, -7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 1)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=33), var(36):=-50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, Idle]
type=statetypeset
trigger1= animelem=5
movetype=I

[State 1630, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================< ZERO COUNTER >=============================
;PUNCH ZERO COUNTER
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[state 2900,Posset]
type=posset
trigger1=!time
y=0

[State 1200, Snd]
type = playsnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1200, Snd]
type = playsnd
trigger1 = AnimElemTime(2) = 6
value = 1200,2
channel = 1

[State 1200, StateType]
type = StateTypeSet
trigger1 = AnimElem=8
StateType = A
physics = N

[State 1200, Dust]
type = helper
trigger1 = Animelem=8
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1200, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 6603
pos = 89,-76
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
removetime = -1
ID = 6603
sprpriority = 2
scale = .5,.5

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem=8
x = 12
y = -1

[State 1200, Gravity]
type = Veladd
trigger1 = AnimElemTime(8) > 0
y = 0.21875

[State 1200, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1200
trigger1 = AnimElemNo(0) = [1,9]
value = SCA
time = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 2900
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 12,12
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity =-6.5,-4.5; -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity =-6.5,-4.5; -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
air.cornerpush.veloff = 0
yaccel = .49;0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1200, ChangeState]
type = ChangeState
triggerall = Animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1201


;========================< ZERO COUNTER >=============================
;KICK ZERO COUNTER
[Statedef 2910]
type = S
physics = N
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[state 2910,Posset]
type=posset
trigger1=!time
y=0

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(9) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1300, Dust]
type = helper
trigger1 = Animelem=4
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = AnimElem = 11
value = 1200,2
channel = 2

[State 1300, Explod]
type = Explod
trigger1 = AnimElemTime(11) = 0
anim = 1492
ID =1492
pos = 70,-20
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause=1

[State 1300, Explod]
type = Explod
trigger1 = AnimElemTime(9) = 0
anim = 66046
ID =66046
pos = 70,-20
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 20,9
channel = 0

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S80,9
channel = 1
ignorehitpause = 1
persistent = 1

[State 1300, VelSet]
type = VelSet
trigger1 = animelemtime(4) = 0
x = 2.25
y = -9.75

[State 1300, VelAdd]
type = VelAdd
trigger1 = Animelemtime(4) > 0
y = .65

[State 1300, StateTypeSet]
type = StateTypeSet
trigger1 = Animelemtime(4) = 0
statetype = A
physics = N

;First Punch 1300
[State 1300, Hit]
type = hitdef
triggerall = anim = 1300
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 2910
kill = 0
attr = S, SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime =6,12
animtype = heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
air.velocity = -1.03655853271484, -3.46969699859619
ground.velocity = -1.03655853271484, -6.76163694859619
ground.cornerpush.veloff = 0
guard.velocity = -4.03655853271484
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.49
fall = 1
fall.recover = 0
air.fall = 1
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = S-1 + 0 * (var(33) := 8013)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

;Second Punch 1300
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11 
ID = 2910
attr = S, SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = 12,12
animtype = Heavy
air.animtype = hard
fall.animtype = hard
ground.type = low
air.type = low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
air.velocity = -4,11
ground.velocity = -4,11
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
air.fall = 1
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = S-1 + 0 * (var(33) := 8013)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -24
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
persistent = 0
forcestand = 1
down.bounce = 1
p2facing = 1

[State 1300, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301