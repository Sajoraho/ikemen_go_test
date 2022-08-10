; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------
[Command]
name = "somersault_strike"
command = ~45DB, $F, $B, $U, a
time = 45

[Command]
name = "somersault_strike"
command = ~45DB, $F, $B, $U, b
time = 45

[Command]
name = "somersault_strike"
command = ~45DB, $F, $B, $U, c
time = 45

[Command]
name = "somersault_strike"
command = ~45DB, DF, DB, $UF, a
time = 45

[Command]
name = "somersault_strike"
command = ~45DB, DF, DB, $UF, b
time = 45

[Command]
name = "somersault_strike"
command = ~45DB, DF, DB, $UF, c
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, $F, $B, $U, x
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, $F, $B, $U, y
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, $F, $B, $U, z
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, DF, DB, $UF, x
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, DF, DB, $UF, y
time = 45

[Command]
name = "somersault_slash"
command = ~45DB, DF, DB, $UF, z
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, $F, $B, $F, x
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, $F, $B, $F, y
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, $F, $B, $F, z
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, F, B, F, x
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, F, B, F, y
time = 45

[Command]
name = "sonic_hurricane"
command = ~30$B, F, B, F, z
time = 45

[Command]
name = "sonic_break"
command = ~30$B, F, B, F, x+y
time = 35

[Command]
name = "sonic_break"
command = ~30$B, F, B, F, x+z
time = 35

[Command]
name = "sonic_break"
command = ~30$B, F, B, F, y+z
time = 35

[Command]
name = "opening_gambit"
command = ~30$B, $F, $B, $F, a
time = 45

[Command]
name = "opening_gambit"
command = ~30$B, $F, $B, $F, b
time = 45

[Command]
name = "opening_gambit"
command = ~30$B, $F, $B, $F, c
time = 45

[Command]
name = "opening_gambit"
command = ~30$B, F, B, F, a
time = 45

[Command]
name = "opening_gambit"
command = ~30$B, F, B, F, b
time = 45

[Command]
name = "opening_gambit"
command = ~30$B, F, B, F, c
time = 45

[Command]
name = "sonic_typhoon"
command = ~30$B,F,x
time = 35

[Command]
name = "sonic_typhoon"
command = ~30$B,F,y
time = 35

[Command]
name = "sonic_typhoon"
command = ~30$B,F,z
time = 35

[Command]
name = "Cross_Assault"
command = ~D,F,D,F,a+b
time = 35

[Command]
name = "Cross_Assault"
command = ~D,F,D,F,a+c
time = 35

[Command]
name = "Cross_Assault"
command = ~D,F,D,F,b+c
time = 35

[Command]
name = "total_wipeout"
command = ~D,F,D,F, a
time = 30

[Command]
name = "total_wipeout"
command = ~D,F,D,F, b
time = 30

[Command]
name = "total_wipeout"
command = ~D,F,D,F, c
time = 30

[Command]
name = "Final_Mission"
command = ~30$B, F, a+b
time = 30

[Command]
name = "Final_Mission"
command = ~30$B, F, a+c
time = 30

[Command]
name = "Final_Mission"
command = ~30$B, F, b+c
time = 30

;-| Super Motions(Cancel Commands) |---------------------------------------

[Command]
name = "sonic_hurricane_nohold"
command = ~B, $F, $B, $F, x
time = 30

[Command]
name = "sonic_hurricane_nohold"
command = ~B, $F, $B, $F, y
time = 30

[Command]
name = "sonic_hurricane_nohold"
command = ~B, $F, $B, $F, z
time = 30

[Command]
name = "opening_gambit_nohold"
command = ~B, $F, $B, $F, a
time = 30

[Command]
name = "opening_gambit_nohold"
command = ~B, $F, $B, $F, b
time = 30

[Command]
name = "opening_gambit_nohold"
command = ~B, $F, $B, $F, c
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "flash_a"
command = ~30$D,U,a
time = 30

[Command]
name = "flash_b"
command = ~30$D,U,b
time = 30

[Command]
name = "flash_c"
command = ~30$D,U,c
time = 30

[Command]
name = "rflash_a"
command = ~D,F,a
time = 15

[Command]
name = "rflash_b"
command = ~D,F,b
time = 15

[Command]
name = "rflash_c"
command = ~D,F,c
time = 15

[Command]
name = "pdriver_x"
command = ~D,B, x
time = 10

[Command]
name = "pdriver_y"
command = ~D,B, y
time = 10

