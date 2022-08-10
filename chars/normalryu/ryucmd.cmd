; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;===================< BUTTON REMAPPING >===================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;===================< DEFAULT VALUES >===================

[Defaults]
command.time = 12
command.buffer.time = 1


;===================< COMMANDS >===================

[Command]
name = "D"
command = D
time = 1

[Command]
name = "DF"
command = DF
time = 1

[Command]
name = "F"
command = F
time = 1

[Command]
name = "UF"
command = UF
time = 1

[Command]
name = "U"
command = U
time = 1

[Command]
name = "UB"
command = UB
time = 1

[Command]
name = "B"
command = B
time = 1

[Command]
name = "DB"
command = DB
time = 1

[Command]
name = "$D"
command = $D
time = 1

[Command]
name = "$F"
command = $F
time = 1

[Command]
name = "$U"
command = $U
time = 1

[Command]
name = "$B"
command = $B
time = 1

[Command]
name = "/D"
command = /D
time = 1

[Command]
name = "/DF"
command = /DF
time = 1

[Command]
name = "/F"
command = /F
time = 1

[Command]
name = "/UF"
command = /UF
time = 1

[Command]
name = "/U"
command = /U
time = 1

[Command]
name = "/UB"
command = /UB
time = 1

[Command]
name = "/B"
command = /B
time = 1

[Command]
name = "/DB"
command = /DB
time = 1

[Command]
name = "/$D"
command = /$D
time = 1

[Command]
name = "/$F"
command = /$F
time = 1

[Command]
name = "/$U"
command = /$U
time = 1

[Command]
name = "/$B"
command = /$B
time = 1

[Command]
name = "~D"
command = ~D
time = 1

[Command]
name = "~DF"
command = ~DF
time = 1

[Command]
name = "~F"
command = ~F
time = 1

[Command]
name = "~UF"
command = ~UF
time = 1

[Command]
name = "~U"
command = ~U
time = 1

[Command]
name = "~UB"
command = ~UB
time = 1

[Command]
name = "~B"
command = ~B
time = 1

[Command]
name = "~DB"
command = ~DB
time = 1

[Command]
name = "~$D"
command = ~$D
time = 1

[Command]
name = "~$F"
command = ~$F
time = 1

[Command]
name = "~$U"
command = ~$U
time = 1

[Command]
name = "~$B"
command = ~$B
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

[Command]
name = "/a"
command = /a
time = 1

[Command]
name = "/b"
command = /b
time = 1

[Command]
name = "/c"
command = /c
time = 1

[Command]
name = "/x"
command = /x
time = 1

[Command]
name = "/y"
command = /y
time = 1

[Command]
name = "/z"
command = /z
time = 1

[Command]
name = "/s"
command = /s
time = 1

[Command]
name = "~a"
command = ~a
time = 1

[Command]
name = "~b"
command = ~b
time = 1

[Command]
name = "~c"
command = ~c
time = 1

[Command]
name = "~x"
command = ~x
time = 1

[Command]
name = "~y"
command = ~y
time = 1

[Command]
name = "~z"
command = ~z
time = 1

[Command]
name = "~s"
command = ~s
time = 1


;===================< REQUIRED >===================

[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

[Command]
name = "FF"    
command = F, F
time = 10

[Command]
name = "BB"    
command = B, B
time = 10

[Command]
name = "recovery"
command = a
time = 1

[Command]
name = "recovery"
command = b
time = 1

[Command]
name = "recovery"
command = c
time = 1

[Command]
name = "recovery"
command = x
time = 1

[Command]
name = "recovery"
command = y
time = 1

[Command]
name = "recovery"
command = z
time = 1


;====================< CHECKS >====================

[Command]
name = "rlsdir"
command = ~$F
time = 1

[Command]
name = "rlsdir"
command = ~$B
time = 1

[Command]
name = "rlsdir"
command = ~$U
time = 1

[Command]
name = "rlsdir"
command = ~$D
time = 1


;====================< OTHER >====================

[Command]
name = "counter_p"
command = F, x + y
time = 8

[Command]
name = "counter_p"
command = F, x + z
time = 8

[Command]
name = "counter_p"
command = F, y + z
time = 8

[Command]
name = "counter_k"
command = F, a + b
time = 8

[Command]
name = "counter_k"
command = F, a + c
time = 8

[Command]
name = "counter_k"
command = F, b + c
time = 8


;===========================================================================
;===============================< -1 STATES >=================================
;===========================================================================

[Statedef -1]

[State -1, Roll Forward]
type = changestate
value = 720
triggerall = !AIlevel
triggerall = map(cmd_ax)
triggerall = roundstate = 2 && statetype != A
trigger1 = command = "holdfwd"
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = changestate
value = 725
triggerall = !AIlevel
triggerall = map(cmd_ax)
triggerall = roundstate = 2 && statetype != A
trigger1 = command = "holdback"
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Dodge]
type = changestate
value = 710
triggerall = !AIlevel
triggerall = map(cmd_ax)
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101]))

