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
;==================================================================================
;======| RELACIONADO À AI - AI RELATED |===========================================
;==================================================================================

; These 11 Single Button and Hold Dir commands must be placed here at the top
; of the CMD, above all other commands, and in the standard order shown here,
; in order for the "Compatibly Partnered" version (9742) of the helper AI
; activation method to work with different partners in simul team mode.
; (When the partner is not compatible, then it's best to just use the regular
; version (9741) and rely on the XOR method for backup in case a human
; partner's input turns off the CPU partner's AI.)
; (Now, even if you do not intend to give your character any custom AI, it
; would still be nice if you would place the commands at the top of your CMD,
; for the sake of other characters which do use this AI activation method.
; And then, define Anim 9741 in your AIR file to indicate to other characters
; that your character is compatible.
; It may slightly increase the chances of faulty AI activation if the user is
; using characters with a poor implementation of the old humanly-impossible
; commands AI activation method when fighting against your character, but
; other than that, there's really no particular reason not to.  And you can
; change the names of the commands if you want.  For compatibility, all that
; really matters is the "command" and "time" parameters.)
;
; Another important point to make, is that if you want to add additional
; definitions for any of these basic command names, then there are limits on
; what kind of parameters you can use, in order to ensure the reliability of
; the helper method.  That is, if you redefine any of these first 11 commands,
; then you must follow these rules when doing so:
; - Don't use any command string that includes any tildes. (e.g. no "~x",
;   no "~30D")
; - In the command string, don't include any direction that isn't preceeded by
;   a slash. (e.g. no "F", no "$D")
; - Don't put any non-slashed buttons in a command string overloading one of
;   the Hold Dir command names.
; - Using a command string that includes any commas (e.g. no "a,b"), and/or
;   setting the time parameter to greater than 1, may be safe, but I wouldn't
;   risk it.
; An example of what is permissible, is redefining the "z" button like so:
;	[Command]
;	name = "z"
;	command = y+b
;	time = 1
; Other than that particular common type of redefinition, it's probably best
; to simply avoid adding definitions for these 11 command names altogether.
; And remember, this paragraph just has to do with the helper method.  You'll
; still need to make changes to the XOR code, no matter what type of overloading
; you use with the commands used by it.

[Defaults]
command.time = 15
command.buffer.time = 2;
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
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdp"
command = /x
time = 1
[Command]
name = "holdp"
command = /y
time = 1
[Command]
name = "holdp"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1
;-| Super Motions |--------------------------------------------------------

;--------------------------Raikou Bakushin Houou Kyaku---------------------

[Command]
name = "RaikouBakushinHououKyaku"
command = ~D, B, F, x+y;~F, D, B, F, x
time = 30;time = 25
[Command]
name = "RaikouBakushinHououKyaku"
command = ~D, B, F, x+z;~F, D, B, F, y
time = 30;time = 25
[Command]
name = "RaikouBakushinHououKyaku"
command = ~D, B, F, z+y;~F, D, B, F, z
time = 30;time = 25