[Command]
name = "pdriver_z"
command = ~D,B, z
time = 10

[Command]
name = "energy_blast_x"
command = ~B, F,x
time = 10

[Command]
name = "energy_blast_y"
command = ~B, F,y
time = 10

[Command]
name = "energy_blast_z"
command = ~B, F,z
time = 10

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
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
name = "1"
command = x
time = 1

[Command]
name = "1"
command = y
time = 1

[Command]
name = "1"
command = z
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

; Super Jump
;-----------
[command]
name = "superjump"
command = ~$D,U
time = 15
[command]
name = "superjumpf"
command = ~$D,UF
time = 15
[command]
name = "superjumpb"
command = ~$D,UB
time = 15

;--- None of your own command definitions should be above this line. ---

;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+y
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
[state -1, Super Jump]
type = changestate
triggerall = (command = "superjump" || command = "superjumpf" || command = "superjumpb")
triggerall = (statetype!= a) && !var(9)
trigger1 = ctrl
value = ifelse(command = "superjump",7000,ifelse(command = "superjumpf",7002,7004))

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !var(9)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !var(9)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = !var(9)
triggerall = command = "b" || command = "c"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

[State -1, Throw]
type = ChangeState
value = 830
triggerall = !var(9)
triggerall = command = "y" || command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

[State -1, Throw]
type = ChangeState
value = 840
triggerall = !var(9)
triggerall = command = "y" || command = "z"
triggerall = statetype = A
triggerall = ctrl
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = A)
trigger1 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !var(9)
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Sonic Boom Typhoon
[State -1, Sonic Boom Typhoon]
type = ChangeState
value = 3200
triggerall = !var(9)
triggerall = power >= 3000
trigger1 = command = "sonic_typhoon"
trigger1 = StateType = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; CrossFire Assault
[State -1, CrossFire Assault]
type = ChangeState
value = 3100
triggerall = !var(9)
triggerall = power >= 3000
trigger1 = command = "Cross_Assault"
trigger1 = StateType = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Final Mission
[State -1, Final Mission]
type = ChangeState
value = 3000
triggerall = !var(9)
triggerall = power >= 3000
trigger1 = command = "Final_Mission"
trigger1 = StateType = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Sonic Break
[State -1, Sonic Break]
type = ChangeState
value = 2500
triggerall = !var(9)
triggerall = power >= 2000
triggerall = command = "sonic_break"
trigger1 = StateType = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Total Wipeout
[State -1, Total Wipeout]
type = ChangeState
value = 2400
triggerall = !var(9)
triggerall = power >= 2000
triggerall = command = "total_wipeout"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = StateNo = 2200 && MoveContact && Anim = 2200

;---------------------------------------------------------------------------
; Sonic Hurricane
[State -1, Sonic Hurricane]
type = ChangeState
value = 2300
triggerall = !var(9)
triggerall = power >= 1000
trigger1 = command = "sonic_hurricane"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = StateNo = 1000 && numhelper(1001) != 0
trigger2 = command = "sonic_hurricane_nohold"
trigger3 = StateNo = 2200 && MoveContact && Anim = 2200
trigger3 = command = "sonic_hurricane_nohold"

;---------------------------------------------------------------------------
; Opening Gambit
[State -1, Opening Gambit]
type = ChangeState
value = 2200
triggerall = !var(9)
triggerall = power >= 1000
trigger1 = command = "opening_gambit"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = StateNo = 1000 && numhelper(1001) != 0
trigger2 = command = "opening_gambit_nohold"
trigger3 = (StateNo = [2000,2001]) && MoveContact && (AnimElemTime(2)>=0 && AnimElemTime(8) < 0)
trigger3 = command = "opening_gambit_nohold"

;---------------------------------------------------------------------------
; Somersault Slash
[State -1, Somersault Slash]
type = ChangeState
value = 2100
triggerall = !var(9)
triggerall = power >= 1000
triggerall = command = "somersault_slash"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = StateNo = 40
trigger3 = StateNo = 7000
trigger4 = StateNo = 2200 && MoveContact && Anim = 2200
trigger5 = StateNo = 2000 && MoveContact && (AnimElemTime(2)>=0 && AnimElemTime(19) < 0)

;---------------------------------------------------------------------------
; Somersault Strike
[State -1, Somersault Strike]
type = ChangeState
value = 2000
triggerall = !var(9)
triggerall = power >= 1000
triggerall = command = "somersault_strike"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = StateNo = 40
trigger3 = StateNo = 7000
trigger4 = StateNo = 2200 && MoveContact && Anim = 2200