[State -1, Ashura Senkuu]
type = changestate
value = 1400
triggerall = !AIlevel
triggerall = map(cmd_623kkk) || map(cmd_623ppp) || map(cmd_421kkk) || map(cmd_421ppp)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shun Goku Satsu]
type = changestate
value = 4000
triggerall = !AIlevel
triggerall = map(cmd_demon)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4000)
trigger3 = stateno = [200, 499]

[State -1, Shin Shoryuuken]
type = changestate
value = 3120
triggerall = !AIlevel
triggerall = map(cmd_236236kk)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && var(20) <= 60
triggerall = var(1) != 2
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100 && stateno != 3120)

[State -1, Metsu Shoryuuken]
type = changestate
value = 3160
triggerall = !AIlevel
triggerall = (var(1) = 2 && map(cmd_236236kk)) || (var(1) = 3 && map(cmd_236236pp))
triggerall = var(1) != 1
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3160)

[State -1, Metsu Hadouken]
type = changestate
value = 3040
triggerall = !AIlevel
triggerall = map(cmd_214214pp)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && var(20) <= 60
triggerall = var(1) != 1 && !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3042)

[State -1, Kaze no Ken]
type = changestate
value = 3300
triggerall = !AIlevel
triggerall = map(cmd_222pp)
triggerall = var(1) != 2
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3310)

[State -1, Denjin Hadouken]
type = changestate
value = 3020
triggerall = !AIlevel
triggerall = map(cmd_214214p)
triggerall = var(1) != 2
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
triggerall = !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3020)

[State -1, Reppu Jinrai Shou]
type = changestate
value = 3180
triggerall = !AIlevel
triggerall = map(cmd_236236k)
triggerall = var(1) = 3
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3180)

[State -1, Messatsu Gou Shoryuu]
type = changestate
value = 3140
triggerall = !AIlevel
triggerall = map(cmd_236236k)
triggerall = var(1) = 2
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3140)

[State -1, Nidan Shoryuu Tsuki]
type = changestate
value = 3100
triggerall = !AIlevel
triggerall = map(cmd_236236k)
triggerall = var(1) = 1
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100)

[State -1, Shinkuu Tatsumaki]
type = changestate
value = 3200
triggerall = !AIlevel
triggerall = map(cmd_214214k)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3200)

[State -1, Shinkuu Hadouken]
type = changestate
value = 3000
triggerall = !AIlevel
triggerall = map(cmd_236236p)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
triggerall = !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3000)

[State -1, EX Shoryuken]
type = changestate
value = 1110
triggerall = !AIlevel
triggerall = map(cmd_623pp)
triggerall = var(1) != 3
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Kuchuu Tatsumaki]
type = changestate
value = 1260
triggerall = !AIlevel
triggerall = map(cmd_root214kk)
triggerall = var(1) != 3
triggerall = roundstate = 2 && statetype = A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)
trigger3 = stateno = 245 && movecontact