;[Command]
;name = "RaikouBakushinHououKyaku"
;command = ~F, D, B, F, ~x
;time = 30;time = 25
;[Command]
;name = "RaikouBakushinHououKyaku"
;command = ~F, D, B, F, ~y
;time = 30;time = 25
;[Command]
;name = "RaikouBakushinHououKyaku"
;command = ~F, D, B, F, ~z
;time = 30;time = 25
;-----------------------------------HououHitenKyaku----------------------------
[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, a
time = 30;time = 25
[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, b
time = 30;time = 25
[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, c
time = 30;time = 25

[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, ~a
time = 30;time = 25
[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, ~b
time = 30;time = 25
[Command]
name = "HououHitenKyaku"
command = ~D, F, D, F, ~c
time = 30;time = 25
;-----------------------------------HououKyaku----------------------------
[Command]
name = "HououKyaku"
command = ~D, B, F, a
time = 30;time = 25
[Command]
name = "HououKyaku"
command = ~D, B, F, b
time = 30;time = 25
[Command]
name = "HououKyaku"
command = ~D, B, F, c
time = 30;time = 25
;[Command]
;name = "HououKyaku"
;command = ~D, B, D, F,  ~a
;time = 30;time = 25
;[Command]
;name = "HououKyaku"
;command = ~D, B, D, F, ~b
;time = 30;time = 25
;[Command]
;name = "HououKyaku"
;command = ~D, B, D, F, ~c
;time = 30;time = 25
;-----------------------------------ShinHououKyaku----------------------------
[Command]
name = "ShinHououKyaku"
command = ~D, B, F, a+b;command = ~D, B, F, ~c
time = 30;time = 25
[Command]
name = "ShinHououKyaku"
command = ~D, B, F, a+c;command = ~D, B, F, ~c
time = 30;time = 25
[Command]
name = "ShinHououKyaku"
command = ~D, B, F, c+b;command = ~D, B, F, ~c
time = 30;time = 25

;[Command]
;name = "ShinHououKyaku"
;command = ~D, B, F, ~c
;time = 30;time = 25
;[Command]
;name = "ShinHououKyaku"
;command = ~D, B, F, ~c
;time = 30;time = 25
;[Command]
;name = "ShinHououKyaku"
;command = ~D, B, F, ~c
;time = 30;time = 25
;---------------------------------"HouyokuTenshoKyaku"----------------------
[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, x
time = 20
;time = 25
[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, y
time = 20
;time = 25
[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, z
time = 20
;time = 25

[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, ~x
time = 20
;time = 25
[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, ~y
time = 20
;time = 25
[Command]
name = "HouyokuTenshoKyaku"
command = ~D, F, D, F, ~z
time = 20
;time = 25
;--------------------------HououTenbuKyaku----------------------------
[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, a
time = 20
;time = 25
[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, b
time = 20
;time = 25
[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, c
time = 20
;time = 25

[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, ~a
time = 20
;time = 25
[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, ~b
time = 20
;time = 25
[Command]
name = "HououTenbuKyaku"
command = ~D, F, D, B, ~c
time = 20
;time = 25
;-| Special Motions |------------------------------------------------------
;------------------------kuusajin-------------------
[Command]
name = "DP_x"
command = ~F, D, DF, x
[Command]
name = "DP_y"
command = ~F, D, DF, y
[Command]
name = "DP_z"
command = ~F, D, DF, z
;------------------------Hien Zan-------------------
[Command]
name = "HienZana"
command = ~30$D, U, a
[Command]
name = "HienZanb"
command = ~30$D, U, b
[Command]
name = "HienZanc"
command = ~30$D, U, c

[Command]
name = "HienZana"
command = ~30$D, U, a
[Command]
name = "HienZanb"
command = ~30$D, U, b
[Command]
name = "HienZanc"
command = ~30$D, U, c
;------------------------Hadouken---------------------
[Command]
name = "QCF_x"
command = ~D, DF, F, x
time = 20
[Command]
name = "QCF_y"
command = ~D, DF, F, y
time = 20
[Command]
name = "QCF_z"
command = ~D, DF, F, z
time = 20
;------------------------Thrust kick-------------------
[Command]
name = "RyuuseiRakua"
command = ~30$B, F, ~a
time = 20
[Command]
name = "RyuuseiRakub"
command = ~30$B, F, ~b
time = 20
[Command]
name = "RyuuseiRakuc"
command = ~30$B, F, ~c
time = 20

[Command]
name = "RyuuseiRakua"
command = ~30$B, F, a
time = 20
[Command]
name = "RyuuseiRakub"
command = ~30$B, F, b
time = 20
[Command]
name = "RyuuseiRakuc"
command = ~30$B, F, c
time = 20
;---------------------------------------------HishouKyaku---------------------
[Command]
name = "QCF_a"
command = ~D, DF, F, a
time = 20
[Command]
name = "QCF_b"
command = ~D, DF, F, b
time = 20
[Command]
name = "QCF_c"
command = ~D, DF, F, c
time = 20

[Command]
name = "QCF_a"
command = ~D, DF, F, ~a
time = 20
[Command]
name = "QCF_b"
command = ~D, DF, F, ~b
time = 20
[Command]
name = "QCF_c"
command = ~D, DF, F, ~c
time = 20
;------------------------; Haki kyaku-------------------
[Command]
name = "Haki kyaku"
command = ~D, D, a
time = 20
[Command]
name = "Haki kyaku"
command = ~D, D, b
time = 20
[Command]
name = "Haki kyaku"
command = ~D, D, c
time = 20

[Command]
name = "super3"
command = ~D, DB, B, x+y
;---------------------Hadou combo------------
[Command]
name = "QCB_x"
command = ~D, DB, B, x
[Command]
name = "QCB_y"
command = ~D, DB, B, y
[Command]
name = "QCB_z"
command = ~D, DB, B, z
;------------------Tatzumaki------------------------
[Command]
name = "QCB_a"
command = ~D, DB, B, a
[Command]
name = "QCB_b"
command = ~D, DB, B, b
[Command]
name = "QCB_c"
command = ~D, DB, B, c
;-----------------Float tatzumaki-------
[Command]
name = "HCB_a"
command = ~F, DF, D, DB, B, a
[Command]
name = "HCB_b"
command = ~F, DF, D, DB, B, b
[Command]
name = "HCB_c"
command = ~F, DF, D, DB, B, c
;--------------------Dejin-------------
[Command]
name = "HCF_x"
command = ~B, DB, D, DF, F, x
[Command]
name = "HCF_y"
command = ~B, DB, D, DF, F, y
[Command]
name = "HCF_z"
command = ~B, DB, D, DF, F, z

[Command]
name = "HCF_x"
command = ~B, D, F, x
[Command]
name = "HCF_y"
command = ~B, D, F, y
[Command]
name = "HCF_z"
command = ~B, D, F, z
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

;----------------------zero counters
[Command]
name="bdx"
command=~B,DB,D,x
time=20
[Command]
name="bdy"
command=~B,DB,D,y
time=20
[Command]
name="bdz"
command=~B,DB,D,z
time=20
[Command]
name="bdx"
command=~B,DB,D,~x
time=20
[Command]
name="bdy"
command=~B,DB,D,~y
time=20
[Command]
name="bdz"
command=~B,DB,D,~z
time=20

[Command]
name="bda"
command=~B,DB,D,a
time=20
[Command]
name="bdb"
command=~B,DB,D,b
time=20
[Command]
name="bdc"
command=~B,DB,D,c
time=20
[Command]
name="bda"
command=~B,DB,D,~a
time=20
[Command]
name="bdb"
command=~B,DB,D,~b
time=20
[Command]
name="bdc"
command=~B,DB,D,~c
time=20

[Command]
name = "chargey"
command = /y
time = 1

[Command]
name = "chargeb"
command = /b
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
;---------------------------------------------------------------------------------------------
;Super Jump
[Command]
name = "highjump"
command = $D, $U

[Command]
name = "hj"
command = ~D, U

[Command]
name ="hj"
command = /D, U

[Command]
name = "hj"
command = /D, /U

[Command]
name = "hj"
command = ~D, /U

;---------------------------------------------------------------------------
;Single direction
[Command]
name = "Up"
command = U
time = 5
[Command]
name = "Forward"
command = F
time = 5
[Command]
name = "Down"
command = D
time = 5
[Command]
name = "Back"
command = B
time = 1

;-------------Extras---------------
[Command]
name="highjump"
command=$D,$U
time=15
;==================================================================================
;======| RELACIONADO À AI - AI RELATED |===========================================
;==================================================================================
[Statedef -1]
; The main purpose of having these next two controllers here at the top of
; StateDef -1 is to make sure the AI helper never changes to a different state,
; but they also improve efficiency by preventing Mugen from wasting time
; processing the entire State -1 for the helper.
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

[State -1, Tick Fix]
type=ctrlset
triggerall= !ctrl
trigger1= (stateno=52 || stateno=101 || stateno=106 || stateno=5120) && !animtime
trigger2= (stateno=[200,499]) && !animtime
;trigger3= ((stateno=[760,762]) || (stateno=[700,715]) || (stateno=[900,905])) && !animtime
;trigger3= stateno=810 && !animtime
trigger3= (stateno=5001 || stateno=5011 || stateno=151 || stateno=153) && hitover
value=1

; This is generally the best place to put most of your AI directives.  For
; example, this controller would only be executed when the CPU is in control:
;
; [State -1, Haha!]
; type = ChangeState
; trigger1 = var(0) ; (Or use "var(59)>0" if you've chosen not to
;                   ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = (StateType = S)
; trigger1 = (MoveType = I)
; trigger1 = (P2MoveType = H)
; trigger1 = (NumEnemy = 1)
; trigger1 = (Enemy,GetHitVar(HitTime) > 60)
; trigger1 = (PrevStateNo != 195)
; trigger1 = (Random < 99)
; value = 195

; And of course, most human-only command-based ChangeStates also belong
; in State -1.  For example, this move would only be performable by a human:
;
; [State -1, Death Before Dishonor]
; type = ChangeState
; trigger1 = (command = "suicide")
; trigger1 = !var(0) ; (Or use "var(59)<1" if you've chosen not to
;                    ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = (StateType != A)
; trigger1 = (MoveType = I)
; value = {suicide state number}

;==================================================================================
;==================================================================================
;==================================================================================
 ;---------------------------------------------------------------------------
[State -1, AI ground recover]
type = ChangeState
value = 5210
triggerall = Var(59) = 1
triggerall = Alive
triggerall = CanRecover
triggerall = Vel Y > -1
triggerall = Pos Y >= -20
triggerall = StateNo = 5050
trigger1 = random = [150,200]

[State -1, AI zerocounter]
type=changestate
value=750
trigger1= var(59)>=1
trigger1= roundstate=2 && statetype!=A
trigger1= power>=1000
trigger1= stateno=150 || stateno=152
trigger1= random<50
trigger1= (p2bodydist x=[0,50]) && life<400
;-----------------------------------------
[State -1, AI Dodge]
type = ChangeState
value = 730
triggerall = var(59)>=1 && random =[1,30]
triggerall = P2movetype = A
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = stateno != [4000,4020]
triggerall = prevstateno != [4000,4020]
triggerall = numexplod(735)=0
trigger1 = p2bodydist x <= 40
trigger1 = ctrl
;-----------------------------------------
[State -1, AI Dodge Forward]
type = ChangeState
value = 700
triggerall = var(59)>=1 && random =[31,60]
triggerall = P2movetype = A
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = stateno != [4000,4020]
triggerall = prevstateno != [4000,4020]
trigger1 = p2bodydist x <= 40
trigger1 = ctrl
;-----------------------------------------
[State -1, AI Dodge Back]
type = ChangeState
value = 701
triggerall = var(59)>=1 && random =[61,90]
triggerall = P2movetype = A
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = stateno != [4000,4020]
triggerall = prevstateno != [4000,4020]
trigger1 = p2bodydist x <= 40
trigger1 = ctrl

[State -1, AI roll/dodge]
type=changestate
value=ifelse(random<250,700,701)
trigger1= var(59)>=1 && random =[1,100]
trigger1= roundstate=2 && statetype!=A
trigger1= ctrl && random<50
trigger1= (enemynear,movetype=A) && (enemynear,hitdefattr=SCA,AA) && (p2bodydist x=[0,80])

[State -1, AI backdash]
type=changestate
value=105
trigger1= var(59)>=1
trigger1= roundstate=2 && statetype=S
trigger1= random < ifelse((enemynear,hitdefattr=SC,AT), 150, 50)
trigger1= ctrl && (stateno!=[100,106]) && (stateno!=[4000,4010])
trigger1= (enemynear,movetype=A) && backedgedist>=80 && (p2bodydist x=[80,120]) && (enemynear,vel x)

[State -1, AI Sparry]
type=hitoverride
triggerall=var(59)>=1&&roundstate=2&&statetype!=A  && random <=100
triggerall=movetype != A && movetype != H
trigger1=(ctrl)||((stateno=[4000,4010]))
trigger1=var(21):=1
trigger2=(stateno=[130,155])
trigger2=var(21):=-1
attr=SA,AA,AP
stateno=4000
slot=0
time=ifelse((stateno=[130,155]),4,8)

[State -1, AI cparry]
type=hitoverride
triggerall=var(59)>=1&&roundstate=2&&statetype=C && random <=100
triggerall=movetype != A && movetype != H
trigger1=(ctrl)||((stateno=[4000,4010]))
trigger1=var(21):=2
trigger2=(stateno=[130,155])
trigger2=var(21):=-2
attr=C,AA,AP
stateno=4010
slot=0
time=ifelse((stateno=[130,155]),4,8)

[State -1, AI aparry]
type=hitoverride
triggerall=var(59)>=1&&roundstate=2&&statetype=A  && random <=100
triggerall=movetype != A && movetype != H
trigger1=(ctrl)||(stateno=4020)
trigger1=var(21):=3
trigger2=(stateno=[130,155])
trigger2=var(21):=-3
attr=SA,AA,AP
stateno=4020
forceair=1
slot=0
time=ifelse((stateno=[130,155]),4,8)
;---------------------------------------------------------------------------
;run
[State -1,  AI Run Fwd]
type = ChangeState
value = 100
triggerall = var(59)>=1 && stateno !=[100,106]
triggerall = var(59)>=1 && stateno !=20
triggerall = statetype != A && random =[501,900]
triggerall = P2MoveType != A
trigger1 = P2bodydist X = [70,200]
trigger1 = ctrl
trigger1 = Random = [200,500]
trigger2 = P2bodydist X > 200
trigger2 = ctrl
;trigger2 = Random = [430,590]

;---------------------------------------------------------------------------
;run
[State -1,  AI Walk Fwd]
type = ChangeState
value = 20
triggerall = var(59)>=1 && stateno !=[100,106]
triggerall = var(59)>=1 && stateno !=20
triggerall = statetype != A && random =[1,500]
triggerall = P2MoveType != A
trigger1 = P2bodydist X = [70,200]
trigger1 = ctrl
trigger1 = Random = [200,500]
trigger2 = P2bodydist X > 200
trigger2 = ctrl
;trigger2 = Random = [430,590]

;[State -1, AI Throw]
;type=changestate
;value=800
;triggerall= var(59)>=1
;triggerall= roundstate=2 && statetype=S
;triggerall= p2statetype!=A && p2statetype!=L && p2movetype!=H
;triggerall= (p2bodydist x=[0,20]) && p2dist y=0
;trigger1= ctrl && random<100
;trigger2= ctrl && (p2stateno=[120,140]) && random<350

[State -1, AI Houou Kyaku]
type=changestate
value = 3800;ifelse(p2bodydist x <=40,3100,3000)
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A ;&& prevstateno!=3000
triggerall= power>=1000
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= (p2bodydist x=[0,80]) && (p2dist y=[-40,0]) && p2statetype!=L
trigger1= (stateno=220 || stateno=250 || stateno=420 || stateno=450)
trigger1= movehit && (p2bodydist x=[0,30]) && random=[1,100]
trigger2= (stateno=1010 || stateno=1600)
trigger2= movehit && (p2bodydist x=[0,30]) && random=[1,100]
;trigger3= (stateno=[1000,4999]) && numhelper(stateno+5) && var(10)<=6
;trigger3= helper(stateno+5),var(3) && random<100
trigger3= ctrl && enemynear,movetype=A && (p2bodydist x=[0,70]) && random=[1,150]

[State -1, AI Hiten Kyaku]
type=changestate
value = 3100;ifelse(p2bodydist x <=40,3100,3000)
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A ;&& prevstateno!=3000
triggerall= power>=1000
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= (p2bodydist x=[0,80]) && (p2dist y=[-40,0]) && p2statetype!=L
trigger1= (stateno=220 || stateno=250 || stateno=420 || stateno=450)
trigger1= movehit && (p2bodydist x=[0,30]) && random=[101,200]
trigger2= (stateno=1010 || stateno=1600)
trigger2= movehit && (p2bodydist x=[0,30]) && random=[101,200]
;trigger3= (stateno=[1000,4999]) && numhelper(stateno+5) && var(10)<=6
;trigger3= helper(stateno+5),var(3) && random<100
trigger3= ctrl && enemynear,movetype=A && (p2bodydist x=[0,70]) && random=[151,300]

[State -1, AI Air Houou Kyaku]
type=changestate
value=3900
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype=A ;&& pos y>=-50 ;&& prevstateno!=3300
triggerall= power>=1000
trigger1= (stateno=600 || stateno=650)
trigger1= movehit && random<100
trigger2= stateno=[1200,1220]
trigger2= movehit && random<250
trigger3= stateno=[1500,1520]
trigger3= movehit && random<250

[State -1, AI Air Houou Hagetsu Kyaku]
type=changestate
value=3500
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype=A ;&& pos y>=-50 ;&& prevstateno!=3300
triggerall= power>=1000
trigger1= (stateno=600 || stateno=650)
trigger1= movehit && random=[101,200]
trigger2= stateno=[1400,1420]
trigger2= movehit && random<250

[State -1, AI Shin Houou Kyaku]
type=changestate
value=3000
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype=A && pos y <=-30
triggerall= power>=2000
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= (p2bodydist x=[-30,60]) && p2dist y>=-15 && (enemynear,vel y<6)
trigger1= (stateno=620 || stateno=650)
trigger1= movehit && random<100
trigger2= ((stateno=[1100,1102]) || stateno=120) ;|| stateno=[1301,1303])
trigger2= movehit && random<250

[State -1, AI JaeHoonSuper]
type=changestate
value=3400
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A
triggerall= power>=1000
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= (p2bodydist x=[0,120]) && (p2dist y=[-60,0]) && (enemynear,vel y<8) && p2statetype!=L
trigger1= stateno=[1500,1502] ;|| ((stateno=[1100,1102])
trigger1= movehit && (p2bodydist x=[0,60]) && random<250
;trigger2= stateno=3100 && movehit && animelemtime(17)>=0 && random<200
trigger2= (stateno=1000) && (random<100)
trigger3= (stateno=220) && movehit && (random<80)
trigger4= (stateno=250) && movehit && (random<80)
trigger5= (stateno=[1300,1302]) && movehit ;&& (random<80)

[State -1, AI RyuuSeiRakua Random]
type = ChangeState
value=ifelse((random=[1,300]),1300,(ifelse((random=[301,600]),1310,1320)))
triggerall = var(59)>=1  && random =[201,230]
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = prevstateno !=430
trigger1 = p2bodydist x <=30
trigger1 = ctrl

[State -1, AI RyuuSeiRakua2 Random]
type=changestate
value=ifelse((random=[1,300]),1300,(ifelse((random=[301,600]),1310,1320)))
triggerall= var(59)>=1 && random = [1,100]
triggerall= roundstate=2 && statetype!=A && !inguarddist
triggerall= (p2bodydist x=[0,36]) && (p2dist y=[-50,50]) && p2stateno!=5120
triggerall= ((p2stateno!=[120,155]) || p2stateno=130 || p2stateno=150 || p2stateno=151) && p2movetype!=A
trigger1= ctrl && random<200
;trigger2= (stateno=200 || stateno=230 || stateno=245) && time>=5 && random<50
;trigger3= ctrl && (p2stateno=130 || p2stateno=150 || p2stateno=151)
;trigger4= p2stateno=5110

[State -1, AI RyuuSeiRakua3 Random]
type=changestate
value=ifelse((random=[1,300]),1300,(ifelse((random=[301,600]),1310,1320)))
triggerall= var(59)>=1 && random = [1,100]
triggerall= roundstate=2 && statetype!=A && !inguarddist
trigger1 = stateno = 220 && movehit && p2statetype !=A
trigger2 = stateno = 250 && movehit && p2statetype !=A
trigger3 = stateno = 440 && movehit && p2statetype !=A
trigger4 = stateno = 450 && movehit && p2statetype !=A

[State -1, AI HienZan Random]
type = ChangeState
value=ifelse((random=[1,300]),1200,(ifelse((random=[301,600]),1210,1220)))
triggerall = statetype != A
trigger1 = stateno = 220 && movehit && p2statetype =A && p2bodydist x <=30

[State -1, AI HienZan2 Random]
type=changestate
value=ifelse((random=[1,300]),1200,(ifelse((random=[301,600]),1210,1220)))
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= p2statetype!=L && (p2dist y=[-120,0])
triggerall= (p2statetype!=A && (p2bodydist x=[0,35])) || (p2bodydist x=[0,80])
trigger1= ctrl && p2statetype=A && random<ifelse(prevstateno=1200, 333, 200)
trigger2= (stateno=[200,250])
trigger2= movehit && (p2bodydist x=[0,12]) && random<500
trigger4= ctrl && enemynear,movetype=A && (p2bodydist x=[0,40]) && random<500
trigger5= stateno=0 && prevstateno=5120 && !time
trigger5= ctrl && (p2bodydist x=[0,40]) && random<500
trigger6= (enemynear,time<=1) && (enemynear,prevstateno=5120)

[State -1, AI ShakaShuu1]
type = ChangeState
value = 1000;+(random%3)
triggerall = numhelper(1000)=0 && random =[100,300]
triggerall = var(59)>=1
triggerall = statetype != A
trigger1 = stateno = 220 && movehit && p2statetype !=A && random = [100,200]
trigger2 = stateno = 250 && movehit && p2statetype !=A && random = [201,300]

[State -1, AI HangesuZan Random]
type = ChangeState
value=ifelse((random=[1,300]),1100,(ifelse((random=[301,600]),1110,1120)))
triggerall = var(59) >= 1
triggerall = roundstate = 2
triggerall = statetype != A
trigger1 = ctrl ;|| stateno = 21 || (stateno = 100 && animelemtime(2) >1) || stateno = 101 || stateno = 40 ;|| (stateno = 52 && anim = 57 && time >= 2)
trigger1 = P2bodydist X = [40,70]
trigger1 = P2MoveType = I
trigger1 = Random = [1,40]
trigger2 = ctrl ;|| stateno = 21 || (stateno = 100 && animelemtime(2) >1) || stateno = 101 || stateno = 40 ;|| (stateno = 52 && anim = 57 && time >= 2)
trigger2 = P2bodydist X > 100
trigger2 = P2MoveType != A
trigger2 = Random = [41,80]
trigger3 = StateNo = 450 && movehit
trigger3 = Random = [81,120]
trigger4= (stateno = 200 && movehit) || (stateno = 400 && movehit) || (stateno = 210 && movehit) || (stateno = 240 && movehit)
trigger4 = Random = [121,140]
ignorehitpause = 0

[State -1, AI Shaka Shuu Random]
type = ChangeState
value=ifelse((random=[1,300]),1000,(ifelse((random=[301,600]),1010,1020)))
triggerall = var(59) >= 1
triggerall = roundstate = 2
triggerall = statetype != A
trigger1 = ctrl ;|| stateno = 21 || (stateno = 100 && animelemtime(2) >1) || stateno = 101 || stateno = 40 ;|| (stateno = 52 && anim = 57 && time >= 2)
trigger1 = P2bodydist X = [40,70]
trigger1 = P2MoveType = I
trigger1 = Random = [1,40]
trigger2 = ctrl ;|| stateno = 21 || (stateno = 100 && animelemtime(2) >1) || stateno = 101 || stateno = 40 ;|| (stateno = 52 && anim = 57 && time >= 2)
trigger2 = P2bodydist X > 100
trigger2 = P2MoveType != A
trigger2 = Random = [141,180]
trigger3 = StateNo = 450 && movehit
trigger3 = Random = [181,220]
trigger4= (stateno = 200 && movehit) || (stateno = 400 && movehit) || (stateno = 210 && movehit) || (stateno = 240 && movehit)
trigger4 = Random = [221,240]
ignorehitpause = 0

[State -1, AI KuuSajin Random]
type=changestate
value=ifelse((random=[1,300]),1500,(ifelse((random=[301,600]),1510,1520)))
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A
triggerall= !(enemynear,ctrl) && (enemynear,stateno!=[120,155])
triggerall= p2statetype!=L && (p2dist y=[-120,0])
triggerall= (p2statetype!=A && (p2bodydist x=[0,35])) || (p2bodydist x=[0,80])
trigger1= ctrl && p2statetype=A && random<ifelse(prevstateno=1200, 333, 200)
trigger2= (stateno=[200,250])
trigger2= movehit && (p2bodydist x=[0,12]) && random<500
trigger4= ctrl && enemynear,movetype=A && (p2bodydist x=[0,40]) && random<500
trigger5= stateno=0 && prevstateno=5120 && !time
trigger5= ctrl && (p2bodydist x=[0,40]) && random<500
trigger6= (enemynear,time<=1) && (enemynear,prevstateno=5120)

[State -1, AI Falling kick]
type = changestate
value=ifelse((random=[1,300]),1400,(ifelse((random=[301,600]),1410,1420)))
triggerall = var(59)>=1
triggerall = statetype = A && random <= 300
triggerall = p2movetype = A
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = P2bodydist X = [20,60]
trigger1 = pos y <= -33
trigger2 = stateno = 640 && movehit
ignorehitpause = 1

[State -1, AI Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59)>=1  && random =[100,150]
triggerall = statetype != A
;triggerall = p2statetype != C
triggerall = prevstateno !=200
trigger1 = p2bodydist x <=40
trigger1 = ctrl
trigger1= enemynear,stateno !=5120

[State -1, AI Stand Strong Kick]
type=changestate
value=250
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A && !inguarddist
triggerall= (p2bodydist x=[0,60]) && (p2dist y=[-50,50]) && p2statetype!=C && p2statetype!=L && !(enemynear,hitfall)
triggerall= (p2stateno!=[120,155]) && p2movetype!=A
trigger1= ctrl && random<100
trigger1= enemynear,stateno !=5120

[State -1, AI Crouch light kick]
type = ChangeState
value = 430
triggerall = var(59)>=1  && random =[101,230]
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = prevstateno !=430
trigger1 = p2bodydist x <=30
trigger1 = ctrl
trigger1= enemynear,stateno !=5120

[State -1, AI Crouch light kick2]
type=changestate
value=430
triggerall= var(59)>=1
triggerall= roundstate=2 && statetype!=A && !inguarddist
triggerall= (p2bodydist x=[0,36]) && (p2dist y=[-50,50]) && p2stateno!=5120
triggerall= ((p2stateno!=[120,155]) || p2stateno=130 || p2stateno=150 || p2stateno=151) && p2movetype!=A
trigger1= ctrl && random<200
trigger1= enemynear,stateno !=5120;(stateno=200 || stateno=230 || stateno=245) && time>=5 && random<50
;trigger3= ctrl && (p2stateno=130 || p2stateno=150 || p2stateno=151)
;trigger4= p2stateno=5110

[State -1, AI Stand Medium Kick]
type = ChangeState
value = 240
triggerall = var(59)>=1  && random =[0,100]
triggerall = statetype != A
;trigger1 = p2bodydist x <=30
trigger1 = stateno = 430 && movehit
;trigger2 = stateno = 400 && movehit;ctrl

[State -1, AI Stand Heavy Kick]
type = ChangeState
value = 250
triggerall = var(59)>=1  && random =[0,100]
triggerall = statetype != A
;trigger1 = p2bodydist x <=30
trigger1 = stateno = 240 && movehit;ctrl
;trigger2 = stateno = 400 && movehit;ctrl

[State -1, AI Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = var(59)>=1  && random =[101,200]
triggerall = statetype != A
;trigger1 = p2bodydist x <=30
trigger1 = stateno = 430 && movehit
;trigger2 = stateno = 400 && movehit;ctrl

[State -1, AI Crouch Heavy Kick]
type = ChangeState
value = 450
triggerall = var(59)>=1  && random =[101,200]
triggerall = statetype != A
;trigger1 = p2bodydist x <=30
trigger1 = stateno = 240 && movehit;ctrl
;trigger2 = stateno = 400 && movehit;ctrl

;===========================================================================
;---------------------------------------------------------------------------
;===========================================================================
[State -1, Zero counter]
type=changestate
value=750
triggerall=var(59)<=0&&roundstate=2&&(command="bdx"||command="bdy"||command="bdz"||command="bda"||command="bdb"||command="bdc")
triggerall=p2dist x>0&&power>=1000&&(statetype=S || statetype=C)
trigger1=stateno=150||stateno=152
;---------------------------------------------------------------------------
;Throw
[State -1, Guard Cancel Forward]
type = ChangeState
value = 710
triggerall=var(59)<=0
triggerall = command = "x" && command = "a" && command = "holdfwd"
triggerall = statetype = S
triggerall = stateno != 100
triggerall = power >= 1000
trigger1=stateno=150||stateno=152
;---------------------------------------------------------------------------
;Throw
[State -1, Guard Cancel Back]
type = ChangeState
value = 711
triggerall=var(59)<=0
triggerall = command = "x" && command = "a" && command = "holdback"
triggerall = statetype = S
triggerall = stateno != 100
triggerall = power >= 1000
trigger1=stateno=150||stateno=152
;===========================================================================
[State -1, Original Combo]
type=changestate
value=760
triggerall=var(59)<=0
trigger1=  command = "c" && command = "z"
trigger1= roundstate=2 && power>=1000 && !var(20)
trigger1= ctrl
;---------------------------------------------------------------------------
;Throw
[State -1, Dodge forward]
type = ChangeState
value = 700
triggerall=var(59)<1
triggerall = command = "x" && command = "a" && command = "holdfwd"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Throw
[State -1, Dodge back]
type = ChangeState
value = 701
triggerall = var(59)<1
triggerall = command = "x" && command = "a" && command = "holdback"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl
;---------------------------------------------------------------------------
;Throw
[State -1, Dodge stand]
type = ChangeState
value = 730
triggerall = var(59)<1
triggerall = command = "x" && command = "a"
triggerall = statetype = S
triggerall = stateno != 100
triggerall = numexplod(735)=0
trigger1 = ctrl
;---------------------------------------------------------------------------
;dodge follow up
[State -1, Dodge follow up Punch]
type = ChangeState
value = 221
triggerall = var(59)<1
triggerall = command = "x" || command = "y" || command = "z"
triggerall = statetype != A
trigger1 = StateNo = 730 && Time =[14,24]
;---------------------------------------------------------------------------
;dodge follow up
[State -1, Dodge follow up Kick]
type = ChangeState
value = 251
triggerall = var(59)<1
triggerall = command = "a" || command = "b" || command = "c"
triggerall = statetype != A
trigger1 = StateNo = 730 && Time =[14,24]
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall=var(59)<1
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall=var(59)<1
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
;[State -1, Throw]
;type = ChangeState
;value = 800
;triggerall = command = "y" || command = "z"
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = stateno != 100
;,trigger1 = command = "holdfwd"
;trigger1 = p2bodydist X < 10
;trigger1 = (p2statetype = S) || (p2statetype = C)
;trigger1 = p2movetype != H
;trigger2 = command = "holdback"
;trigger2 = p2bodydist X < 10
;trigger2 = (p2statetype = S) || (p2statetype = C)
;trigger2 = p2movetype != H
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall=var(59)<1
triggerall = command = "start"
triggerall = statetype = S ;|| statetype=C
trigger1 = ctrl
;===========================================================================
;-----------------------------Super Attacks-------------------------------
;===========================================================================

[State -1, RaikouBakushinHououKyaku]
type = ChangeState
value = 3700
triggerall = var(59)<1
triggerall = statetype != A
triggerall = command = "RaikouBakushinHououKyaku"
triggerall = power >=3000
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, ShinHououKyaku]
type = ChangeState
value = 3000
triggerall = var(59)<1
triggerall = statetype != A
triggerall = command = "ShinHououKyaku"
triggerall = power >=2000
triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, Air ShinHououKyaku]
type = ChangeState
value = 3200
triggerall = var(59)<1
triggerall = Statetype = A
triggerall = command = "ShinHououKyaku"
triggerall = power >=2000
triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, HououKyaku]
type = ChangeState
value = 3800
triggerall = var(59)<1
triggerall = statetype != A
triggerall = command = "HououKyaku"
triggerall = power >=1000 || var(20)>0
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, Air HououKyaku]
type = ChangeState
value = 3900
triggerall = var(59)<1
triggerall = statetype = A; || statetype=C
triggerall = command = "HououKyaku"
triggerall = power >=1000 || var(20)>0
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, TenshoKyaku]
type = ChangeState
value = 3400
triggerall = var(59)<1
triggerall = statetype != A
triggerall = command = "HouyokuTenshoKyaku"
triggerall = power >=1000 || var(20)>0
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, HitenKyaku]
type = ChangeState
value = 3100
triggerall = var(59)<1
triggerall = statetype != A
triggerall = command = "HououHitenKyaku"
triggerall = power >=1000 || var(20)>0
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, HangetsuZan]
type = ChangeState
value = 3500
triggerall = var(59)<1
triggerall = Statetype = A
triggerall = command = "HououHitenKyaku"
triggerall = power >=1000 || var(20)>0
;triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
[State -1, TenbuKyaku]
type = ChangeState
value = 3300
triggerall = var(59)<1
triggerall = Statetype = A
triggerall = command = "HououTenbuKyaku"
triggerall = power >=2000
triggerall = var(20) <=0
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact
trigger3=(stateno=[1000,1799]) && movecontact
;===========================================================================
;-----------------------------Special Attacks-------------------------------
;===========================================================================
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Kuusajin1]
type = ChangeState
value = 1500
triggerall=var(59)<1
triggerall = command = "DP_x"
trigger1 = stateno != [1500,1520]
;triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 && stateno != [1500,1520]
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Kuusajin2]
type = ChangeState
value = 1510
triggerall=var(59)<1
triggerall = command = "DP_y"
trigger1 = stateno != [1500,1520]
;trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Kuusajin3]
type = ChangeState
value = 1520
triggerall=var(59)<1
triggerall = command = "DP_z"
trigger1 = stateno != [1500,1520]
;trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 && stateno != [1500,1520]
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Shakka Shuu1]
type = ChangeState
value = 1000
triggerall=var(59)<1
triggerall = command = "QCF_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Shakka Shuu2]
type = ChangeState
value = 1020
triggerall=var(59)<1
triggerall = command = "QCF_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Shakka Shuu3]
type = ChangeState
value = 1030
triggerall=var(59)<1
triggerall = command = "QCF_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hangetsu Zan1]
type = ChangeState
value = 1100
triggerall=var(59)<1
triggerall = command = "QCB_a"
;triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hangetsu Zan2]
type = ChangeState
value = 1110
triggerall=var(59)<1
triggerall = command = "QCB_b"
;triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hangetsu Zan3]
type = ChangeState
value = 1120
triggerall=var(59)<1
triggerall = command = "QCB_c"
;triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hien Zan1]
type = ChangeState
value = 1200
triggerall=var(59)<1
triggerall = command = "HienZana"
trigger1 = stateno != [1200,1220]
;trigger1 = statetype != A
trigger1 = ctrl || stateno = 40
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hien Zan2]
type = ChangeState
value = 1210
triggerall=var(59)<1
triggerall = command = "HienZanb"
trigger1 = stateno != [1200,1220]
;trigger1 = statetype != A
trigger1 = ctrl || stateno = 40
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hien Zan3]
type = ChangeState
value = 1220
triggerall=var(59)<1
triggerall = command = "HienZanc"
trigger1 = stateno != [1200,1220]
;trigger1 = statetype != A
trigger1 = ctrl || stateno = 40
trigger2= var(15)=1 ;&& stateno != 200
trigger3= var(16)=1 ;&& stateno != 610
trigger4= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Ryuusei Raku1]
type = ChangeState
value = 1300
triggerall=var(59)<1
triggerall = command = "RyuuseiRakua"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Ryuusei Raku2]
type = ChangeState
value = 1310
triggerall=var(59)<1
triggerall = command = "RyuuseiRakub"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Ryuusei Raku3]
type = ChangeState
value = 1320
triggerall=var(59)<1
triggerall = command = "RyuuseiRakuc"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hishou kyaku]
type = ChangeState
value = 1400
triggerall=var(59)<1
triggerall = command = "QCF_a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2= var(16)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hishou kyaku2]
type = ChangeState
value = 1410
triggerall=var(59)<1
triggerall = command = "QCF_b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2= var(16)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Hishou kyaku3]
type = ChangeState
value = 1420
triggerall=var(59)<1
triggerall = command = "QCF_c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2= var(16)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, Haki kyaku]
type = ChangeState
value = 1600
triggerall=var(59)<1
triggerall = command = "Haki kyaku"
triggerall = statetype != A
trigger1 = ctrl
trigger2= var(15)=1 ;&& stateno != 200
trigger3= (var(20) && (stateno=[200,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, 2ndStance]
type = ChangeState
value = 1701
triggerall=var(59)<1
triggerall = command = "holdc"
trigger1 = statetype != A
trigger1 = stateno = 250 && time >= 19
;trigger2= var(15)=1 ;&& stateno != 200
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, 2ndStance2]
type = ChangeState
value = 1702
triggerall=var(59)<1
triggerall = command = "holdc"
trigger1 = AnimElemNo(0) = 9
trigger1 = statetype != A
trigger1 = stateno = 300 ;&& time >= 26
;trigger2= var(15)=1 ;&& stateno != 200
;---------------------------------------------------------------------------
;QCF combo 1
[State -1, 2ndStance3]
type = ChangeState
value = 1700
triggerall = var(59)<1
triggerall = command = "holdc"
trigger1 = AnimElem = 8
trigger1 = statetype != A
trigger1 = stateno = 1600 ;&& time >= 26
;trigger2= var(15)=1 ;&& stateno != 200
;---------------------------------------------------------------------------
;Throw
[State -1, Throw kicks]
type = ChangeState
value = 820
triggerall = var(59)<1
triggerall = (command = "a" && command = "b")  ||   (command = "b" && command = "c") || (command = "a" && command = "c")
triggerall = statetype = S
triggerall = (command = "holdfwd"  ||  command = "holdback")
triggerall = ctrl
triggerall = stateno != 100
;trigger1 = command = "holdfwd"
;trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;trigger2 = command = "holdback"
;trigger2 = p2bodydist X < 5
;trigger2 = (p2statetype = S) || (p2statetype = C)
;trigger2 = p2movetype != H
;---------------------------------------------------------------------------
;Throw
[State -1, Throw punches]
type = ChangeState
value = 800
triggerall = var(59)<1
triggerall = (command = "x" && command = "y")  ||   (command = "y" && command = "z") || (command = "x" && command = "z")
triggerall = (command = "holdfwd"  ||  command = "holdback")
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
;trigger1 = command = "holdfwd"
;trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;trigger2 = command = "holdback"
;trigger2 = p2bodydist X < 5
;trigger2 = (p2statetype = S) || (p2statetype = C)
;trigger2 = p2movetype != H
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59)<1
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= stateno = 200 && time >= 7
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
 ;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59)<1
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)  && movecontact
;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = var(59)<1
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430 || stateno = 440 || stateno = 240)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= var(15)=1 && stateno != 220
;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59)<1
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= stateno = 230 && time >= 7
;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = var(59)<1
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Neri Chagi]
type = ChangeState
value = 300
triggerall = var(59)<1
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = var(59)<1
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430 || stateno = 440 || stateno = 240)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59)<1
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= stateno = 400 && time >= 7
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = var(59)<1
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= var(15)=1 && stateno != 410
;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = var(59)<1
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430 || stateno = 440 || stateno = 240)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;[State -1, Jump from launcher]
;type = ChangeState
;value = 40;7000
;triggerall = var(59)<1
;triggerall = Command = "holdup"
;trigger1 = stateno = 420 && movehit
;ignorehitpause=0
;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59)<1
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2= stateno = 430 && time >=7
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = var(59)<1
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = var(59)<1
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || stateno = 430 || stateno = 440 || stateno = 240)  && movecontact
trigger3= (var(20) && (stateno=[200,499]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59)<1
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= var(16)=1 && stateno != 600
;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = var(59)<1
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= var(16)=1 && stateno != 610
;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = var(59)<1
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630 || stateno = 640)  && movecontact
trigger3= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59)<1
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger2= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;trigger2= var(16)=1 && stateno != 630
;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = var(59)<1
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630)  && movecontact
trigger3= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = var(59)<1
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630 || stateno = 640)  && movecontact
trigger3= (var(20) && (stateno=[600,699]) && movecontact) || (var(20) && (stateno=[1000,1999]) && movecontact)
;---------------------------------------------------------------------------
;[State -1, Super Jump]
;type = ChangeState
;value = 7000
;triggerall = var(59)<1
;triggerall = StateType = S || StateType = C
;triggerall = ctrl
;trigger1 = Command = "SJ"
;----------------------------------------------------------
[State -1, sparry]
type=hitoverride
triggerall = var(59)<1&&roundstate=2&&statetype=S
triggerall=command="Forward"&&command!="Back"&&command!="Up"&&command!="Down"
trigger1=ctrl||stateno=4000||stateno=4010
trigger1=var(21):=1
trigger2=(stateno=[150,153])
trigger2=var(21):=-1
attr=SA,AA,AP
stateno=4000
slot=0
time=ifelse((stateno=[150,153]),4,8)