;---------------------------------------------------------------------------
; Spinning Pile Driver
[State -1, Pile Driver]
type = ChangeState
value = 1050
triggerall = !var(9)
triggerall = (command = "pdriver_x"||command = "pdriver_y"||command = "pdriver_z")
triggerall = P2MoveType != H
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Reverse F.Kick
[State -1, Air Reverse F. Kick]
type = ChangeState
value = 1022
triggerall = !var(9)
triggerall = (command = "rflash_a"||command = "rflash_b"||command = "rflash_c")
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = StateNo = 1010 && movecontact

;---------------------------------------------------------------------------
; Reverse F.Kick
[State -1, Reverse F. Kick]
type = ChangeState
value = 1020
triggerall = !var(9)
triggerall = (command = "rflash_a"||command = "rflash_b"||command = "rflash_c")
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Flash Kick
[State -1, Flash Kick]
type = ChangeState
value = 1010
triggerall = !var(9)
triggerall = (command = "flash_a"||command = "flash_b"||command = "flash_c")
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 40
trigger3 = stateno = 7000
trigger4 = (stateno = [400,450]) && movecontact

;---------------------------------------------------------------------------
; Sonic Boom
[State -1, Sonic Boom]
type = ChangeState
value = 1000
triggerall = !var(9)
triggerall = (command = "energy_blast_x"||command = "energy_blast_y"||command = "energy_blast_z")
triggerall = !numhelper(1001)
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (StateNo = [200,250]) && MoveContact
;---------------------------------------------------------------------------
[State -1, sparry]
type=hitoverride
triggerall=!var(9)&&roundstate=2&&statetype=S
triggerall=command="fwd"&&command!="back"&&command!="up"&&command!="down"
trigger1=ctrl||stateno=700||stateno=701
trigger1=var(21):=1
trigger2=(stateno=[150,153])
trigger2=var(21):=-1
attr=SA,AA,AP
stateno=700
slot=0
time=ifelse((stateno=[150,153]),4,8)

;---------------------------------------------------------------------------
[State -1, cparry]
type=hitoverride
triggerall=!var(9)&&roundstate=2&&statetype!=A
triggerall=(statetype=S&&command="down")||(statetype=C&&command="fwd")&&command!="back"&&command!="up"
trigger1=ctrl||stateno=700||stateno=701
trigger1=var(21):=2
trigger2=(stateno=[150,153])
trigger2=var(21):=-2
attr=C,AA,AP
stateno=701
slot=0
time=ifelse((stateno=[150,153]),4,8)

;---------------------------------------------------------------------------
[State -1, aparry]
type=hitoverride
triggerall=!var(9)&&roundstate=2&&statetype=A
triggerall=command="fwd"&&command!="back"&&command!="up"&&command!="down"
trigger1=ctrl||stateno=702
trigger1=var(21):=3
trigger2=(stateno=[154,155])
trigger2=var(21):=-3
attr=SA,AA,AP
stateno=702
forceair=1
slot=0
time=ifelse((stateno=[154,155]),4,8)

;---------------------------------------------------------------------------
[State -1, resetparry]
type=hitoverride
trigger1=(statetype=S||statetype=C)&&var(21)!=1&&var(21)!=-1&&var(21)!=2&&var(21)!=-2
trigger2=statetype=A&&var(21)!=3&&var(21)!=-3
trigger3=movetype=A||(movetype=H&&(stateno!=[120,155]))
trigger4=!ctrl
slot=0
time=0

;---------------------------------------------------------------------------
; Dodge
[State -1, Dodge]
type = ChangeState
value = 510
triggerall = !var(9)
triggerall = command = "x" && command = "a"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
value = 500
triggerall = !var(9)
triggerall = command = "hold_b" && command = "hold_y"
trigger1 = Power < 3000
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------

; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !var(9)
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = (StateNo = [210,220]) && MoveContact
trigger4 = StateNo = 222 && MoveContact
trigger5 = StateNo = 230 && MoveContact
trigger6 = StateNo = 400 && MoveContact

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = !var(9)
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = (StateNo = [210,220]) && MoveContact
trigger4 = StateNo = 222 && MoveContact
trigger5 = StateNo = 230 && MoveContact
trigger6 = StateNo = 400 && MoveContact

;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = !var(9)
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = (StateNo = [210,220]) && MoveContact
trigger4 = StateNo = 230 && MoveContact