[State -1, EX Tatsumaki]
type = changestate
value = 1210
triggerall = !AIlevel
triggerall = map(cmd_214kk)
triggerall = var(1) != 3
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Ryusokyaku]
type = changestate
value = 1520
triggerall = !AIlevel
triggerall = map(cmd_236kk)
triggerall = var(1) = 2
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Joudan]
type = changestate
value = 1310
triggerall = !AIlevel
triggerall = map(cmd_236kk)
triggerall = var(1) = 1
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Hadouken]
type = changestate
value = 1010
triggerall = !AIlevel
triggerall = map(cmd_236pp)
triggerall = var(1) != 3
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
triggerall = !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shakunetsu Hadouken]
type = changestate
value = 1020
triggerall = !AIlevel
triggerall = map(cmd_63214p)
triggerall = var(1) != 1
triggerall = roundstate = 2 && statetype != A
triggerall = !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shoryuken]
type = changestate
value = 1100
triggerall = !AIlevel
triggerall = map(cmd_623p)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Kuchuu Tatsumaki]
type = changestate
value = ifelse(var(1) = 3, 1270, 1250)
triggerall = !AIlevel
triggerall = map(cmd_root214k)
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Tatsumaki]
type = changestate
value = 1200
triggerall = !AIlevel
triggerall = map(cmd_214k)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Joudan Sokutou Geri]
type = changestate
value = 1300
triggerall = !AIlevel
triggerall = (var(1) = 1 && map(cmd_236k)) || (var(1) = 3 && map(cmd_41236k))
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Ryusokyaku]
type = changestate
value = 1500
triggerall = !AIlevel
triggerall = map(cmd_236k)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Hadouken]
type = changestate
value = 1000
triggerall = !AIlevel
triggerall = map(cmd_236p)
triggerall = roundstate = 2 && statetype != A
triggerall = !map(projflag)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Custom Combo]
type = changestate
value = ifelse(statetype = A, 765, 760)
triggerall = !AIlevel
triggerall = map(cmd_cz)
triggerall = roundstate = 2 && power >= 2000 && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Zero Counter]
type = changestate
value = 750
triggerall = !AIlevel
triggerall = command = "counter_p" || command = "counter_k"
triggerall = roundstate = 2 && power >= 1000 && statetype != A && !var(20)
trigger1 = stateno = 150 || stateno = 152
trigger2 = (stateno = 151 || stateno = 153) && time < 8

[State -1, Run]
type = changestate
value = 102
trigger1 = !AIlevel
trigger1 = map(cmd_66)
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, Back Dash]
type = changestate
value = 105
trigger1 = !AIlevel
trigger1 = map(cmd_44)
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl || stateno = 101

[State -1, Throw]
type = changestate
value = 800
trigger1 = !AIlevel
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = map(cmd_pthrow) || map(cmd_kthrow)
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl && stateno != 100

[State -1, Power Charge]
type = changestate
value = 740
trigger1 = !AIlevel
trigger1 = command = "/b" && command = "/y"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Seichuu Nidan Tsuki]
type = changestate
value = 226
triggerall = !AIlevel
triggerall = map(cmd_z)
triggerall = (var(1) = 2 && command = "holdfwd") || (var(1) = 3 && command = "holdback")
triggerall = command != "holddown" && statetype != A
triggerall = var(1) != 1
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Kyuubi Kudaki]
type = changestate
value = 225
triggerall = !AIlevel
triggerall = map(cmd_z)
triggerall = command = "holdfwd"
triggerall = command != "holddown" && statetype != A
triggerall = var(1) != 2
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, CHK]
type = changestate
value = 450
triggerall = !AIlevel
triggerall = map(cmd_c)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 225 || stateno = 226 || stateno = 230 || stateno = 240
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440

[State -1, CHP]
type = changestate
value = 420
triggerall = !AIlevel
triggerall = map(cmd_z)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, SHK]
type = changestate
value = 250
triggerall = !AIlevel
triggerall = map(cmd_c)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 225 || stateno = 226 || stateno = 230 || stateno = 240
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440

[State -1, SHP]
type = changestate
value = 220
triggerall = !AIlevel
triggerall = map(cmd_z)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Senpuu Kyaku]
type = changestate
value = 245
triggerall = !AIlevel
triggerall = map(cmd_b)
triggerall = command = "holdfwd"
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, Sakotsu Wari]
type = changestate
value = 215
triggerall = !AIlevel
triggerall = map(cmd_y)
triggerall = command = "holdfwd"
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, CMK]
type = changestate
value = 440
triggerall = !AIlevel
triggerall = map(cmd_b)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, CMP]
type = changestate
value = 410
triggerall = !AIlevel
triggerall = map(cmd_y)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, SMK]
type = changestate
value = 240
triggerall = !AIlevel
triggerall = map(cmd_b)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, SMP]
type = changestate
value = 210
triggerall = !AIlevel
triggerall = map(cmd_y)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, CLK]
type = changestate
value = 430
triggerall = !AIlevel
triggerall = map(cmd_a)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 200 || stateno = 400

[State -1, CLP]
type = changestate
value = 400
triggerall = !AIlevel
triggerall = map(cmd_x)
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)