[State -1, cparry]
type=hitoverride
triggerall = var(59)<1&&roundstate=2&&statetype!=A
triggerall=(statetype=S&&command="Down")||(statetype=C&&command="Forward")&&command!="Back"&&command!="Up"
trigger1=ctrl||stateno=4000||stateno=4010
trigger1=var(21):=2
trigger2=(stateno=[150,153])
trigger2=var(21):=-2
attr=C,AA,AP
stateno=4010
slot=0
time=ifelse((stateno=[150,153]),14,18)

[State -1, aparry]
type=hitoverride
triggerall = var(59)<1&&roundstate=2&&statetype=A
triggerall=command="Forward"&&command!="Back"&&command!="Up"&&command!="Down"
trigger1=ctrl||stateno=4020
trigger1=var(21):=3
trigger2=(stateno=[154,155])
trigger2=var(21):=-3
attr=SA,AA,AP
stateno=4020
forceair=1
slot=0
time=ifelse((stateno=[154,155]),4,8)

[State -1, resetparry]
type=hitoverride
trigger1=(statetype=S||statetype=C)&&var(21)!=1&&var(21)!=-1&&var(21)!=2&&var(21)!=-2
trigger2=statetype=A&&var(21)!=3&&var(21)!=-3
trigger3=movetype=A||(movetype=H&&(stateno!=[120,155]))
trigger4=!ctrl
slot=0
time=0