; Turn Fist
[State -1, Turn Fist =~~]
type = ChangeState
value = 222
triggerall = !var(9)
triggerall = command = "z" && command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 230 && MoveContact
trigger4 = StateNo = 400 && MoveContact

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = ifelse(command = "holdfwd"||command = "holdback",270,230)
triggerall = !var(9)
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 400 && MoveContact

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = !var(9)
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 230 && MoveContact
trigger3 = StateNo = 400 && MoveContact

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = !var(9)
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, ssk-back]
type = changestate
value = 252
triggerall = !var(9)
triggerall = command = "c" && command = "holdback" && command != "holdfwd"
triggerall = command != "holddown"
trigger1 = (statetype = s) && ctrl

[State -1, ssk-fwd]
type = changestate
value = ifelse(p2bodydist X<=35,254,253)
triggerall = !var(9)
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = !var(9)
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = !var(9)
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = !var(9)
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = !var(9)
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = !var(9)
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = !var(9)
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !var(9)
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = !var(9)
triggerall = command = "y"
trigger1 = p2bodydist X >= 10
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = !var(9)
triggerall = command = "z"
trigger1 = p2bodydist X >= 10
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !var(9)
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = !var(9)
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = !var(9)
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; A.I COMMANDS!!!! xD
[State -1, Da balls are inert!]
type = ChangeState
value = 120
triggerall = var(9)!=0
triggerall = random < 100*var(9)
triggerall = ctrl
triggerall = Enemy, StateType = A || Enemy, StateType = S
triggerall = Enemy, StateType != C
trigger1 = StateType = S
trigger1 = P2BodyDist X < 50
trigger2 = Enemy, NumProj > 0
trigger3 = Enemy, MoveType = A
trigger4 = InGuardDist

[State -1]
type = ChangeState
value = 120
triggerall = var(9)!=0
triggerall = random < 100*var(9)
triggerall = ctrl
triggerall = Enemy, StateType = A || Enemy, StateType = S
triggerall = Enemy, StateType != C
trigger1 = StateType = A
trigger1 = P2BodyDist X < 50
trigger2 = Enemy, NumProj > 0
trigger3 = Enemy, MoveType = A
trigger4 = InGuardDist

[State -1]
type = ChangeState
value = 120
triggerall = var(9)!=0
triggerall = random < 100*var(9)
triggerall = ctrl
triggerall = Enemy, StateType = C
trigger1 = StateType = C
trigger1 = P2BodyDist X < 50
trigger2 = Enemy, NumProj > 0
trigger3 = Enemy, MoveType = A
trigger4 = InGuardDist

[State -1]
type = ChangeState
value = IfElse(Random < 155,200,IfElse(Random < 155,210,IfElse(Random < 155, 220, IfElse(Random < 155,230,IfElse(Random < 155,240,250)))))
triggerall = var(9) != 0
triggerall = (random < 100/6)*var(9)
triggerall = ctrl
triggerall = Enemy, StateType != L
triggerall = StateType = S
trigger1 = P2BodyDist X < 50
trigger1 = Enemy, StateNo != [120,155]
trigger2 = Enemy, NumProj <= 0
trigger3 = !InGuardDist

[State -1]
type = ChangeState
value = IfElse(Random < 155,600,IfElse(Random < 155,610,IfElse(Random < 155, 620, IfElse(Random < 155,630,IfElse(Random < 155,640,650)))))
triggerall = var(9) != 0
triggerall = (random < 100/6)*var(9)
triggerall = ctrl
triggerall = Enemy, StateType != L
triggerall = StateType = A
trigger1 = P2BodyDist X < 50
trigger1 = Enemy, StateNo != [120,155]
trigger2 = Enemy, NumProj <= 0
trigger3 = !InGuardDist

[State -1]
type = ChangeState
value = IfElse(Random < 155,400,IfElse(Random < 155,410,IfElse(Random < 155, 420, IfElse(Random < 155,430,IfElse(Random < 155,440,450)))))
triggerall = var(9) != 0
triggerall = (random < 100/6)*var(9)
triggerall = ctrl
triggerall = Enemy, StateType != L
triggerall = StateType = C
trigger1 = P2BodyDist X < 50
trigger1 = Enemy, StateNo != [120,155]
trigger2 = Enemy, NumProj <= 0
trigger3 = !InGuardDist

[State -1]
type = ChangeState
value = 500
trigger1 = var(9)!=0
trigger1 = roundstate=2 && statetype = S
trigger1 = power < 3000 && ctrl
trigger1 = random < 50*(var(9)/2) && !inguarddist && p2movetype != A
trigger1 = p2bodydist x >= 160