[State -1, SLK]
type = changestate
value = 230
triggerall = !AIlevel
triggerall = map(cmd_a)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 200 || stateno = 400

[State -1, SLP]
type = changestate
value = 200
triggerall = !AIlevel
triggerall = map(cmd_x)
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)

[State -1, AHK]
type = changestate
value = 650
triggerall = !AIlevel
triggerall = map(cmd_c)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AHP]
type = changestate
value = 620
triggerall = !AIlevel
triggerall = map(cmd_z)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, TKK]
type = changestate
value = 645
triggerall = !AIlevel
triggerall = map(cmd_b)
triggerall = command = "holddown"
triggerall = statetype = A
triggerall = var(1) != 1
triggerall = vel x > 0 && pos y <= -75 && (var(3) != [1, 2])
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMK]
type = changestate
value = 640
triggerall = !AIlevel
triggerall = map(cmd_b)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMP]
type = changestate
value = 610
triggerall = !AIlevel
triggerall = map(cmd_y)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALK]
type = changestate
value = 630
triggerall = !AIlevel
triggerall = map(cmd_a)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALP]
type = changestate
value = 600
triggerall = !AIlevel
triggerall = map(cmd_x)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Hado no Kamae]
type = changestate
value = 1090
triggerall = !AIlevel
triggerall = map(cmd_236s)
triggerall = statetype != A
triggerall = var(1) != 2
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Taunt]
type = changestate
value = 195
triggerall = !AIlevel
triggerall = map(cmd_s)
triggerall = statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)


;===========================================================================
;=================================< A.I. >==================================
;===========================================================================

[State -1, AI Guarding Tranquilizer]
type = assertspecial
trigger1 = AIlevel
trigger1 = stateno = [120, 155]
flag = nohardcodedkeys

[State -1, AI Jump Less]
type = assertspecial
trigger1 = AIlevel
trigger1 = random < 750
flag = nojump

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && map(p2bodydistx) < 160 && enemynear, hitdefattr = SC, AT

[State -1, roll / dodge]
type = changestate
value = ifelse(random < 600, 720, 710)
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = enemynear, movetype = A && map(p2bodydistx) < 80

[State -1, ashurasenkuu]
type = changestate
value = 1400
triggerall = AIlevel && numenemy
triggerall = var(1) != 1 && statetype != A && roundstate = 2 && ctrl
triggerall = p2stateno != [1115310, 1115319]
trigger1 = enemynear, movetype = A && map(p2bodydistx) < 90 && (facing != enemynear, facing) && random < (500 * (AIlevel ** 2 / 64.0))
trigger2 = enemy, numproj > 0 && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = map(p2bodydistx) < 60 && enemy, hitdefattr = SC, AT && random < (750 * (AIlevel ** 2 / 64.0))
trigger3 = random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = var(10) := ifelse((random < (500 * (AIlevel ** 2 / 64.0)) || backedgedist < 100), 3, -3)

[State -1, Roll Fireballs]
type = changestate
value = 720
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = numenemy = 1
trigger1 = map(p2bodydistx) >= 120
trigger1 = enemynear, time >= 10 || p2movetype != A
trigger1 = inguarddist && !(enemynear, hitdefattr = SCA, AA, AT)
trigger1 = ifelse(map(p2bodydistx) < 180, (enemynear, animtime <= -30), 1)
trigger1 = random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155]) && stateno != 110
trigger1 = prevstateno != [720, 725]
trigger1 = !var(26) || map(p2bodydistx) >= 40
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = ifelse(statetype = A, ((var(3) != [1, 2]) || stateno = 5210), 1)
trigger1 = random < (ifelse((p2stateno = [200, 699]), 100, ifelse((p2stateno = [1000, 2999]), 333, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, run]
type = changestate
value = 102
trigger1 = AIlevel && numenemy
trigger1 = var(1) != 1
trigger1 = statetype = S && roundstate = 2 && ctrl && random < (200 * (AIlevel ** 2 / 64.0))
trigger1 = (stateno != [100, 105]) && enemynear, movetype != A && map(p2bodydistx) > 120

[State -1, dash]
type = changestate
value = 105
triggerall = AIlevel && numenemy
triggerall = statetype = S && roundstate = 2 && ctrl
triggerall = (map(p2bodydistx) = [0, 80]) && backedgebodydist > 80 && (stateno != [100, 105])
trigger1 = enemynear, movetype = A && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, stateno = 5120 && enemynear, animtime = -3 && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = AIlevel && numenemy
trigger1 = (p2dist x = [-90, 90]) && stateno = 150 || stateno = 152
trigger1 = roundstate = 2 && power >= 1000 && !var(20) && life < 500 && random < (10 * (AIlevel ** 2 / 64.0))

[State -1, powercharge]
type = changestate
value = 740
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = random < (50 * (AIlevel ** 2 / 64.0)) && !inguarddist && p2movetype != A && p2dist x >= 160

[State -1, Fall Recovery]
type = changestate
value = 5210
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && canrecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))