[State -1]
type = ChangeState
value = 510
triggerall = var(9)>=0
triggerall = random < 120*var(9)
triggerall = ctrl
triggerall = StateType = S
triggerall = Enemy, MoveType = A
trigger1 = P2BodyDist X < 40
trigger2 = Enemy, NumProj > 0

[State -1]
type=hitoverride
triggerall = var(9)!=0 && roundstate=2 && statetype = S
trigger1 = ctrl || stateno=700 || stateno = 701
trigger1 = var(21) := 1
trigger2=(stateno=[150,153])
trigger2=var(21) := -1
attr=SA,AA,AP
stateno=700
slot=0
time=ifelse((stateno=[150,153]),4,8)

[State -1]
type=hitoverride
triggerall = var(9)!=0 && roundstate=2 && statetype = C
trigger1 = ctrl || stateno=700 || stateno = 701
trigger1 = var(21) := 1
trigger2=(stateno=[150,153])
trigger2=var(21) := -1
attr=SA,AA,AP
stateno=701
slot=0
time=ifelse((stateno=[150,153]),4,8)

[State -1]
type=hitoverride
triggerall = var(9)!=0 && roundstate=2 && statetype = A
trigger1 = ctrl
trigger1 = var(21) := 1
trigger2=(stateno=[150,153])
trigger2=var(21) := -1
attr=SA,AA,AP
stateno=702
slot=0
time=ifelse((stateno=[150,153]),4,8)

[State -1]
type = ChangeState
value = 1000
triggerall = var(9) != 0
triggerall = random < 100*var(9)
triggerall = Ctrl && (!NumHelper(1001))
triggerall = Enemy, StateType != L
triggerall = StateType = S
trigger1 = P2BodyDist X > 180
trigger1 = Enemy, Stateno != [120,155]
trigger2 = Enemy, NumProj > 0
trigger3 = Enemy, MoveType = A
trigger4 = (Stateno = [200,222]) && MoveHit

[State -1, Da balls are inert!]
type = ChangeState
value = 1010
triggerall = var(9) != 0
triggerall = random < 60*var(9)
triggerall = Ctrl
triggerall = Enemy, StateType != L
triggerall = StateType = S
triggerall = P2BodyDist X < 60
trigger1 = Enemy, Stateno != [120,155]
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [230,250]) && movehit

[State -1]
type = ChangeState
value = 1022
triggerall = var(9) != 0
triggerall = random < 100*var(9)
triggerall = Ctrl
triggerall = StateType = A
triggerall = StateNo = 1010 && MoveContact && HitCount > 1
trigger1 = P2BodyDist X < 60
trigger1 = Enemy, Stateno != [120,155]
trigger2 = Enemy, NumProj <= 0

[State -1]
type = ChangeState
value = 1050
triggerall = var(9) != 0
triggerall = (random < 100/20)*var(9)
triggerall = Ctrl
triggerall = StateType = S
triggerall = Enemy, MoveType != H
triggerall = P2BodyDist X < 20
trigger1 = Enemy, MoveType != A
trigger2 = Enemy, NumProj <= 0
trigger3 = !InGuardDist

[State -1, Agarra]
type = ChangeState
value = IfElse(Random < 499,800,830)
triggerall = var(9) != 0
triggerall = (random < 100/20)*var(9)
triggerall = Ctrl
triggerall = StateType = S
triggerall = P2BodyDist X < 20
triggerall = Enemy, NumProj <= 0
trigger1 = Enemy,MoveType !=H
trigger1 = Enemy, MoveType != A
trigger2 = !InGuardDist
trigger3 = StateNo = [200,250]
trigger3 = MoveContact
trigger4 = (StateNo = [252,254]) && MoveContact
trigger5 = StateNo = 270 && MoveContact

[State -1, Agarra]
type = ChangeState
value = 840
triggerall = var(9) != 0
triggerall = (random < 100/20)*var(9)
triggerall = Ctrl
triggerall = StateType = S
triggerall = P2BodyDist X < 20
triggerall = Enemy, NumProj <= 0
trigger1 = Enemy,StateType = A
trigger2 = !InGuardDist