[State -1, Fall Recovery]
type = changestate
value = 5200
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && gethitvar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, taunt]
type = changestate
value = 195
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
trigger1 = p2dist x > 160 && (enemynear, vel y > 0) && ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = !(enemynear, ctrl) && (enemynear, movetype = H)

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 46]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SMP2]
type = changestate
value = 215
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 53]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && p2statetype = C && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 53]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, SHP3]
type = changestate
value = 226
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 60]) && (p2bodydist y = [-50, 50]) && (p2statetype = S || p2statetype = C)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (33 * (AIlevel ** 2 / 64.0))

[State -1, SHP2]
type = changestate
value = 225
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 46]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 1500 && !animtime
trigger2 = (map(p2bodydistx) = [0, 20]) && var(10) = 3

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 59]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall) && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMK2]
type = changestate
value = 245
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (33 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 20]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 59]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (map(p2bodydistx) = [0, 40]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (map(p2bodydistx) = [0, 45]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (map(p2bodydistx) = [0, 33]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (map(p2bodydistx) = [0, 54]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (map(p2bodydistx) = [0, 62]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (map(p2bodydistx) = [0, 56]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [0, 84]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [0, 78]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (ifelse((vel x > 0 && p2statetype = A), 250, 75) * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [0, 110]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [0, 70]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, TKK]
type = changestate
value = 645
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && statetype = A && roundstate = 2
triggerall = vel x > 0 && vel y >= 0 && pos y <= -70
triggerall = (map(p2bodydistx) > 0) && (p2bodydist y > 0)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [-50, 130]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (map(p2bodydistx) = [0, 130]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S && stateno != 100 && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (map(p2bodydistx) = [0, 20]) && (p2bodydist y = [-25, 25]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno != [120, 155]) && (map(p2bodydistx) = [0, 26]) && (p2bodydist y = [-25, 25]) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, shoryuuken]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 133), 1110, 1100)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) > 0) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = var(1) != 1 || !(enemynear, hitfall) || numtarget(1310) || numtarget(3120) || numtarget(3180)
trigger1 = (ctrl || (stateno = [100, 101])) && map(p2bodydistx) < 50 && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && map(p2bodydistx) < 30 && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (ctrl || (stateno = [100, 101])) && map(p2bodydistx) < 100 && p2dist y < -120 && random < (250 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && var(1) != 1 && prevstateno = 1209 && random < (200 * (AIlevel ** 2 / 64.0))
trigger5 = ctrl && (prevstateno = [1000, 1099])
trigger5 = p2statetype = A && enemynear, vel y > 0
trigger5 = random < (333 * (AIlevel ** 2 / 64.0))

[State -1, ryusokyaku]
type = changestate
value = 1500
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 2 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (map(p2bodydistx) = [0, 90]) && (p2bodydist y = [-180, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = [200, 499]) && stateno != 200 && stateno != 230 && stateno != 400 && stateno != 430
trigger1 = var(6) && movehit && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, joudansokutougeri]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 100), 1310, 1300)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (map(p2bodydistx) = [0, 90]) && (p2bodydist y = [-180, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Classic Air Tatsumaki]
type = changestate
value = 1270
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 3
triggerall = vel y > 0 || p2statetype = A
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl && map(p2bodydistx) < 160 && p2dist y <= -120 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, kuchuutatsumakisenpuukyaku]
type = changestate
value = ifelse((power >= 500 && random < 100), 1260, 1250)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 3
triggerall = vel y > 0 || p2statetype = A
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl && map(p2bodydistx) < 160 && p2dist y >= -120 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, tatsumakisenpuukyaku]
type = changestate
value = 1200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) = [0, 60]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = var(1) != 1 || !(enemynear, hitfall) || numtarget(1310) || numtarget(3120) || numtarget(3180)
trigger1 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, tatsumakisenpuukyaku]
type = changestate
value = 1210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = var(1) = 1 && power >= 500
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2dist x = [-60, 60]) && p2dist y >= -80 && (enemynear, vel y > -1) && (enemynear, vel x > -2) && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = ctrl && var(1) != 1 && prevstateno = 1100 && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, shakunetsuhadouken]
type = changestate
value = 1020
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = !map(projflag)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && p2dist x < 160 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 400 || stateno = 420) && var(6) && random < (125 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [200, 499]) && var(6) && random < (125 * (AIlevel ** 2 / 64.0))

[State -1, hadouken]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 100), 1010, 1000)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = !map(projflag)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && p2dist x > 160 && random < (150 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, shinshoryuken]
type = changestate
value = 3120
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) = [0, 30]) && p2dist y > -80 && (enemynear, vel y > -2) && (enemynear, vel x > -2)
triggerall = movetype = A || !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = ((stateno = [210, 214]) || (stateno = 420)) && (map(p2bodydistx) = [0, 10]) && var(7) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1100 && (map(p2bodydistx) = [0, 20]) && var(7) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, shungokusatsu]
type = changestate
value = 4000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A) && (enemynear, statetype != L) && (p2stateno != [5030, 5119])
triggerall = (p2dist x = [0, 160]) && (p2stateno != 40)
triggerall = ifelse((enemynear, vel y > 0), (enemynear, vel x < 0), (enemynear, vel y >= 0))
trigger1 = ctrl && (map(p2bodydistx) = [0, 90]) && (p2dist y = [-5, 5]) && random < (150 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 155]) && p2statetype != A && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = ctrl && (map(p2bodydistx) = [0, 90]) && (p2dist y = [-5, 5]) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, jinraishou]
type = changestate
value = 3180
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 3 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L && (p2statetype = S || p2statetype = C)
triggerall = (map(p2bodydistx) = [0, 70]) && p2dist y > -120 && (enemynear, vel y > -2) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3140 && anim = 3140 && animelemtime(26) >= 0 && var(8) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, metsushoryuken]
type = changestate
value = 3160
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) = [0, 80]) && (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -4)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1300 && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger5 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, metsuhadouken]
type = changestate
value = 3040
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60 && !inguarddist
triggerall = !map(projflag)
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A)
triggerall = p2dist x >= 160 && p2dist y > -120 && (enemynear, vel y > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (20 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && p2dist x >= 240 && random < (30 * (AIlevel ** 2 / 64.0))

[State -1, messatsugoushoryuu]
type = changestate
value = 3140
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) = [0, 60]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = ((stateno = [200, 499])) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = ((stateno = [1100, 1110]) || (stateno = [1300, 1310])) && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [1000, 4999]) && var(18) && stateno != 3020
trigger6 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, nidanshoryuutsuki]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 1 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L && p2statetype != A && p2statetype != L
triggerall = (map(p2bodydistx) = [0, 80]) && (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -4)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse((enemynear, hitfall), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1300 && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger6 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, shinkuutatsumakisenpuukyaku]
type = changestate
value = 3200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (map(p2bodydistx) = [-50, 50]) && p2dist y >= -90 && (enemynear, vel y > -1) && abs(enemynear, vel x) < 2
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (25 * (AIlevel ** 2 / 64.0))
trigger3 = ((stateno = [1100, 1110]) || stateno = 1310) && var(7) && random < (25 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger7 = stateno = 3000 && numhelper(3005)
trigger7 = helper(3005), var(18) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, denjinhadouken]
type = changestate
value = 3020
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60 && !inguarddist
triggerall = !map(projflag) || stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 3000
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A)
triggerall = map(p2bodydistx) < 80 && p2dist y > -80
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = (stateno = 1100 || stateno = 1300) && var(7) && movehit

[State -1, shinkuuhadouken]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
triggerall = !map(projflag) || stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 3020
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (map(p2bodydistx) = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && (map(p2bodydistx) = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || (stateno = [1300, 1310])) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0)) && !var(33)
trigger5 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger7 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger7 = random < (50 * (AIlevel ** 2 / 64.0))
trigger8 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))