[State -1, It's over 9000!!!!]
type = ChangeState
value = 2000
triggerall = var(9) != 0
triggerall = random < 80*(var(9)/0.5)
triggerall = Ctrl
triggerall = power >= 1000
triggerall = StateType = S
triggerall = P2Dist X < 50
trigger1 = stateno=1000&&numhelper(1001)
trigger1 = helper(1001),movehit
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [200,220]) && MoveHit
trigger4 = (StateNo = [252,254]) && MoveHit
trigger5 = StateNo = 2200 && MoveHit && AnimElem = 34, = 0

[State -1, It's over 9000!!!!]
type = ChangeState
value = 2200
triggerall = var(9) != 0
triggerall = random < 80*(var(9)/0.5)
triggerall = Ctrl
triggerall = power >= 1000
triggerall = StateType = S
triggerall = P2Dist X < 50
trigger1 = stateno=1000&&numhelper(1001)
trigger1 = helper(1001),movehit
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [200,220]) && MoveHit
trigger4 = (StateNo = [252,254]) && MoveHit

[State -1, It's over 9000!!!!]
type = ChangeState
value = 2100
triggerall = var(9) != 0
triggerall = random < 80*(var(9)/0.5)
triggerall = Ctrl
triggerall = power >= 1000
triggerall = StateType = S
triggerall = P2Dist X < 50
trigger1 = stateno=1000&&numhelper(1001)
trigger1 = helper(1001),movehit
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [200,220]) && MoveHit
trigger4 = (StateNo = [252,254]) && MoveHit
trigger5 = StateNo = 2200 && MoveHit && AnimElem = 34, = 0

[State -1, It's over 9000!!!!]
type = ChangeState
value = 2300
triggerall = !NumHelper(2301)
triggerall = var(9) != 0
triggerall = random < 80*(var(9)/0.5)
triggerall = Ctrl
triggerall = power >= 1000
triggerall = StateType = S
triggerall = P2Dist X < 50
trigger1 = stateno=1000&&numhelper(1001)
trigger1 = helper(1001),movehit
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [200,220]) && MoveHit
trigger4 = (StateNo = [252,254]) && MoveHit
trigger5 = StateNo = 2200 && MoveHit && AnimElem = 34, = 0

[State -1, It's over 9000!!!!!!]
type = ChangeState
triggerall = Ctrl
triggerall = var(9) != 0
triggerall = random < 50*(var(9)*0.5)
triggerall = power >= 2000
triggerall = StateType = S
triggerall = P2Dist X < 40
trigger1 = StateNo = 1000&&Numhelper(1001)
trigger1 = Helper(1001),MoveHit
trigger2 = Enemy, NumProj <= 0
trigger3 = (StateNo = [200,220]) && MoveHit
trigger4 = StateNo = 2200 && MoveHit && AnimElem = 34, = 0
trigger5 = Enemy, StateType != L
value = 2400

[State -1, It's over 9000!!!!!!]
type = ChangeState
triggerall = Ctrl
triggerall = var(9) != 0
triggerall = random < 50*(var(9)*0.5)
triggerall = power >= 2000
triggerall = StateType = S
trigger1 = P2Dist X > 95
trigger2 = StateNo = 1000&&Numhelper(1001)
trigger2 = Helper(1001),MoveHit
trigger3 = Enemy, NumProj <= 0
trigger4 = StateNo = 2200 && MoveHit && AnimElem = 34, = 0
trigger5 = Enemy, StateType != L
value = 2500

[State -1, It's over 9000!!!!!!!!]
type = ChangeState
triggerall = Ctrl
triggerall = var(9) != 0
triggerall = random < 20*(var(9)*0.5)
triggerall = power >= 3000
triggerall = StateType = S
trigger1 = P2Dist X < 37
trigger2 = Enemy, NumProj <= 0
trigger4 = Enemy, StateType != L
value = 3000

[State -1, It's over 9000!!!!!!!!]
type = ChangeState
triggerall = Ctrl
triggerall = var(9) != 0
triggerall = random < 20*(var(9)*0.5679752)
triggerall = power >= 3000
triggerall = StateType = A
triggerall = Pos Y < -20
trigger1 = P2Dist X > 40 && P2Dist X <= 110
trigger2 = Enemy, NumProj <= 0
trigger4 = Enemy, StateType != L
value = 3100

[State -1, It's over 9000!!!!!!!!]
type = ChangeState
triggerall = !NumHelper(3201)
triggerall = Ctrl
triggerall = var(9) != 0
triggerall = random < 20*(var(9)*0.5864621)
triggerall = power >= 3000
triggerall = StateType = S
trigger1 = P2Dist X > 60
trigger2 = Enemy, NumProj <= 0
trigger4 = Enemy, StateType != L
value = 3200


