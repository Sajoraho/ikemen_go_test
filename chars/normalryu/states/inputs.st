; _________________________________________
;| Some character by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====================================================================================================================================================
;==============================================================<INPUT PARSING STATE>=================================================================
;====================================================================================================================================================

[Statedef -4]

[State -4, AI saves CPU]
type = assertspecial
trigger1 = AIlevel
trigger1 = stateno > 40
trigger1 = !incustomstate
flag = noinput
ignorehitpause = 1


[State -4, Helper 9999 is fired]
type = mapset
trigger1 = 1
map = "cmd_reverse"
value = 0
ignorehitpause = 1

[State -4, Helper 9999 is fired]
type = mapset
trigger1 = p2dist x < -const(size.ground.back)
map = "cmd_reverse"
value = 1
ignorehitpause = 1


[State -4, Buffer Time Default]
type = mapset
map = "cmd_buffertime"
trigger1 = var(20) = 0
value = ifelse(hitpausetime < 4, 5, (hitpausetime + 1))
ignorehitpause = 1

[State -4, Buffer Time Custom Combo]
type = mapset
map = "cmd_buffertime"
trigger1 = var(20) > 0
trigger1 = name != "Lei-Lei" && name != "Morrigan Aensland"
value = (hitpausetime + 1)
ignorehitpause = 1

[State -4, Buffer Time Pocket Shin Gouki]
type = mapset
map = "cmd_buffertime"
trigger1 = name = "Pocket Shin Gouki"
value = (hitpausetime + 1)
ignorehitpause = 1

[State -4, Buffer Time Senpubu]
type = mapset
map = "cmd_buffertime"
trigger1 = name = "Lei-Lei"
trigger1 = stateno = 1101 || stateno = 1121
value = 1
ignorehitpause = 1


[State -4, Disable Landing Option Select]
type = mapset
map = "erase_super"
trigger1 = time < 5
trigger1 = stateno = [600, 699]
trigger1 = vel y > 0 && (pos y > - vel y)
trigger1 = !movecontact && !movereversed && hitdefattr != SCA, AA, AP, AT
value = 1
ignorehitpause = 0


[State -4, Erase Normal];Too lazy right now to put it in every state
type = mapset
map = "erase_normal"
trigger1 = time = 1
trigger1 = stateno = [200, 999]
value = 1
ignorehitpause = 1


;--------------------------------------------------------------------------- BUTTON CHECK ---------------------------------------------------------------------------
;input delay for PP / KK check

[State -4, Check A Timer]
type = mapadd
map = "check_a"
trigger1 = map(check_a) > 0
value = -1
ignorehitpause = 1

[State -4, Check A]
type = mapset
map = "check_a"
trigger1 = command = "a"
value = 2
ignorehitpause = 1


[State -4, Check B Timer]
type = mapadd
map = "check_b"
trigger1 = map(check_b) > 0
value = -1
ignorehitpause = 1

[State -4, Check B]
type = mapset
map = "check_b"
trigger1 = command = "b"
value = 2
ignorehitpause = 1


[State -4, Check C Timer]
type = mapadd
map = "check_c"
trigger1 = map(check_c) > 0
value = -1
ignorehitpause = 1

[State -4, Check C]
type = mapset
map = "check_c"
trigger1 = command = "c"
value = 2
ignorehitpause = 1


[State -4, Check X Timer]
type = mapadd
map = "check_x"
trigger1 = map(check_x) > 0
value = -1
ignorehitpause = 1

[State -4, Check X]
type = mapset
map = "check_x"
trigger1 = command = "x"
value = 2
ignorehitpause = 1


[State -4, Check Y Timer]
type = mapadd
map = "check_y"
trigger1 = map(check_y) > 0
value = -1
ignorehitpause = 1

[State -4, Check Y]
type = mapset
map = "check_y"
trigger1 = command = "y"
value = 2
ignorehitpause = 1


[State -4, Check Z Timer]
type = mapadd
map = "check_z"
trigger1 = map(check_z) > 0
value = -1
ignorehitpause = 1

[State -4, Check Z]
type = mapset
map = "check_z"
trigger1 = command = "z"
value = 2
ignorehitpause = 1


[State -4, Check Start Timer]
type = mapadd
map = "check_s"
trigger1 = map(check_s) > 0
value = -1
ignorehitpause = 1

[State -4, Check Start]
type = mapset
map = "check_s"
trigger1 = command = "start"
value = 2
ignorehitpause = 1


[State -4, Check Release A Timer]
type = mapadd
map = "check_rlsa"
trigger1 = map(check_rlsa) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release A]
type = mapset
map = "check_rlsa"
trigger1 = command = "~a"
value = 2
ignorehitpause = 1


[State -4, Check Release B Timer]
type = mapadd
map = "check_rlsb"
trigger1 = map(check_rlsb) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release B]
type = mapset
map = "check_rlsb"
trigger1 = command = "~b"
value = 2
ignorehitpause = 1


[State -4, Check Release C Timer]
type = mapadd
map = "check_rlsc"
trigger1 = map(check_rlsc) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release C]
type = mapset
map = "check_rlsc"
trigger1 = command = "~c"
value = 2
ignorehitpause = 1


[State -4, Check Release X Timer]
type = mapadd
map = "check_rlsx"
trigger1 = map(check_rlsx) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release X]
type = mapset
map = "check_rlsx"
trigger1 = command = "~x"
value = 2
ignorehitpause = 1


[State -4, Check Release Y Timer]
type = mapadd
map = "check_rlsy"
trigger1 = map(check_rlsy) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release Y]
type = mapset
map = "check_rlsy"
trigger1 = command = "~y"
value = 2
ignorehitpause = 1


[State -4, Check Release Z Timer]
type = mapadd
map = "check_rlsz"
trigger1 = map(check_rlsz) > 0
value = -1
ignorehitpause = 1

[State -4, Check Release Z]
type = mapset
map = "check_rlsz"
trigger1 = command = "~z"
value = 2
ignorehitpause = 1


;--------------------------------------------------------------------------- SINGLE BUTTON ---------------------------------------------------------------------------
;once delay frame is over

[State -4, A Timer]
type = mapadd
map = "cmd_a"
trigger1 = map(cmd_a) > 0
value = -1
ignorehitpause = 1

[State -4, A]
type = mapset
map = "cmd_a"
trigger1 = map(check_a) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, A OFF]
type = mapset
map = "cmd_a"
trigger1 = map(cmd_a)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, B Timer]
type = mapadd
map = "cmd_b"
trigger1 = map(cmd_b) > 0
value = -1
ignorehitpause = 1

[State -4, B]
type = mapset
map = "cmd_b"
trigger1 = map(check_b) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, B OFF]
type = mapset
map = "cmd_b"
trigger1 = map(cmd_b)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, C Timer]
type = mapadd
map = "cmd_c"
trigger1 = map(cmd_c) > 0
value = -1
ignorehitpause = 1

[State -4, C]
type = mapset
map = "cmd_c"
trigger1 = map(check_c) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, C OFF]
type = mapset
map = "cmd_c"
trigger1 = map(cmd_c)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, X Timer]
type = mapadd
map = "cmd_x"
trigger1 = map(cmd_x) > 0
value = -1
ignorehitpause = 1

[State -4, X]
type = mapset
map = "cmd_x"
trigger1 = map(check_x) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, X OFF]
type = mapset
map = "cmd_x"
trigger1 = map(cmd_x)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Y Timer]
type = mapadd
map = "cmd_y"
trigger1 = map(cmd_y) > 0
value = -1
ignorehitpause = 1

[State -4, Y]
type = mapset
map = "cmd_y"
trigger1 = map(check_y) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Y OFF]
type = mapset
map = "cmd_y"
trigger1 = map(cmd_y)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Z Timer]
type = mapadd
map = "cmd_z"
trigger1 = map(cmd_z) > 0
value = -1
ignorehitpause = 1

[State -4, Z]
type = mapset
map = "cmd_z"
trigger1 = map(check_z) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Z OFF]
type = mapset
map = "cmd_z"
trigger1 = map(cmd_z)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, S Timer]
type = mapadd
map = "cmd_s"
trigger1 = map(cmd_s) > 0
value = -1
ignorehitpause = 1

[State -4, S]
type = mapset
map = "cmd_s"
trigger1 = map(check_s) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, S OFF]
type = mapset
map = "cmd_s"
trigger1 = map(cmd_s)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1



;--------------------------------------------------------------------------- RELEASE BUTTON ---------------------------------------------------------------------------

[State -4, Release A Timer]
type = mapadd
map = "cmd_rlsa"
trigger1 = map(cmd_rlsa) > 0
value = -1
ignorehitpause = 1

[State -4, Release A]
type = mapset
map = "cmd_rlsa"
trigger1 = map(check_rlsa) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release A OFF]
type = mapset
map = "cmd_rlsa"
trigger1 = map(cmd_rlsa)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Release B Timer]
type = mapadd
map = "cmd_rlsb"
trigger1 = map(cmd_rlsb) > 0
value = -1
ignorehitpause = 1

[State -4, Release B]
type = mapset
map = "cmd_rlsb"
trigger1 = map(check_rlsb) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release B OFF]
type = mapset
map = "cmd_rlsb"
trigger1 = map(cmd_rlsb)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Release C Timer]
type = mapadd
map = "cmd_rlsc"
trigger1 = map(cmd_rlsc) > 0
value = -1
ignorehitpause = 1

[State -4, Release C]
type = mapset
map = "cmd_rlsc"
trigger1 = map(check_rlsc) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release C OFF]
type = mapset
map = "cmd_rlsc"
trigger1 = map(cmd_rlsc)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Release X Timer]
type = mapadd
map = "cmd_rlsx"
trigger1 = map(cmd_rlsx) > 0
value = -1
ignorehitpause = 1

[State -4, Release X]
type = mapset
map = "cmd_rlsx"
trigger1 = map(check_rlsx) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release X OFF]
type = mapset
map = "cmd_rlsx"
trigger1 = map(cmd_rlsx)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Release Y Timer]
type = mapadd
map = "cmd_rlsy"
trigger1 = map(cmd_rlsy) > 0
value = -1
ignorehitpause = 1

[State -4, Release Y]
type = mapset
map = "cmd_rlsy"
trigger1 = map(check_rlsy) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release Y OFF]
type = mapset
map = "cmd_rlsy"
trigger1 = map(cmd_rlsy)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Release Z Timer]
type = mapadd
map = "cmd_rlsz"
trigger1 = map(cmd_rlsz) > 0
value = -1
ignorehitpause = 1

[State -4, Release Z]
type = mapset
map = "cmd_rlsz"
trigger1 = map(check_rlsz) = 1
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Release Z OFF]
type = mapset
map = "cmd_rlsz"
trigger1 = map(cmd_rlsz)
trigger1 = map(erase_normal) || map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- BUTTON COMBINATIONS --------------------------------------------------------------------------
;buffered

[State -4, KThrow Timer]
type = mapadd
map = "cmd_kthrow"
trigger1 = map(cmd_kthrow) > 0
value = -1
ignorehitpause = 1

[State -4, KThrow]
type = mapset
map = "cmd_kthrow"
trigger1 = ((map(check_a) > 0) + (map(check_b) > 0) + (map(check_c) > 0)) >= 2
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, PThrow Timer]
type = mapadd
map = "cmd_pthrow"
trigger1 = map(cmd_pthrow) > 0
value = -1
ignorehitpause = 1

[State -4, PThrow]
type = mapset
map = "cmd_pthrow"
trigger1 = ((map(check_x) > 0) + (map(check_y) > 0) + (map(check_z) > 0)) >= 2
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, AX Timer]
type = mapadd
map = "cmd_ax"
trigger1 = map(cmd_ax) > 0
value = -1
ignorehitpause = 1

[State -4, AX]
type = mapset
map = "cmd_ax"
trigger1 = map(check_a) && map(check_x)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, CZ Timer]
type = mapadd
map = "cmd_cz"
trigger1 = map(cmd_cz) > 0
value = -1
ignorehitpause = 1

[State -4, CZ]
type = mapset
map = "cmd_cz"
trigger1 = map(check_c) && map(check_z)
value = map(cmd_buffertime)
ignorehitpause = 1


;--------------------------------------------------------------------------- SPECIAL MOVE BUTTON CHECK --------------------------------------------------------------------------
;not buffered

[State -4, kkk Timer]
type = mapadd
map = "check_kkk"
trigger1 = map(check_kkk) > 0
value = -1
ignorehitpause = 1

[State -4, kkk]
type = mapset
map = "check_kkk"
trigger1 = (map(check_a) > 0) && (map(check_b) > 0) && (map(check_c) > 0)
trigger2 = (map(check_rlsa) > 0) && (map(check_rlsb) > 0) && (map(check_rlsc) > 0)
value = 1
ignorehitpause = 1


[State -4, ppp Timer]
type = mapadd
map = "check_ppp"
trigger1 = map(check_ppp) > 0
value = -1
ignorehitpause = 1

[State -4, ppp]
type = mapset
map = "check_ppp"
trigger1 = (map(check_x) > 0) && (map(check_y) > 0) && (map(check_z) > 0)
trigger2 = (map(check_rlsx) > 0) && (map(check_rlsy) > 0) && (map(check_rlsz) > 0)
value = 1
ignorehitpause = 1


[State -4, kk Timer]
type = mapadd
map = "check_kk"
trigger1 = map(check_kk) > 0
value = -1
ignorehitpause = 1

[State -4, kk]
type = mapset
map = "check_kk"
trigger1 = ((map(check_a) > 0) + (map(check_b) > 0) + (map(check_c) > 0)) >= 2
trigger2 = ((map(check_rlsa) > 0) + (map(check_rlsb) > 0) + (map(check_rlsc) > 0)) >= 2
value = 1
ignorehitpause = 1


[State -4, pp Timer]
type = mapadd
map = "check_pp"
trigger1 = map(check_pp) > 0
value = -1
ignorehitpause = 1

[State -4, pp]
type = mapset
map = "check_pp"
trigger1 = ((map(check_x) > 0) + (map(check_y) > 0) + (map(check_z) > 0)) >= 2
trigger2 = ((map(check_rlsx) > 0) + (map(check_rlsy) > 0) + (map(check_rlsz) > 0)) >= 2
value = 1
ignorehitpause = 1


[State -4, k Timer]
type = mapadd
map = "check_k"
trigger1 = map(check_k) > 0
value = -1
ignorehitpause = 1

[State -4, k]
type = mapset
map = "check_k"
trigger1 = (map(check_a) = 1) || (map(check_b) = 1) || (map(check_c) = 1)
trigger2 = (map(check_rlsa) = 1) || (map(check_rlsb) = 1) || (map(check_rlsc) = 1)
value = 1
ignorehitpause = 1


[State -4, p Timer]
type = mapadd
map = "check_p"
trigger1 = map(check_p) > 0
value = -1
ignorehitpause = 1

[State -4, p]
type = mapset
map = "check_p"
trigger1 = (map(check_x) = 1) || (map(check_y) = 1) || (map(check_z) = 1)
trigger2 = (map(check_rlsx) = 1) || (map(check_rlsy) = 1) || (map(check_rlsz) = 1)
value = 1
ignorehitpause = 1


;--------------------------------------------------------------------------- SPECIAL TYPE CHECK --------------------------------------------------------------------------
;this is just to keep the code a bit shorter
;buffered and not erased

[State -4, Strength ABC Timer]
type = mapadd
map = "str_abc"
trigger1 = map(str_abc) > 0
value = -1
ignorehitpause = 1

[State -4, Strength ABC]
type = mapset
map = "str_abc"
trigger1 = map(check_a) || map(check_rlsa)
trigger1 = map(check_b) || map(check_rlsb)
trigger1 = map(check_c) || map(check_rlsc)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength XYZ Timer]
type = mapadd
map = "str_xyz"
trigger1 = map(str_xyz) > 0
value = -1
ignorehitpause = 1

[State -4, Strength XYZ]
type = mapset
map = "str_xyz"
trigger1 = map(check_x) || map(check_rlsx)
trigger1 = map(check_y) || map(check_rlsy)
trigger1 = map(check_z) || map(check_rlsz)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength AB Timer]
type = mapadd
map = "str_ab"
trigger1 = map(str_ab) > 0
value = -1
ignorehitpause = 1

[State -4, Strength AB]
type = mapset
map = "str_ab"
trigger1 = map(check_a) || map(check_rlsa)
trigger1 = map(check_b) || map(check_rlsb)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength AC Timer]
type = mapadd
map = "str_ac"
trigger1 = map(str_ac) > 0
value = -1
ignorehitpause = 1

[State -4, Strength AC]
type = mapset
map = "str_ac"
trigger1 = map(check_a) || map(check_rlsa)
trigger1 = map(check_c) || map(check_rlsc)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength BC Timer]
type = mapadd
map = "str_bc"
trigger1 = map(str_bc) > 0
value = -1
ignorehitpause = 1

[State -4, Strength BC]
type = mapset
map = "str_bc"
trigger1 = map(check_b) || map(check_rlsb)
trigger1 = map(check_c) || map(check_rlsc)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength XY Timer]
type = mapadd
map = "str_xy"
trigger1 = map(str_xy) > 0
value = -1
ignorehitpause = 1

[State -4, Strength XY]
type = mapset
map = "str_xy"
trigger1 = map(check_y) || map(check_rlsy)
trigger1 = map(check_z) || map(check_rlsz)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength XZ Timer]
type = mapadd
map = "str_xz"
trigger1 = map(str_xz) > 0
value = -1
ignorehitpause = 1

[State -4, Strength XZ]
type = mapset
map = "str_xz"
trigger1 = map(check_y) || map(check_rlsy)
trigger1 = map(check_z) || map(check_rlsz)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength YZ Timer]
type = mapadd
map = "str_yz"
trigger1 = map(str_yz) > 0
value = -1
ignorehitpause = 1

[State -4, Strength YZ]
type = mapset
map = "str_yz"
trigger1 = map(check_y) || map(check_rlsy)
trigger1 = map(check_z) || map(check_rlsz)
value = map(cmd_buffertime)
ignorehitpause = 1


[State -4, Strength A Timer]
type = mapadd
map = "str_a"
trigger1 = map(str_a) > 0
value = -1
ignorehitpause = 1

[State -4, Strength A]
type = mapset
map = "str_a"
trigger1 = map(check_a)
trigger2 = map(check_rlsa)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength A OFF]
type = mapset
map = "str_a"
trigger1 = map(str_a)
trigger1 = !map(check_a) || map(check_rlsa)
trigger1 = map(check_b) || map(check_c)
value = 0
ignorehitpause = 1


[State -4, Strength B Timer]
type = mapadd
map = "str_b"
trigger1 = map(str_b) > 0
value = -1
ignorehitpause = 1

[State -4, Strength B]
type = mapset
map = "str_b"
trigger1 = map(check_b)
trigger2 = map(check_rlsb)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength B OFF]
type = mapset
map = "str_b"
trigger1 = map(str_b)
trigger1 = !map(check_b) || map(check_rlsb)
trigger1 = map(check_a) || map(check_c)
value = 0
ignorehitpause = 1


[State -4, Strength C Timer]
type = mapadd
map = "str_c"
trigger1 = map(str_c) > 0
value = -1
ignorehitpause = 1

[State -4, Strength C]
type = mapset
map = "str_c"
trigger1 = map(check_c)
trigger2 = map(check_rlsc)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength C OFF]
type = mapset
map = "str_c"
trigger1 = map(str_c)
trigger1 = !map(check_c) || map(check_rlsc)
trigger1 = map(check_a) || map(check_b)
value = 0
ignorehitpause = 1

[State -4, Strength X Timer]
type = mapadd
map = "str_x"
trigger1 = map(str_x) > 0
value = -1
ignorehitpause = 1

[State -4, Strength X]
type = mapset
map = "str_x"
trigger1 = map(check_x)
trigger2 = map(check_rlsx)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength X OFF]
type = mapset
map = "str_x"
trigger1 = map(str_x)
trigger1 = !map(check_x) || map(check_rlsx)
trigger1 = map(check_y) || map(check_z)
value = 0
ignorehitpause = 1


[State -4, Strength Y Timer]
type = mapadd
map = "str_y"
trigger1 = map(str_y) > 0
value = -1
ignorehitpause = 1

[State -4, Strength Y]
type = mapset
map = "str_y"
trigger1 = map(check_y)
trigger2 = map(check_rlsy)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength Y OFF]
type = mapset
map = "str_y"
trigger1 = map(str_y)
trigger1 = !map(check_y) || map(check_rlsy)
trigger1 = map(check_x) || map(check_z)
value = 0
ignorehitpause = 1


[State -4, Strength Z Timer]
type = mapadd
map = "str_z"
trigger1 = map(str_z) > 0
value = -1
ignorehitpause = 1

[State -4, Strength Z]
type = mapset
map = "str_z"
trigger1 = map(check_z)
trigger2 = map(check_rlsz)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Strength Z OFF]
type = mapset
map = "str_z"
trigger1 = map(str_z)
trigger1 = !map(check_z) || map(check_rlsz)
trigger1 = map(check_x) || map(check_y)
value = 0
ignorehitpause = 1


;==========================================================================< SPECIAL MOVE INPUTS >===========================================================================

;--------------------------------------------------------------------------- 236 ---------------------------------------------------------------------------

[State -4, 236 Timer]
type = mapadd
map = "check_236_OK"
trigger1 = map(check_236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 236 Timer]
type = mapadd
map = "check_236_23"
trigger1 = map(check_236_23) > 0
value = -1
ignorehitpause = 1

[State -4, 236 Timer]
type = mapadd
map = "check_236_2"
trigger1 = map(check_236_2) > 0
value = -1
ignorehitpause = 1


[State -4, 236]
type = mapset
map = "check_236_OK"
trigger1 = map(check_236_23) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 236]
type = mapset
map = "check_236_23"
trigger1 = map(check_236_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "DB", command = "DF")
value = 10
ignorehitpause = 1

[State -4, 236]
type = mapset
map = "check_236_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, 236 OFF]
type = mapset
map = "check_236_OK"
trigger1 = map(check_236_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 236 OFF]
type = mapset
map = "check_236_23"
trigger1 = map(check_236_23) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 236 OFF]
type = mapset
map = "check_236_2"
trigger1 = map(check_236_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236kk Timer]
type = mapadd
map = "cmd_236kk"
trigger1 = map(cmd_236kk) > 0
value = -1
ignorehitpause = 1

[State -4, 236kk]
type = mapset
map = "cmd_236kk"
trigger1 = map(check_236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236kk OFF]
type = mapset
map = "cmd_236kk"
trigger1 = map(cmd_236kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236pp Timer]
type = mapadd
map = "cmd_236pp"
trigger1 = map(cmd_236pp) > 0
value = -1
ignorehitpause = 1

[State -4, 236pp]
type = mapset
map = "cmd_236pp"
trigger1 = map(check_236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236pp OFF]
type = mapset
map = "cmd_236pp"
trigger1 = map(cmd_236pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236k Timer]
type = mapadd
map = "cmd_236k"
trigger1 = map(cmd_236k) > 0
value = -1
ignorehitpause = 1

[State -4, 236k]
type = mapset
map = "cmd_236k"
trigger1 = map(check_236_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236k OFF]
type = mapset
map = "cmd_236k"
trigger1 = map(cmd_236k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236p Timer]
type = mapadd
map = "cmd_236p"
trigger1 = map(cmd_236p) > 0
value = -1
ignorehitpause = 1

[State -4, 236p]
type = mapset
map = "cmd_236p"
trigger1 = map(check_236_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236p OFF]
type = mapset
map = "cmd_236p"
trigger1 = map(cmd_236p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236s Timer]
type = mapadd
map = "cmd_236s"
trigger1 = map(cmd_236s) > 0
value = -1
ignorehitpause = 1

[State -4, 236s]
type = mapset
map = "cmd_236s"
trigger1 = map(check_236_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236s OFF]
type = mapset
map = "cmd_236s"
trigger1 = map(cmd_236s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ROOT 236 ---------------------------------------------------------------------------;Directions do not reverse

[State -4, Root 236 Timer]
type = mapadd
map = "check_root236_OK"
trigger1 = map(check_root236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236 Timer]
type = mapadd
map = "check_root236_23"
trigger1 = map(check_root236_23) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236 Timer]
type = mapadd
map = "check_root236_2"
trigger1 = map(check_root236_2) > 0
value = -1
ignorehitpause = 1


[State -4, Root 236]
type = mapset
map = "check_root236_OK"
trigger1 = map(check_root236_23) > 0
trigger1 = command = "F"
value = 10
ignorehitpause = 1

[State -4, Root 236]
type = mapset
map = "check_root236_23"
trigger1 = map(check_root236_2) > 0
trigger1 = command = "DF"
value = 10
ignorehitpause = 1

[State -4, Root 236]
type = mapset
map = "check_root236_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, Root 236 OFF]
type = mapset
map = "check_root236_OK"
trigger1 = map(check_root236_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 236 OFF]
type = mapset
map = "check_root236_23"
trigger1 = map(check_root236_23) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 236 OFF]
type = mapset
map = "check_root236_2"
trigger1 = map(check_root236_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236kk Timer]
type = mapadd
map = "cmd_root236kk"
trigger1 = map(cmd_root236kk) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236kk]
type = mapset
map = "cmd_root236kk"
trigger1 = map(check_root236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_root236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236kk OFF]
type = mapset
map = "cmd_root236kk"
trigger1 = map(cmd_root236kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236pp Timer]
type = mapadd
map = "cmd_root236pp"
trigger1 = map(cmd_root236pp) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236pp]
type = mapset
map = "cmd_root236pp"
trigger1 = map(check_root236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_root236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236pp OFF]
type = mapset
map = "cmd_root236pp"
trigger1 = map(cmd_root236pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236k Timer]
type = mapadd
map = "cmd_root236k"
trigger1 = map(cmd_root236k) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236k]
type = mapset
map = "cmd_root236k"
trigger1 = map(check_root236_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236k OFF]
type = mapset
map = "cmd_root236k"
trigger1 = map(cmd_root236k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236p Timer]
type = mapadd
map = "cmd_root236p"
trigger1 = map(cmd_root236p) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236p]
type = mapset
map = "cmd_root236p"
trigger1 = map(check_root236_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236p OFF]
type = mapset
map = "cmd_root236p"
trigger1 = map(cmd_root236p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 214 --------------------------------------------------------------------------

[State -4, 214 Timer]
type = mapadd
trigger1 = map(check_214_OK) > 0
map = "check_214_OK"
value = -1
ignorehitpause = 1

[State -4, 214 Timer]
type = mapadd
trigger1 = map(check_214_21) > 0
map = "check_214_21"
value = -1
ignorehitpause = 1

[State -4, 214 Timer]
type = mapadd
trigger1 = map(check_214_2) > 0
map = "check_214_2"
value = -1
ignorehitpause = 1


[State -4, 214]
type = mapset
trigger1 = map(check_214_21) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "check_214_OK"
value = 10
ignorehitpause = 1

[State -4, 214]
type = mapset
trigger1 = map(check_214_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "DF", command = "DB")
map = "check_214_21"
value = 10
ignorehitpause = 1

[State -4, 214]
type = mapset
trigger1 = command = "/D"
map = "check_214_2"
value = 10
ignorehitpause = 1


[State -4, 214 OFF]
type = mapset
map = "check_214_OK"
trigger1 = map(check_214_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 214 OFF]
type = mapset
map = "check_214_21"
trigger1 = map(check_214_21) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 214 OFF]
type = mapset
map = "check_214_2"
trigger1 = map(check_214_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214kk Timer]
type = mapadd
trigger1 = map(cmd_214kk) > 0
map = "cmd_214kk"
value = -1
ignorehitpause = 1

[State -4, 214kk]
type = mapset
trigger1 = map(check_214_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_214k)
trigger2 = map(check_kk)
map = "cmd_214kk"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214kk OFF]
type = mapset
trigger1 = map(cmd_214kk)
trigger1 = map(erase_special) || map(erase_super)
map = "cmd_214kk"
value = 0
ignorehitpause = 1


[State -4, 214pp Timer]
type = mapadd
map = "cmd_214pp"
trigger1 = map(cmd_214pp) > 0
value = -1
ignorehitpause = 1

[State -4, 214pp]
type = mapset
map = "cmd_214pp"
trigger1 = map(check_214_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_214p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214pp OFF]
type = mapset
map = "cmd_214pp"
trigger1 = map(cmd_214pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214k Timer]
type = mapadd
trigger1 = map(cmd_214k) > 0
map = "cmd_214k"
value = -1
ignorehitpause = 1

[State -4, 214k]
type = mapset
map = "cmd_214k"
trigger1 = map(check_214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214k OFF]
type = mapset
map = "cmd_214k"
trigger1 = map(cmd_214k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214p Timer]
type = mapadd
map = "cmd_214p"
trigger1 = map(cmd_214p) > 0
value = -1
ignorehitpause = 1

[State -4, 214p]
type = mapset
map = "cmd_214p"
trigger1 = map(check_214_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214p OFF]
type = mapset
map = "cmd_214p"
trigger1 = map(cmd_214p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214s Timer]
type = mapadd
map = "cmd_214s"
trigger1 = map(cmd_214s) > 0
value = -1
ignorehitpause = 1

[State -4, 214s]
type = mapset
map = "cmd_214s"
trigger1 = map(check_214_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214s OFF]
type = mapset
map = "cmd_214s"
trigger1 = map(cmd_214s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ROOT 214 --------------------------------------------------------------------------

[State -4, Root 214 Timer]
type = mapadd
map = "check_root214_OK"
trigger1 = map(check_root214_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214 Timer]
type = mapadd
map = "check_root214_21"
trigger1 = map(check_root214_21) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214 Timer]
type = mapadd
map = "check_root214_2"
trigger1 = map(check_root214_2) > 0
value = -1
ignorehitpause = 1


[State -4, Root 214]
type = mapset
map = "check_root214_OK"
trigger1 = map(check_root214_21) > 0
trigger1 = command = "B"
value = 10
ignorehitpause = 1

[State -4, Root 214]
type = mapset
map = "check_root214_21"
trigger1 = map(check_root214_2) > 0
trigger1 = command = "DB"
value = 10
ignorehitpause = 1

[State -4, Root 214]
type = mapset
map = "check_root214_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, Root 214 OFF]
type = mapset
map = "check_root214_OK"
trigger1 = map(check_root214_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 214 OFF]
type = mapset
map = "check_root214_21"
trigger1 = map(check_root214_21) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 214 OFF]
type = mapset
map = "check_root214_2"
trigger1 = map(check_root214_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214kk Timer]
type = mapadd
map = "cmd_root214kk"
trigger1 = map(cmd_root214kk) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214kk]
type = mapset
map = "cmd_root214kk"
trigger1 = map(check_root214_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_root214k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214kk OFF]
type = mapset
map = "cmd_root214kk"
trigger1 = map(cmd_root214kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214pp Timer]
type = mapadd
map = "cmd_root214pp"
trigger1 = map(cmd_root214pp) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214pp]
type = mapset
map = "cmd_root214pp"
trigger1 = map(check_root214_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_root214p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214pp OFF]
type = mapset
map = "cmd_root214pp"
trigger1 = map(cmd_root214pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214k Timer]
type = mapadd
map = "cmd_root214k"
trigger1 = map(cmd_root214k) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214k]
type = mapset
map = "cmd_root214k"
trigger1 = map(check_root214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214k OFF]
type = mapset
map = "cmd_root214k"
trigger1 = map(cmd_root214k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214p Timer]
type = mapadd
map = "cmd_root214p"
trigger1 = map(cmd_root214p) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214p]
type = mapset
map = "cmd_root214p"
trigger1 = map(check_root214_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214p OFF]
type = mapset
map = "cmd_root214p"
trigger1 = map(cmd_root214p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 623 ---------------------------------------------------------------------------

[State -4, 623 Timer]
type = mapadd
map = "check_623_OK"
trigger1 = map(check_623_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 623 Timer]
type = mapadd
map = "check_623_62"
trigger1 = map(check_623_62) > 0
value = -1
ignorehitpause = 1

[State -4, 623 Timer]
type = mapadd
map = "check_623_6"
trigger1 = map(check_623_6) > 0
value = -1
ignorehitpause = 1


[State -4, 623]
type = mapset
trigger1 = map(check_623_62) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
map = "check_623_OK"
value = 10
ignorehitpause = 1

[State -4, 623]
type = mapset
trigger1 = map(check_623_6) > 0
trigger1 = command = "D"
map = "check_623_62"
value = 10
ignorehitpause = 1

[State -4, 623]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
map = "check_623_6"
value = 10
ignorehitpause = 1


[State -4, 623 OFF]
type = mapset
map = "check_623_OK"
trigger1 = map(check_623_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 623 OFF]
type = mapset
map = "check_623_62"
trigger1 = map(check_623_62) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 623 OFF]
type = mapset
map = "check_623_6"
trigger1 = map(check_623_6) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623kkk Timer]
type = mapadd
map = "cmd_623kkk"
trigger1 = map(cmd_623kkk) > 0
value = -1
ignorehitpause = 1

[State -4, 623kkk]
type = mapset
map = "cmd_623kkk"
trigger1 = map(check_623_OK)
trigger1 = map(check_kkk)
trigger2 = map(cmd_623k)
trigger2 = map(check_kkk)
trigger3 = map(cmd_623kk)
trigger3 = map(check_kkk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623kkk OFF]
type = mapset
map = "cmd_623kkk"
trigger1 = map(cmd_623kkk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623ppp Timer]
type = mapadd
map = "cmd_623ppp"
trigger1 = map(cmd_623ppp) > 0
value = -1
ignorehitpause = 1

[State -4, 623ppp]
type = mapset
map = "cmd_623ppp"
trigger1 = map(check_623_OK)
trigger1 = map(check_ppp)
trigger2 = map(cmd_623p)
trigger2 = map(check_ppp)
trigger3 = map(cmd_623pp)
trigger3 = map(check_ppp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623ppp OFF]
type = mapset
map = "cmd_623ppp"
trigger1 = map(cmd_623ppp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623kk Timer]
type = mapadd
map = "cmd_623kk"
trigger1 = map(cmd_623kk) > 0
value = -1
ignorehitpause = 1

[State -4, 623kk]
type = mapset
map = "cmd_623kk"
trigger1 = map(check_623_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_623k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623kk OFF]
type = mapset
map = "cmd_623kk"
trigger1 = map(cmd_623kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623pp Timer]
type = mapadd
map = "cmd_623pp"
trigger1 = map(cmd_623pp) > 0
value = -1
ignorehitpause = 1

[State -4, 623pp]
type = mapset
map = "cmd_623pp"
trigger1 = map(check_623_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_623p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623pp OFF]
type = mapset
map = "cmd_623pp"
trigger1 = map(cmd_623pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623k Timer]
type = mapadd
map = "cmd_623k"
trigger1 = map(cmd_623k) > 0
value = -1
ignorehitpause = 1

[State -4, 623k]
type = mapset
map = "cmd_623k"
trigger1 = map(check_623_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623k OFF]
type = mapset
map = "cmd_623k"
trigger1 = map(cmd_623k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623p Timer]
type = mapadd
map = "cmd_623p"
trigger1 = map(cmd_623p) > 0
value = -1
ignorehitpause = 1

[State -4, 623p]
type = mapset
map = "cmd_623p"
trigger1 = map(check_623_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623p OFF]
type = mapset
map = "cmd_623p"
trigger1 = map(cmd_623p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 623s Timer]
type = mapadd
map = "cmd_623s"
trigger1 = map(cmd_623s) > 0
value = -1
ignorehitpause = 1

[State -4, 623s]
type = mapset
map = "cmd_623s"
trigger1 = map(check_623_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 623s OFF]
type = mapset
map = "cmd_623s"
trigger1 = map(cmd_623s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 421 --------------------------------------------------------------------------

[State -4, 421 Timer]
type = mapadd
map = "check_421_OK"
trigger1 = map(check_421_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 421 Timer]
type = mapadd
map = "check_421_42"
trigger1 = map(check_421_42) > 0
value = -1
ignorehitpause = 1

[State -4, 421 Timer]
type = mapadd
map = "check_421_4"
trigger1 = map(check_421_4) > 0
value = -1
ignorehitpause = 1


[State -4, 421]
type = mapset
trigger1 = map(check_421_42) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
map = "check_421_OK"
value = 10
ignorehitpause = 1

[State -4, 421]
type = mapset
trigger1 = map(check_421_4) > 0
trigger1 = command = "D"
map = "check_421_42"
value = 10
ignorehitpause = 1

[State -4, 421]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/F", command = "/B")
map = "check_421_4"
value = 10
ignorehitpause = 1


[State -4, 421 OFF]
type = mapset
map = "check_421_OK"
trigger1 = map(check_421_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 421 OFF]
type = mapset
map = "check_421_42"
trigger1 = map(check_421_42) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 421 OFF]
type = mapset
map = "check_421_4"
trigger1 = map(check_421_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421kkk Timer]
type = mapadd
map = "cmd_421kkk"
trigger1 = map(cmd_421kkk) > 0
value = -1
ignorehitpause = 1

[State -4, 421kkk]
type = mapset
map = "cmd_421kkk"
trigger1 = map(check_421_OK)
trigger1 = map(check_kkk)
trigger2 = map(cmd_421k)
trigger2 = map(check_kkk)
trigger3 = map(cmd_421kk)
trigger3 = map(check_kkk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421kkk OFF]
type = mapset
map = "cmd_421kkk"
trigger1 = map(cmd_421kkk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421ppp Timer]
type = mapadd
map = "cmd_421ppp"
trigger1 = map(cmd_421ppp) > 0
value = -1
ignorehitpause = 1

[State -4, 421ppp]
type = mapset
map = "cmd_421ppp"
trigger1 = map(check_421_OK)
trigger1 = map(check_ppp)
trigger2 = map(cmd_421p)
trigger2 = map(check_ppp)
trigger3 = map(cmd_421pp)
trigger3 = map(check_ppp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421ppp OFF]
type = mapset
map = "cmd_421ppp"
trigger1 = map(cmd_421ppp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421kk Timer]
type = mapadd
map = "cmd_421kk"
trigger1 = map(cmd_421kk) > 0
value = -1
ignorehitpause = 1

[State -4, 421kk]
type = mapset
map = "cmd_421kk"
trigger1 = map(check_421_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_421k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421kk OFF]
type = mapset
map = "cmd_421kk"
trigger1 = map(cmd_421kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421pp Timer]
type = mapadd
map = "cmd_421pp"
trigger1 = map(cmd_421pp) > 0
value = -1
ignorehitpause = 1

[State -4, 421pp]
type = mapset
map = "cmd_421pp"
trigger1 = map(check_421_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_421p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421pp OFF]
type = mapset
map = "cmd_421pp"
trigger1 = map(cmd_421pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421k Timer]
type = mapadd
map = "cmd_421k"
trigger1 = map(cmd_421k) > 0
value = -1
ignorehitpause = 1

[State -4, 421k]
type = mapset
map = "cmd_421k"
trigger1 = map(check_421_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421k OFF]
type = mapset
map = "cmd_421k"
trigger1 = map(cmd_421k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421p Timer]
type = mapadd
map = "cmd_421p"
trigger1 = map(cmd_421p) > 0
value = -1
ignorehitpause = 1

[State -4, 421p]
type = mapset
map = "cmd_421p"
trigger1 = map(check_421_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421p OFF]
type = mapset
map = "cmd_421p"
trigger1 = map(cmd_421p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 421s Timer]
type = mapadd
map = "cmd_421s"
trigger1 = map(cmd_421s) > 0
value = -1
ignorehitpause = 1

[State -4, 421s]
type = mapset
map = "cmd_421s"
trigger1 = map(check_421_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 421s OFF]
type = mapset
map = "cmd_421s"
trigger1 = map(cmd_421s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 41236 --------------------------------------------------------------------------

[State -4, 41236 Timer]
type = mapadd
map = "check_41236_OK"
trigger1 = map(check_41236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 41236 Timer]
type = mapadd
map = "check_41236_412"
trigger1 = map(check_41236_412) > 0
value = -1
ignorehitpause = 1

[State -4, 41236 Timer]
type = mapadd
map = "check_41236_4"
trigger1 = map(check_41236_4) > 0
value = -1
ignorehitpause = 1

[State -4, 41236]
type = mapset
map = "check_41236_OK"
trigger1 = map(check_41236_412) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 41236]
type = mapset
map = "check_41236_412"
trigger1 = map(check_41236_4) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 41236]
type = mapset
map = "check_41236_4"
trigger1 = ifelse(map(cmd_reverse), command = "/F", command = "/B")
value = 10
ignorehitpause = 1


[State -4, 41236 OFF]
type = mapset
map = "check_41236_OK"
trigger1 = map(check_41236_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 41236 OFF]
type = mapset
map = "check_41236_412"
trigger1 = map(check_41236_412) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 41236 OFF]
type = mapset
map = "check_41236_4"
trigger1 = map(check_41236_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 41236kk Timer]
type = mapadd
map = "cmd_41236kk"
trigger1 = map(cmd_41236kk) > 0
value = -1
ignorehitpause = 1

[State -4, 41236kk]
type = mapset
map = "cmd_41236kk"
trigger1 = map(check_41236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_41236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 41236kk OFF]
type = mapset
map = "cmd_41236kk"
trigger1 = map(cmd_41236kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 41236pp Timer]
type = mapadd
map = "cmd_41236pp"
trigger1 = map(cmd_41236pp) > 0
value = -1
ignorehitpause = 1

[State -4, 41236pp]
type = mapset
map = "cmd_41236pp"
trigger1 = map(check_41236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_41236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 41236pp OFF]
type = mapset
map = "cmd_41236pp"
trigger1 = map(cmd_41236pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 41236p Timer]
type = mapadd
map = "cmd_41236p"
trigger1 = map(cmd_41236p) > 0
value = -1
ignorehitpause = 1

[State -4, 41236p]
type = mapset
map = "cmd_41236p"
trigger1 = map(check_41236_OK)
trigger1 = map(check_p)
trigger2 = map(cmd_41236p)
trigger2 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 41236p OFF]
type = mapset
map = "cmd_41236p"
trigger1 = map(cmd_41236p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- Root 41236 --------------------------------------------------------------------------

[State -4, Root 41236 Timer]
type = mapadd
map = "check_root41236_OK"
trigger1 = map(check_root41236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 41236 Timer]
type = mapadd
map = "check_root41236_412"
trigger1 = map(check_root41236_412) > 0
value = -1
ignorehitpause = 1

[State -4, Root 41236 Timer]
type = mapadd
map = "check_root41236_4"
trigger1 = map(check_root41236_4) > 0
value = -1
ignorehitpause = 1


[State -4, Root 41236]
type = mapset
map = "check_root41236_OK"
trigger1 = map(check_root41236_412) > 0
trigger1 = command = "F"
value = 10
ignorehitpause = 1

[State -4, Root 41236]
type = mapset
map = "check_root41236_412"
trigger1 = map(check_root41236_4) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, Root 41236]
type = mapset
map = "check_root41236_4"
trigger1 = command = "/B"
value = 10
ignorehitpause = 1


[State -4, Root 41236 OFF]
type = mapset
map = "check_root41236_OK"
trigger1 = map(check_root41236_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 41236 OFF]
type = mapset
map = "check_root41236_412"
trigger1 = map(check_root41236_412) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 41236 OFF]
type = mapset
map = "check_root41236_4"
trigger1 = map(check_root41236_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 41236pp Timer]
type = mapadd
map = "cmd_root41236pp"
trigger1 = map(cmd_root41236pp) > 0
value = -1
ignorehitpause = 1

[State -4, Root 41236pp]
type = mapset
map = "cmd_root41236pp"
trigger1 = map(check_root41236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_root41236p)
trigger2 = map(check_rootpp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 41236pp OFF]
type = mapset
map = "cmd_root41236pp"
trigger1 = map(cmd_root41236pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 63214 --------------------------------------------------------------------------

[State -4, 63214 Timer]
type = mapadd
map = "check_63214_OK"
trigger1 = map(check_63214_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 63214 Timer]
type = mapadd
map = "check_63214_632"
trigger1 = map(check_63214_632) > 0
value = -1
ignorehitpause = 1

[State -4, 63214 Timer]
type = mapadd
map = "check_63214_6"
trigger1 = map(check_63214_6) > 0
value = -1
ignorehitpause = 1


[State -4, 63214]
type = mapset
map = "check_63214_OK"
trigger1 = map(check_63214_632) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 63214]
type = mapset
map = "check_63214_632"
trigger1 = map(check_63214_6) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 63214]
type = mapset
map = "check_63214_6"
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
value = 10
ignorehitpause = 1


[State -4, 63214 OFF]
type = mapset
map = "check_63214_OK"
trigger1 = map(check_63214_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 63214 OFF]
type = mapset
map = "check_63214_632"
trigger1 = map(check_63214_632) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 63214 OFF]
type = mapset
map = "check_63214_6"
trigger1 = map(check_63214_6) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 63214kk Timer]
type = mapadd
map = "cmd_63214kk"
trigger1 = map(cmd_63214kk) > 0
value = -1
ignorehitpause = 1

[State -4, 63214kk]
type = mapset
map = "cmd_63214kk"
trigger1 = map(check_63214_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_63214k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 63214kk OFF]
type = mapset
map = "cmd_63214kk"
trigger1 = map(cmd_63214kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 63214pp Timer]
type = mapadd
map = "cmd_63214pp"
trigger1 = map(cmd_63214pp) > 0
value = -1
ignorehitpause = 1

[State -4, 63214pp]
type = mapset
map = "cmd_63214pp"
trigger1 = map(check_63214_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_63214p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 63214pp OFF]
type = mapset
map = "cmd_63214pp"
trigger1 = map(cmd_63214pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 63214k Timer]
type = mapadd
map = "cmd_63214k"
trigger1 = map(cmd_63214k) > 0
value = -1
ignorehitpause = 1

[State -4, 63214k]
type = mapset
map = "cmd_63214k"
trigger1 = map(check_63214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 63214k OFF]
type = mapset
map = "cmd_63214k"
trigger1 = map(cmd_63214k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 63214p Timer]
type = mapadd
map = "cmd_63214p"
trigger1 = map(cmd_63214p) > 0
value = -1
ignorehitpause = 1

[State -4, 63214p]
type = mapset
map = "cmd_63214p"
trigger1 = map(check_63214_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 63214p OFF]
type = mapset
map = "cmd_63214p"
trigger1 = map(cmd_63214p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 22 --------------------------------------------------------------------------

[State -2, 22 Timer]
type = mapadd
map = "check_22_OK"
trigger1 = map(check_22_OK) > 0
value = -1
ignorehitpause = 1

[State -2, 22 Timer]
type = mapadd
map = "check_22_525"
trigger1 = map(check_22_525) > 0
value = -1
ignorehitpause = 1

[State -2, 22 Timer]
type = mapadd
map = "check_22_52"
trigger1 = map(check_22_52) > 0
value = -1
ignorehitpause = 1

[State -2, 22 Timer]
type = mapadd
map = "check_22_5"
trigger1 = map(check_22_5) > 0
value = -1
ignorehitpause = 1


[State -2, 22]
type = mapset
trigger1 = map(check_22_525) > 0
trigger1 = command = "$D"
map = "check_22_OK"
value = 10
ignorehitpause = 1

[State -2, 22]
type = mapset
trigger1 = map(check_22_52) > 0
trigger1 = command != "/$D"
map = "check_22_525"
value = 10
;value = map(check_22_52);neutral does not reset timer
ignorehitpause = 1

[State -2, 22]
type = mapset
trigger1 = map(check_22_5) > 0
trigger1 = command = "$D"
map = "check_22_52"
value = 10
ignorehitpause = 1

[State -2, 22]
type = mapset
trigger1 = command != "/$D"
map = "check_22_5"
value = 10
ignorehitpause = 1

[State -2, 22 OFF]
type = mapset
triggerall = map(check_22_5)
trigger1 = map(erase_special) || map(erase_super)
trigger2 = command = "$U"
trigger3 = map(check_22_5) <= 8
trigger3 = command = "/F" || command = "/B"
map = "check_22_5"
value = 0
ignorehitpause = 1

[State -2, 22 OFF]
type = mapset
trigger1 = map(check_22_52)
trigger1 = map(erase_special) || map(erase_super)
map = "check_22_52"
value = 0
ignorehitpause = 1

[State -2, 22 OFF]
type = mapset
trigger1 = map(check_22_525)
trigger1 = map(erase_special) || map(erase_super)
map = "check_22_525"
value = 0
ignorehitpause = 1

[State -2, 22 OFF]
type = mapset
trigger1 = map(check_22_OK)
trigger1 = map(erase_special) || map(erase_super)
map = "check_22_OK"
value = 0
ignorehitpause = 1

[State -4, 22 OFF]
type = mapset
map = "check_22_OK"
trigger1 = map(check_22_OK)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 22k Timer]
type = mapadd
map = "cmd_22k"
trigger1 = map(cmd_22k) > 0
value = -1
ignorehitpause = 1

[State -4, 22k]
type = mapset
map = "cmd_22k"
trigger1 = map(check_22_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 22k OFF]
type = mapset
map = "cmd_22k"
trigger1 = map(cmd_22k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 22p Timer]
type = mapadd
map = "cmd_22p"
trigger1 = map(cmd_22p) > 0
value = -1
ignorehitpause = 1

[State -4, 22p]
type = mapset
map = "cmd_22p"
trigger1 = map(check_22_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 22p OFF]
type = mapset
map = "cmd_22p"
trigger1 = map(cmd_22p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 22s Timer]
type = mapadd
map = "cmd_22s"
trigger1 = map(cmd_22s) > 0
value = -1
ignorehitpause = 1

[State -4, 22s]
type = mapset
map = "cmd_22s"
trigger1 = map(check_22_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 22s OFF]
type = mapset
map = "cmd_22s"
trigger1 = map(cmd_22s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ROOT 896 --------------------------------------------------------------------------

[State -4, Root 896 Timer]
type = mapadd
map = "check_root896_OK"
trigger1 = map(check_root896_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896 Timer]
type = mapadd
map = "check_root896_89"
trigger1 = map(check_root896_89) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896 Timer]
type = mapadd
map = "check_root896_8"
trigger1 = map(check_root896_8) > 0
value = -1
ignorehitpause = 1


[State -4, Root 896]
type = mapset
map = "check_root896_OK"
trigger1 = map(check_root896_89) > 0
trigger1 = command = "F"
value = 10
ignorehitpause = 1

[State -4, Root 896]
type = mapset
map = "check_root896_89"
trigger1 = map(check_root896_8) > 0
trigger1 = command = "UF"
value = 10
ignorehitpause = 1

[State -4, Root 896]
type = mapset
map = "check_root896_8"
trigger1 = command = "/U"
value = 10
ignorehitpause = 1


[State -4, Root 896 OFF]
type = mapset
map = "check_root896_OK"
trigger1 = map(check_root896_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 896 OFF]
type = mapset
map = "check_root896_89"
trigger1 = map(check_root896_89) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 896 OFF]
type = mapset
map = "check_root896_8"
trigger1 = map(check_root896_8) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 896kk Timer]
type = mapadd
map = "cmd_root896kk"
trigger1 = map(cmd_root896kk) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896kk]
type = mapset
map = "cmd_root896kk"
trigger1 = map(check_root896_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_root896k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 896kk OFF]
type = mapset
map = "cmd_root896kk"
trigger1 = map(cmd_root896kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 896pp Timer]
type = mapadd
map = "cmd_root896pp"
trigger1 = map(cmd_root896pp) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896pp]
type = mapset
map = "cmd_root896pp"
trigger1 = map(check_root896_OK)
trigger1 = map(check_p)
trigger2 = map(cmd_root896p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 896pp OFF]
type = mapset
map = "cmd_root896pp"
trigger1 = map(cmd_root896pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 896k Timer]
type = mapadd
map = "cmd_root896k"
trigger1 = map(cmd_root896k) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896k]
type = mapset
map = "cmd_root896k"
trigger1 = map(check_root896_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 896k OFF]
type = mapset
map = "cmd_root896k"
trigger1 = map(cmd_root896k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 896p Timer]
type = mapadd
map = "cmd_root896p"
trigger1 = map(cmd_root896p) > 0
value = -1
ignorehitpause = 1

[State -4, Root 896p]
type = mapset
map = "cmd_root896p"
trigger1 = map(check_root896_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 896p OFF]
type = mapset
map = "cmd_root896p"
trigger1 = map(cmd_root896p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 46 --------------------------------------------------------------------------

[State -4, 46 Timer]
type = mapadd
map = "check_46_OK"
trigger1 = map(check_46_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 46 Timer]
type = mapadd
map = "check_46_4"
trigger1 = map(check_46_4) > 0
value = -1
ignorehitpause = 1


[State -4, 46]
type = mapset
map = "check_46_OK"
trigger1 = map(check_46_4) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 46]
type = mapset
map = "check_46_4"
trigger1 = map(charge4) >= 45
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
value = 10
ignorehitpause = 1


[State -4, 46 OFF]
type = mapset
map = "check_46_OK"
trigger1 = map(check_46_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 46 OFF]
type = mapset
map = "check_46_4"
trigger1 = map(check_46_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 46kk Timer]
type = mapadd
map = "cmd_46kk"
trigger1 = map(cmd_46kk) > 0
value = -1
ignorehitpause = 1

[State -4, 46kk]
type = mapset
map = "cmd_46kk"
trigger1 = map(check_46_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_46k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 46kk OFF]
type = mapset
map = "cmd_46kk"
trigger1 = map(cmd_46kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 46pp Timer]
type = mapadd
map = "cmd_46pp"
trigger1 = map(cmd_46pp) > 0
value = -1
ignorehitpause = 1

[State -4, 46pp]
type = mapset
map = "cmd_46pp"
trigger1 = map(check_46_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_46k)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 46pp OFF]
type = mapset
map = "cmd_46pp"
trigger1 = map(cmd_46pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 46k Timer]
type = mapadd
map = "cmd_46k"
trigger1 = map(cmd_46k) > 0
value = -1
ignorehitpause = 1

[State -4, 46k]
type = mapset
map = "cmd_46k"
trigger1 = map(check_46_OK)
trigger1 = map(check_k)
trigger2 = map(cmd_46k)
trigger2 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 46k OFF]
type = mapset
map = "cmd_46k"
trigger1 = map(cmd_46k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 46p Timer]
type = mapadd
map = "cmd_46p"
trigger1 = map(cmd_46p) > 0
value = -1
ignorehitpause = 1

[State -4, 46p]
type = mapset
map = "cmd_46p"
trigger1 = map(check_46_OK)
trigger1 = map(check_p)
trigger2 = map(cmd_46k)
trigger2 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 46p OFF]
type = mapset
map = "cmd_46p"
trigger1 = map(cmd_46p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 28 --------------------------------------------------------------------------

[State -4, 28 Timer]
type = mapadd
map = "check_28_OK"
trigger1 = map(check_28_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 28 Timer]
type = mapadd
map = "check_28_2"
trigger1 = map(check_28_2) > 0
value = -1
ignorehitpause = 1


[State -4, 28]
type = mapset
map = "check_28_OK"
trigger1 = map(check_28_2) > 0
trigger1 = command = "$U" || command = "U"
value = 10
ignorehitpause = 1

[State -4, 28]
type = mapset
map = "check_28_2"
trigger1 = map(charge2) >= 45
trigger1 = command = "/$D"
value = 10
ignorehitpause = 1


[State -4, 28 OFF]
type = mapset
map = "check_28_OK"
trigger1 = map(check_28_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 28 OFF]
type = mapset
map = "check_28_2"
trigger1 = map(check_28_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 28kk Timer]
type = mapadd
map = "cmd_28kk"
trigger1 = map(cmd_28kk) > 0
value = -1
ignorehitpause = 1

[State -4, 28kk]
type = mapset
map = "cmd_28kk"
trigger1 = map(check_28_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_28k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 28kk OFF]
type = mapset
map = "cmd_28kk"
trigger1 = map(cmd_28kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 28pp Timer]
type = mapadd
map = "cmd_28pp"
trigger1 = map(cmd_28pp) > 0
value = -1
ignorehitpause = 1

[State -4, 28pp]
type = mapset
map = "cmd_28pp"
trigger1 = map(check_28_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_28k)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 28pp OFF]
type = mapset
map = "cmd_28pp"
trigger1 = map(cmd_28pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 28k Timer]
type = mapadd
map = "cmd_28k"
trigger1 = map(cmd_28k) > 0
value = -1
ignorehitpause = 1

[State -4, 28k]
type = mapset
map = "cmd_28k"
trigger1 = map(check_28_OK)
trigger1 = map(check_k)
trigger2 = map(cmd_28k)
trigger2 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 28k OFF]
type = mapset
map = "cmd_28k"
trigger1 = map(cmd_28k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 28p Timer]
type = mapadd
map = "cmd_28p"
trigger1 = map(cmd_28p) > 0
value = -1
ignorehitpause = 1

[State -4, 28p]
type = mapset
map = "cmd_28p"
trigger1 = map(check_28_OK)
trigger1 = map(check_p)
trigger2 = map(cmd_28k)
trigger2 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 28p OFF]
type = mapset
map = "cmd_28p"
trigger1 = map(cmd_28p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 360 --------------------------------------------------------------------------

[State -4, 360 Timer]
type = mapadd
map = "check_360_OK"
trigger1 = map(check_360_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_248"
trigger1 = map(check_360_248) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_24"
trigger1 = map(check_360_24) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_2"
trigger1 = map(check_360_2) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_486"
trigger1 = map(check_360_486) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_48"
trigger1 = map(check_360_48) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_4"
trigger1 = map(check_360_4) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_862"
trigger1 = map(check_360_862) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_86"
trigger1 = map(check_360_86) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_8"
trigger1 = map(check_360_8) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_624"
trigger1 = map(check_360_624) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_62"
trigger1 = map(check_360_62) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_6"
trigger1 = map(check_360_6) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_268"
trigger1 = map(check_360_268) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_26"
trigger1 = map(check_360_26) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_684"
trigger1 = map(check_360_684) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_68"
trigger1 = map(check_360_68) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_842"
trigger1 = map(check_360_842) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_84"
trigger1 = map(check_360_84) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_426"
trigger1 = map(check_360_426) > 0
value = -1
ignorehitpause = 1

[State -4, 360 Timer]
type = mapadd
map = "check_360_42"
trigger1 = map(check_360_4) > 0
value = -1
ignorehitpause = 1


;2486
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_248) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_248"
trigger1 = map(check_360_24) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_24"
trigger1 = map(check_360_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_2"
trigger1 = command = "/$D"
value = 10
ignorehitpause = 1


;4862
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_486) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_486"
trigger1 = map(check_360_48) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_48"
trigger1 = map(check_360_4) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_4"
trigger1 = command = "/$B"
value = 10
ignorehitpause = 1


;UFDB
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_862) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_862"
trigger1 = map(check_360_86) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_86"
trigger1 = map(check_360_8) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_8"
trigger1 = command = "/$U"
value = 10
ignorehitpause = 1


;FDBU
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_624) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_624"
trigger1 = map(check_360_62) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_62"
trigger1 = map(check_360_6) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_6"
trigger1 = command = "/$F"
value = 10
ignorehitpause = 1


;DFUB
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_268) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_268"
trigger1 = map(check_360_26) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_26"
trigger1 = map(check_360_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_2"
trigger1 = command = "/$D"
value = 10
ignorehitpause = 1


;FUBD
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_684) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_684"
trigger1 = map(check_360_68) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_68"
trigger1 = map(check_360_6) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_6"
trigger1 = command = "/$F"
value = 10
ignorehitpause = 1


;UBDF
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_842) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_842"
trigger1 = map(check_360_84) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_84"
trigger1 = map(check_360_8) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_8"
trigger1 = command = "/$U"
value = 10
ignorehitpause = 1


;BDFU
[State -4, 360]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_426) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_426"
trigger1 = map(check_360_42) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_42"
trigger1 = map(check_360_4) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 360]
type = mapset
map = "check_360_4"
trigger1 = command = "/$B"
value = 10
ignorehitpause = 1



[State -4, 360 OFF]
type = mapset
map = "check_360_OK"
trigger1 = map(check_360_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_248"
trigger1 = map(check_360_248) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_24"
trigger1 = map(check_360_24) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_2"
trigger1 = map(check_360_2) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_486"
trigger1 = map(check_360_486) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_48"
trigger1 = map(check_360_48) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_4"
trigger1 = map(check_360_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_862"
trigger1 = map(check_360_862) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_86"
trigger1 = map(check_360_86) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_8"
trigger1 = map(check_360_8) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_624"
trigger1 = map(check_360_624) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_62"
trigger1 = map(check_360_62) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_6"
trigger1 = map(check_360_6) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_268"
trigger1 = map(check_360_268) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_26"
trigger1 = map(check_360_26) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_684"
trigger1 = map(check_360_684) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_68"
trigger1 = map(check_360_68) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_842"
trigger1 = map(check_360_842) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_84"
trigger1 = map(check_360_84) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_426"
trigger1 = map(check_360_426) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360 OFF]
type = mapset
map = "check_360_42"
trigger1 = map(check_360_4) > 0
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 360kk Timer]
type = mapadd
map = "cmd_360kk"
trigger1 = map(cmd_360kk) > 0
value = -1
ignorehitpause = 1

[State -4, 360kk]
type = mapset
map = "cmd_360kk"
trigger1 = map(check_360_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_360k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 360kk OFF]
type = mapset
map = "cmd_360kk"
trigger1 = map(cmd_360kk)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360pp Timer]
type = mapadd
map = "cmd_360pp"
trigger1 = map(cmd_360pp) > 0
value = -1
ignorehitpause = 1

[State -4, 360pp]
type = mapset
map = "cmd_360pp"
trigger1 = map(check_360_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_360p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 360pp OFF]
type = mapset
map = "cmd_360pp"
trigger1 = map(cmd_360pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360k Timer]
type = mapadd
map = "cmd_360k"
trigger1 = map(cmd_360k) > 0
value = -1
ignorehitpause = 1

[State -4, 360k]
type = mapset
map = "cmd_360k"
trigger1 = map(check_360_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 360k OFF]
type = mapset
map = "cmd_360k"
trigger1 = map(cmd_360k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360p Timer]
type = mapadd
map = "cmd_360p"
trigger1 = map(cmd_360p) > 0
value = -1
ignorehitpause = 1

[State -4, 360p]
type = mapset
map = "cmd_360p"
trigger1 = map(check_360_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 360p OFF]
type = mapset
map = "cmd_360p"
trigger1 = map(cmd_360p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 360s Timer]
type = mapadd
map = "cmd_360s"
trigger1 = map(cmd_360s) > 0
value = -1
ignorehitpause = 1

[State -4, 360s]
type = mapset
map = "cmd_360s"
trigger1 = map(check_360_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 360s OFF]
type = mapset
map = "cmd_360s"
trigger1 = map(cmd_360s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 412 (NAKORURU) --------------------------------------------------------------------------

[State -4, 412 Timer]
type = mapadd
trigger1 = map(check_412_OK) > 0
map = "check_412_OK"
value = -1
ignorehitpause = 1

[State -4, 412 Timer]
type = mapadd
trigger1 = map(check_412_41) > 0
map = "check_412_41"
value = -1
ignorehitpause = 1

[State -4, 412 Timer]
type = mapadd
trigger1 = map(check_412_4) > 0
map = "check_412_4"
value = -1
ignorehitpause = 1


[State -4, 412]
type = mapset
trigger1 = map(check_412_41) > 0
trigger1 = command = "D"
map = "check_412_OK"
value = 10
ignorehitpause = 1

[State -4, 412]
type = mapset
trigger1 = map(check_412_4) > 0
trigger1 = ifelse(map(cmd_reverse), command = "DF", command = "DB")
map = "check_412_41"
value = 10
ignorehitpause = 1

[State -4, 412]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/F", command = "/B")
map = "check_412_4"
value = 10
ignorehitpause = 1


[State -4, 412 OFF]
type = mapset
trigger1 = map(check_412_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_412_OK"
value = 0
ignorehitpause = 1

[State -4, 412 OFF]
type = mapset
trigger1 = map(check_412_41) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_412_41"
value = 0
ignorehitpause = 1

[State -4, 412 OFF]
type = mapset
trigger1 = map(check_412_4) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_412_4"
value = 0
ignorehitpause = 1


[State -4, 412kk Timer]
type = mapadd
trigger1 = map(cmd_412kk) > 0
map = "cmd_412kk"
value = -1
ignorehitpause = 1

[State -4, 412kk]
type = mapset
trigger1 = map(check_412_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_412k)
trigger2 = map(check_kk)
map = "cmd_412kk"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 412kk OFF]
type = mapset
trigger1 = map(cmd_412kk)
trigger1 = map(erase_special) || map(erase_super)
map = "cmd_412kk"
value = 0
ignorehitpause = 1


[State -4, 412pp Timer]
type = mapadd
map = "cmd_412pp"
trigger1 = map(cmd_412pp) > 0
value = -1
ignorehitpause = 1

[State -4, 412pp]
type = mapset
map = "cmd_412pp"
trigger1 = map(check_412_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_412p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 412pp OFF]
type = mapset
map = "cmd_412pp"
trigger1 = map(cmd_412pp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 412k Timer]
type = mapadd
trigger1 = map(cmd_412k) > 0
map = "cmd_412k"
value = -1
ignorehitpause = 1

[State -4, 412k]
type = mapset
map = "cmd_412k"
trigger1 = map(check_412_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 412k OFF]
type = mapset
map = "cmd_412k"
trigger1 = map(cmd_412k)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 412p Timer]
type = mapadd
map = "cmd_412p"
trigger1 = map(cmd_412p) > 0
value = -1
ignorehitpause = 1

[State -4, 412p]
type = mapset
map = "cmd_412p"
trigger1 = map(check_412_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 412p OFF]
type = mapset
map = "cmd_412p"
trigger1 = map(cmd_412p)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 412s Timer]
type = mapadd
map = "cmd_412s"
trigger1 = map(cmd_412s) > 0
value = -1
ignorehitpause = 1

[State -4, 412s]
type = mapset
map = "cmd_412s"
trigger1 = map(check_412_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 412s OFF]
type = mapset
map = "cmd_412s"
trigger1 = map(cmd_412s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1



;--------------------------------------------------------------------------- 4632 (NAKORURU SUICIDE) --------------------------------------------------------------------------

[State -4, 4632 Timer]
type = mapadd
trigger1 = map(check_4632_OK) > 0
map = "check_4632_OK"
value = -1
ignorehitpause = 1

[State -4, 4632 Timer]
type = mapadd
trigger1 = map(check_4632_46) > 0
map = "check_4632_46"
value = -1
ignorehitpause = 1

[State -4, 4632 Timer]
type = mapadd
trigger1 = map(check_4632_4) > 0
map = "check_4632_4"
value = -1
ignorehitpause = 1


[State -4, 4632]
type = mapset
trigger1 = map(check_4632_46) > 0
trigger1 = command = "D"
map = "check_4632_OK"
value = 10
ignorehitpause = 1

[State -4, 4632]
type = mapset
trigger1 = map(check_4632_4) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
map = "check_4632_46"
value = 10
ignorehitpause = 1

[State -4, 4632]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/F", command = "/B")
map = "check_4632_4"
value = 10
ignorehitpause = 1


[State -4, 4632 OFF]
type = mapset
trigger1 = map(check_4632_OK) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_4632_OK"
value = 0
ignorehitpause = 1

[State -4, 4632 OFF]
type = mapset
trigger1 = map(check_4632_46) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_4632_46"
value = 0
ignorehitpause = 1

[State -4, 4632 OFF]
type = mapset
trigger1 = map(check_4632_4) > 0
trigger1 = map(erase_special) || map(erase_super)
map = "check_4632_4"
value = 0
ignorehitpause = 1


[State -4, 4632s Timer]
type = mapadd
map = "cmd_4632s"
trigger1 = map(cmd_4632s) > 0
value = -1
ignorehitpause = 1

[State -4, 4632s]
type = mapset
map = "cmd_4632s"
trigger1 = map(check_4632_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 4632s OFF]
type = mapset
map = "cmd_4632s"
trigger1 = map(cmd_4632s)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- MASH PUNCH --------------------------------------------------------------------------

[State -4, Mash Punch Timer]
type = mapadd
map = "cmd_mashp"
trigger1 = map(cmd_mashp) > 0
value = -1
ignorehitpause = 1

[State -4, Mash Punch Timer]
type = mapadd
map = "check_mashp_timer"
trigger1 = map(check_mashp_timer) > 0
value = -1
ignorehitpause = 1

[State -4, Mash Punch Counter]
type = mapset
map = "check_mashp_counter"
trigger1 = map(check_mashp_timer) <= 0
value = 0
ignorehitpause = 1


[State -4, Mash Punch Timer]
type = mapset
map = "check_mashp"
trigger1 = map(check_x) = 1
value = 16
ignorehitpause = 1

[State -4, Mash Punch Timer]
type = mapset
map = "check_mashp_timer"
trigger1 = map(check_x) = 1
value = 16
ignorehitpause = 1

[State -4, Mash Punch Timer]
type = mapset
map = "check_mashp_timer"
trigger1 = map(check_y) = 1
value = 14
ignorehitpause = 1

[State -4, Mash Punch Timer]
type = mapset
map = "check_mashp_timer"
trigger1 = map(check_z) = 1
value = 10
ignorehitpause = 1

[State -4, Mash Punch Timer]
type = mapset
map = "check_mashp_timer"
trigger1 = map(check_pp) = 1
value = 14
ignorehitpause = 1

[State -4, Mash Punch Counter Timer]
type = mapadd
map = "check_mashp_counter"
trigger1 = map(check_x) = 1
trigger2 = map(check_y) = 1
trigger3 = map(check_z) = 1
value = 1
ignorehitpause = 1


[State -4, Mash Punch ON]
type = mapset
map = "cmd_mashp"
trigger1 = map(check_mashp_counter) >= 5
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Mash Punch OFF]
type = mapset
map = "cmd_mashp"
trigger1 = map(cmd_mashp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Mash PP Timer]
type = mapadd
map = "cmd_mashpp"
trigger1 = map(cmd_mashpp) > 0
value = -1
ignorehitpause = 1

[State -4, Mash PP]
type = mapset
map = "cmd_mashpp"
trigger1 = map(check_mashp_counter) >= 5
trigger1 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Mash PP OFF]
type = mapset
map = "cmd_mashpp"
trigger1 = map(cmd_mashpp)
trigger1 = map(erase_special) || map(erase_super)
value = 0
ignorehitpause = 1


;==========================================================================< SUPER COMBO INPUTS >===========================================================================

;--------------------------------------------------------------------------- 236236 --------------------------------------------------------------------------

[State -4, 236236 Timer]
type = mapadd
map = "check_236236_OK"
trigger1 = map(check_236236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 236236 Timer]
type = mapadd
map = "check_236236_2362"
trigger1 = map(check_236236_2362) > 0
value = -1
ignorehitpause = 1

[State -4, 236236 Timer]
type = mapadd
map = "check_236236_236"
trigger1 = map(check_236236_236) > 0
value = -1
ignorehitpause = 1

[State -4, 236236 Timer]
type = mapadd
map = "check_236236_2"
trigger1 = map(check_236236_2) > 0
value = -1
ignorehitpause = 1


[State -4, 236236]
type = mapset
map = "check_236236_OK"
trigger1 = map(check_236236_2362) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 236236]
type = mapset
map = "check_236236_2362"
trigger1 = map(check_236236_236) > 0
trigger1 = command = "D"
value = 10
ignorehitpause = 1

[State -4, 236236]
type = mapset
map = "check_236236_236"
trigger1 = map(check_236236_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 236236];super cancel leniency
type = mapset
map = "check_236236_236"
trigger1 = map(check_236236_236) > 0
trigger1 = map(check_kk) || map(check_pp) || map(check_k) || map(check_p)
value = 10
ignorehitpause = 1

[State -4, 236236]
type = mapset
map = "check_236236_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, 236236 OFF]
type = mapset
map = "check_236236_OK"
trigger1 = map(check_236236_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 236236 OFF]
type = mapset
map = "check_236236_2362"
trigger1 = map(check_236236_2362) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 236236 OFF]
type = mapset
map = "check_236236_236"
trigger1 = map(check_236236_236) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 236236 OFF]
type = mapset
map = "check_236236_2"
trigger1 = map(check_236236_2) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236236kk Timer]
type = mapadd
map = "cmd_236236kk"
trigger1 = map(cmd_236236kk) > 0
value = -1
ignorehitpause = 1

[State -4, 236236kk]
type = mapset
map = "cmd_236236kk"
trigger1 = map(check_236236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_236236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236236kk OFF]
type = mapset
map = "cmd_236236kk"
trigger1 = map(cmd_236236kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236236pp Timer]
type = mapadd
map = "cmd_236236pp"
trigger1 = map(cmd_236236pp) > 0
value = -1
ignorehitpause = 1

[State -4, 236236pp]
type = mapset
map = "cmd_236236pp"
trigger1 = map(check_236236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_236236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236236pp OFF]
type = mapset
map = "cmd_236236pp"
trigger1 = map(cmd_236236pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236236k Timer]
type = mapadd
map = "cmd_236236k"
trigger1 = map(cmd_236236k) > 0
value = -1
ignorehitpause = 1

[State -4, 236236k]
type = mapset
map = "cmd_236236k"
trigger1 = map(check_236236_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236236k OFF]
type = mapset
map = "cmd_236236k"
trigger1 = map(cmd_236236k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236236p Timer]
type = mapadd
map = "cmd_236236p"
trigger1 = map(cmd_236236p) > 0
value = -1
ignorehitpause = 1

[State -4, 236236p]
type = mapset
map = "cmd_236236p"
trigger1 = map(check_236236_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236236p OFF]
type = mapset
map = "cmd_236236p"
trigger1 = map(cmd_236236p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 236236s Timer]
type = mapadd
map = "cmd_236236s"
trigger1 = map(cmd_236236s) > 0
value = -1
ignorehitpause = 1

[State -4, 236236s]
type = mapset
map = "cmd_236236s"
trigger1 = map(check_236236_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 236236s OFF]
type = mapset
map = "cmd_236236s"
trigger1 = map(cmd_236236s)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ROOT 236236 --------------------------------------------------------------------------

[State -4, Root 236236 Timer]
type = mapadd
map = "check_root236236_OK"
trigger1 = map(check_root236236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236 Timer]
type = mapadd
map = "check_root236236_2362"
trigger1 = map(check_root236236_2362) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236 Timer]
type = mapadd
map = "check_root236236_236"
trigger1 = map(check_root236236_236) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236 Timer]
type = mapadd
map = "check_root236236_2"
trigger1 = map(check_root236236_2) > 0
value = -1
ignorehitpause = 1


[State -4, Root 236236]
type = mapset
map = "check_root236236_OK"
trigger1 = map(check_root236236_2362) > 0
trigger1 = command = "F"
value = 10
ignorehitpause = 1

[State -4, Root 236236]
type = mapset
map = "check_root236236_2362"
trigger1 = map(check_root236236_236) > 0
trigger1 = command = "D"
value = 10
ignorehitpause = 1

[State -4, Root 236236]
type = mapset
map = "check_root236236_236"
trigger1 = map(check_236236_2) > 0
trigger1 = command = "F"
value = 10
ignorehitpause = 1

[State -4, Root 236236];super cancel leniency
type = mapset
map = "check_root236236_236"
trigger1 = map(check_236236_236) > 0
trigger1 = map(check_kk) || map(check_pp) || map(check_k) || map(check_p)
value = 10
ignorehitpause = 1

[State -4, Root 236236]
type = mapset
map = "check_root236236_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, Root 236236 OFF]
type = mapset
map = "check_root236236_OK"
trigger1 = map(check_root236236_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 236236 OFF]
type = mapset
map = "check_root236236_2362"
trigger1 = map(check_root236236_2362) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 236236 OFF]
type = mapset
map = "check_root236236_236"
trigger1 = map(check_root236236_236) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 236236 OFF]
type = mapset
map = "check_root236236_2"
trigger1 = map(check_root236236_2) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236236kk Timer]
type = mapadd
map = "cmd_root236236kk"
trigger1 = map(cmd_root236236kk) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236kk]
type = mapset
map = "cmd_root236236kk"
trigger1 = map(check_root236236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_root236236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236236kk OFF]
type = mapset
map = "cmd_root236236kk"
trigger1 = map(cmd_root236236kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236236pp Timer]
type = mapadd
map = "cmd_root236236pp"
trigger1 = map(cmd_root236236pp) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236pp]
type = mapset
map = "cmd_root236236pp"
trigger1 = map(check_root236236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_root236236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236236pp OFF]
type = mapset
map = "cmd_root236236pp"
trigger1 = map(cmd_root236236pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236236k Timer]
type = mapadd
map = "cmd_root236236k"
trigger1 = map(cmd_root236236k) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236k]
type = mapset
map = "cmd_root236236k"
trigger1 = map(check_root236236_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236236k OFF]
type = mapset
map = "cmd_root236236k"
trigger1 = map(cmd_root236236k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 236236p Timer]
type = mapadd
map = "cmd_root236236p"
trigger1 = map(cmd_root236236p) > 0
value = -1
ignorehitpause = 1

[State -4, Root 236236p]
type = mapset
map = "cmd_root236236p"
trigger1 = map(check_root236236_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 236236p OFF]
type = mapset
map = "cmd_root236236p"
trigger1 = map(cmd_root236236p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 214214 --------------------------------------------------------------------------

[State -4, 214214 Timer]
type = mapadd
map = "check_214214_OK"
trigger1 = map(check_214214_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 214214 Timer]
type = mapadd
map = "check_214214_2142"
trigger1 = map(check_214214_2142) > 0
value = -1
ignorehitpause = 1

[State -4, 214214 Timer]
type = mapadd
map = "check_214214_214"
trigger1 = map(check_214214_214) > 0
value = -1
ignorehitpause = 1

[State -4, 214214 Timer]
type = mapadd
map = "check_214214_2"
trigger1 = map(check_214214_2) > 0
value = -1
ignorehitpause = 1


[State -4, 214214]
type = mapset
map = "check_214214_OK"
trigger1 = map(check_214214_2142) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 214214]
type = mapset
map = "check_214214_2142"
trigger1 = map(check_214214_214) > 0
trigger1 = command = "D"
value = 10
ignorehitpause = 1

[State -4, 214214]
type = mapset
map = "check_214214_214"
trigger1 = map(check_214214_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 214214];super cancel leniency
type = mapset
map = "check_214214_214"
trigger1 = map(check_214214_214) > 0
trigger1 = map(check_kk) || map(check_pp) || map(check_k) || map(check_p)
value = 10
ignorehitpause = 1

[State -4, 214214]
type = mapset
map = "check_214214_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, 214214 OFF]
type = mapset
map = "check_214214_OK"
trigger1 = map(check_214214_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 214214 OFF]
type = mapset
map = "check_214214_2142"
trigger1 = map(check_214214_2142) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 214214 OFF]
type = mapset
map = "check_214214_214"
trigger1 = map(check_214214_214) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 214214 OFF]
type = mapset
map = "check_214214_2"
trigger1 = map(check_214214_2) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214214kk Timer]
type = mapadd
map = "cmd_214214kk"
trigger1 = map(cmd_214214kk) > 0
value = -1
ignorehitpause = 1

[State -4, 214214kk]
type = mapset
map = "cmd_214214kk"
trigger1 = map(check_214214_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_214214k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214214kk OFF]
type = mapset
map = "cmd_214214kk"
trigger1 = map(cmd_214214kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214214pp Timer]
type = mapadd
map = "cmd_214214pp"
trigger1 = map(cmd_214214pp) > 0
value = -1
ignorehitpause = 1

[State -4, 214214pp]
type = mapset
map = "cmd_214214pp"
trigger1 = map(check_214214_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_214214p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214214pp OFF]
type = mapset
map = "cmd_214214pp"
trigger1 = map(cmd_214214pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214214k Timer]
type = mapadd
map = "cmd_214214k"
trigger1 = map(cmd_214214k) > 0
value = -1
ignorehitpause = 1

[State -4, 214214k]
type = mapset
map = "cmd_214214k"
trigger1 = map(check_214214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214214k OFF]
type = mapset
map = "cmd_214214k"
trigger1 = map(cmd_214214k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214214p Timer]
type = mapadd
map = "cmd_214214p"
trigger1 = map(cmd_214214p) > 0
value = -1
ignorehitpause = 1

[State -4, 214214p]
type = mapset
map = "cmd_214214p"
trigger1 = map(check_214214_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214214p OFF]
type = mapset
map = "cmd_214214p"
trigger1 = map(cmd_214214p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 214214s Timer]
type = mapadd
map = "cmd_214214s"
trigger1 = map(cmd_214214s) > 0
value = -1
ignorehitpause = 1

[State -4, 214214s]
type = mapset
map = "cmd_214214s"
trigger1 = map(check_214214_OK)
trigger1 = map(check_s)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 214214s OFF]
type = mapset
map = "cmd_214214s"
trigger1 = map(cmd_214214s)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ROOT 214214 --------------------------------------------------------------------------

[State -4, Root 214214 Timer]
type = mapadd
map = "check_root214214_OK"
trigger1 = map(check_root214214_OK) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214214 Timer]
type = mapadd
map = "check_root214214_2142"
trigger1 = map(check_root214214_2142) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214214 Timer]
type = mapadd
map = "check_root214214_214"
trigger1 = map(check_root214214_214) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214214 Timer]
type = mapadd
map = "check_root214214_2"
trigger1 = map(check_root214214_2) > 0
value = -1
ignorehitpause = 1


[State -4, Root 214214]
type = mapset
map = "check_root214214_OK"
trigger1 = map(check_root214214_2142) > 0
trigger1 = command = "B"
value = 10
ignorehitpause = 1

[State -4, Root 214214]
type = mapset
map = "check_root214214_2142"
trigger1 = map(check_root214214_214) > 0
trigger1 = command = "D"
value = 10
ignorehitpause = 1

[State -4, Root 214214]
type = mapset
map = "check_root214214_214"
trigger1 = map(check_root214214_2) > 0
trigger1 = command = "B"
value = 10
ignorehitpause = 1

[State -4, Root 214214];super cancel leniency
type = mapset
map = "check_root214214_214"
trigger1 = map(check_root214214_214) > 0
trigger1 = map(check_kk) || map(check_pp) || map(check_k) || map(check_p)
value = 10
ignorehitpause = 1

[State -4, Root 214214]
type = mapset
map = "check_root214214_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, Root 214214 OFF]
type = mapset
map = "check_root214214_OK"
trigger1 = map(check_root214214_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 214214 OFF]
type = mapset
map = "check_root214214_2142"
trigger1 = map(check_root214214_2142) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 214214 OFF]
type = mapset
map = "check_root214214_214"
trigger1 = map(check_root214214_214) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Root 214214 OFF]
type = mapset
map = "check_root214214_2"
trigger1 = map(check_root214214_2) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214214k Timer]
type = mapadd
map = "cmd_root214214k"
trigger1 = map(cmd_root214214k) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214214k]
type = mapset
map = "cmd_root214214k"
trigger1 = map(check_root214214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214214k OFF]
type = mapset
map = "cmd_root214214k"
trigger1 = map(cmd_root214214k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, Root 214214p Timer]
type = mapadd
map = "cmd_root214214p"
trigger1 = map(cmd_root214214p) > 0
value = -1
ignorehitpause = 1

[State -4, Root 214214p]
type = mapset
map = "cmd_root214214p"
trigger1 = map(check_root214214_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Root 214214p OFF]
type = mapset
map = "cmd_root214214p"
trigger1 = map(cmd_root214214p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 624624 --------------------------------------------------------------------------

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_OK"
trigger1 = map(check_624624_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_62462"
trigger1 = map(check_624624_62462) > 0
value = -1
ignorehitpause = 1

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_6246"
trigger1 = map(check_624624_6246) > 0
value = -1
ignorehitpause = 1

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_624"
trigger1 = map(check_624624_624) > 0
value = -1
ignorehitpause = 1

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_62"
trigger1 = map(check_624624_62) > 0
value = -1
ignorehitpause = 1

[State -4, 624624 Timer]
type = mapadd
map = "check_624624_6"
trigger1 = map(check_624624_6) > 0
value = -1
ignorehitpause = 1


[State -4, 624624]
type = mapset
map = "check_624624_OK"
trigger1 = map(check_624624_62462) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 624624]
type = mapset
map = "check_624624_62462"
trigger1 = map(check_624624_6246) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 624624]
type = mapset
map = "check_624624_6246"
trigger1 = map(check_624624_624) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 624624]
type = mapset
map = "check_624624_624"
trigger1 = map(check_624624_62) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 624624]
type = mapset
map = "check_624624_62"
trigger1 = map(check_624624_6) > 0
trigger1 = command = "$D"
value = 10
ignorehitpause = 1

[State -4, 624624]
type = mapset
map = "check_624624_6"
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
value = 10
ignorehitpause = 1


[State -4, 624624 OFF]
type = mapset
map = "check_624624_OK"
trigger1 = map(check_624624_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 624624 OFF]
type = mapset
map = "check_624624_62462"
trigger1 = map(check_624624_62462) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 624624 OFF]
type = mapset
map = "check_624624_6246"
trigger1 = map(check_624624_6246) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 624624 OFF]
type = mapset
map = "check_624624_624"
trigger1 = map(check_624624_624) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 624624 OFF]
type = mapset
map = "check_624624_62"
trigger1 = map(check_624624_62) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 624624 OFF]
type = mapset
map = "check_624624_6"
trigger1 = map(check_624624_6) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 624624kk Timer]
type = mapadd
map = "cmd_624624kk"
trigger1 = map(cmd_624624kk) > 0
value = -1
ignorehitpause = 1

[State -4, 624624kk]
type = mapset
map = "cmd_624624kk"
trigger1 = map(check_624624_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_624624k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 624624kk OFF]
type = mapset
map = "cmd_624624kk"
trigger1 = map(cmd_624624kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 624624pp Timer]
type = mapadd
map = "cmd_624624pp"
trigger1 = map(cmd_624624pp) > 0
value = -1
ignorehitpause = 1

[State -4, 624624pp]
type = mapset
map = "cmd_624624pp"
trigger1 = map(check_624624_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_624624p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 624624pp OFF]
type = mapset
map = "cmd_624624pp"
trigger1 = map(cmd_624624pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 624624k Timer]
type = mapadd
map = "cmd_624624k"
trigger1 = map(cmd_624624k) > 0
value = -1
ignorehitpause = 1

[State -4, 624624k]
type = mapset
map = "cmd_624624k"
trigger1 = map(check_624624_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 624624k OFF]
type = mapset
map = "cmd_624624k"
trigger1 = map(cmd_624624k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 624624p Timer]
type = mapadd
map = "cmd_624624p"
trigger1 = map(cmd_624624p) > 0
value = -1
ignorehitpause = 1

[State -4, 624624p]
type = mapset
map = "cmd_624624p"
trigger1 = map(check_624624_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 624624p OFF]
type = mapset
map = "cmd_624624p"
trigger1 = map(cmd_624624p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 222 --------------------------------------------------------------------------

[State -2, 222 Timer]
type = mapadd
map = "check_222_OK"
trigger1 = map(check_222_OK) > 0
value = -1
ignorehitpause = 1

[State -2, 222 Timer]
type = mapadd
map = "check_222_52525"
trigger1 = map(check_222_52525) > 0
value = -1
ignorehitpause = 1

[State -2, 222 Timer]
type = mapadd
map = "check_222_5252"
trigger1 = map(check_222_5252) > 0
value = -1
ignorehitpause = 1

[State -2, 222 Timer]
type = mapadd
map = "check_222_525"
trigger1 = map(check_222_525) > 0
value = -1
ignorehitpause = 1

[State -2, 222 Timer]
type = mapadd
map = "check_222_52"
trigger1 = map(check_222_52) > 0
value = -1
ignorehitpause = 1

[State -2, 222 Timer]
type = mapadd
map = "check_222_5"
trigger1 = map(check_222_5) > 0
value = -1
ignorehitpause = 1


[State -2, 222]
type = mapset
trigger1 = map(check_222_52525) > 0
trigger1 = command = "$D"
map = "check_222_OK"
value = 10
ignorehitpause = 1

[State -2, 222]
type = mapset
trigger1 = map(check_222_5252) > 0
trigger1 = command != "/$D";from Jedah
map = "check_222_52525"
value = 10
;value = map(check_222_5252);neutral does not reset timer
ignorehitpause = 1

[State -2, 222]
type = mapset
trigger1 = map(check_222_525) > 0
trigger1 = command = "$D"
map = "check_222_5252"
value = 10
ignorehitpause = 1

[State -2, 222]
type = mapset
trigger1 = map(check_222_52) > 0
trigger1 = command != "/$D"
map = "check_222_525"
value = 10
;value = map(check_222_52);neutral does not reset timer
ignorehitpause = 1

[State -2, 222]
type = mapset
trigger1 = map(check_222_5) > 0
trigger1 = command = "$D"
map = "check_222_52"
value = 10
ignorehitpause = 1

[State -2, 222]
type = mapset
trigger1 = command != "/$D"
map = "check_222_5"
value = 10
ignorehitpause = 1


[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_5)
trigger1 = map(erase_super)
map = "check_222_5"
value = 0
ignorehitpause = 1

[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_52)
trigger1 = map(erase_super)
map = "check_222_52"
value = 0
ignorehitpause = 1

[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_525)
trigger1 = map(erase_super)
map = "check_222_525"
value = 0
ignorehitpause = 1

[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_5252)
trigger1 = map(erase_super)
map = "check_222_5252"
value = 0
ignorehitpause = 1

[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_52525)
trigger1 = map(erase_super)
map = "check_222_52525"
value = 0
ignorehitpause = 1

[State -2, 222 OFF]
type = mapset
trigger1 = map(check_222_OK)
trigger1 = map(erase_super)
map = "check_222_OK"
value = 0
ignorehitpause = 1

[State -4, 222 OFF]
type = mapset
map = "check_222_OK"
trigger1 = map(check_222_OK)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 222kk Timer]
type = mapadd
map = "cmd_222kk"
trigger1 = map(cmd_222kk) > 0
value = -1
ignorehitpause = 1

[State -4, 222kk]
type = mapset
map = "cmd_222kk"
trigger1 = map(check_222_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_222k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 222kk OFF]
type = mapset
map = "cmd_222kk"
trigger1 = map(cmd_222kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 222pp Timer]
type = mapadd
map = "cmd_222pp"
trigger1 = map(cmd_222pp) > 0
value = -1
ignorehitpause = 1

[State -4, 222pp]
type = mapset
map = "cmd_222pp"
trigger1 = map(check_222_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_222p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 222pp OFF]
type = mapset
map = "cmd_222pp"
trigger1 = map(cmd_222pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 2363214 --------------------------------------------------------------------------

[State -4, 2363214 Timer]
type = mapadd
map = "check_2363214_OK"
trigger1 = map(check_2363214_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214 Timer]
type = mapadd
map = "check_2363214_23632"
trigger1 = map(check_2363214_23632) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214 Timer]
type = mapadd
map = "check_2363214_236"
trigger1 = map(check_2363214_236) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214 Timer]
type = mapadd
map = "check_2363214_2"
trigger1 = map(check_2363214_2) > 0
value = -1
ignorehitpause = 1


[State -4, 2363214]
type = mapset
map = "check_2363214_OK"
trigger1 = map(check_2363214_23632) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
value = 10
ignorehitpause = 1

[State -4, 2363214]
type = mapset
map = "check_2363214_23632"
trigger1 = map(check_2363214_236) > 0
trigger1 = command = "D"
value = 10
ignorehitpause = 1

[State -4, 2363214]
type = mapset
map = "check_2363214_236"
trigger1 = map(check_2363214_2) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 2363214]
type = mapset
map = "check_2363214_2"
trigger1 = command = "/D"
value = 10
ignorehitpause = 1


[State -4, 2363214 OFF]
type = mapset
map = "check_2363214_OK"
trigger1 = map(check_2363214_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 2363214 OFF]
type = mapset
map = "check_2363214_23632"
trigger1 = map(check_2363214_23632) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 2363214 OFF]
type = mapset
map = "check_2363214_236"
trigger1 = map(check_2363214_236) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 2363214 OFF]
type = mapset
map = "check_2363214_2"
trigger1 = map(check_2363214_2) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 2363214kk Timer]
type = mapadd
map = "cmd_2363214kk"
trigger1 = map(cmd_2363214kk) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214kk]
type = mapset
map = "cmd_2363214kk"
trigger1 = map(check_2363214_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_2363214k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 2363214kk OFF]
type = mapset
map = "cmd_2363214kk"
trigger1 = map(cmd_2363214kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 2363214pp Timer]
type = mapadd
map = "cmd_2363214pp"
trigger1 = map(cmd_2363214pp) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214pp]
type = mapset
map = "cmd_2363214pp"
trigger1 = map(check_2363214_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_2363214p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 2363214pp OFF]
type = mapset
map = "cmd_2363214pp"
trigger1 = map(cmd_2363214pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 2363214k Timer]
type = mapadd
map = "cmd_2363214k"
trigger1 = map(cmd_2363214k) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214k]
type = mapset
map = "cmd_2363214k"
trigger1 = map(check_2363214_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 2363214k OFF]
type = mapset
map = "cmd_2363214k"
trigger1 = map(cmd_2363214k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 2363214p Timer]
type = mapadd
map = "cmd_2363214p"
trigger1 = map(cmd_2363214p) > 0
value = -1
ignorehitpause = 1

[State -4, 2363214p]
type = mapset
map = "cmd_2363214p"
trigger1 = map(check_2363214_OK)
trigger1 = map(check_p)
trigger2 = map(cmd_2363214k)
trigger2 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 2363214p OFF]
type = mapset
map = "cmd_2363214p"
trigger1 = map(cmd_2363214p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 641236 (SHOKOKEN) --------------------------------------------------------------------------

[State -4, 641236 Timer]
type = mapadd
map = "check_641236_OK"
trigger1 = map(check_641236_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 641236 Timer]
type = mapadd
map = "check_641236_6412"
trigger1 = map(check_641236_6412) > 0
value = -1
ignorehitpause = 1

[State -4, 641236 Timer]
type = mapadd
map = "check_641236_64"
trigger1 = map(check_641236_64) > 0
value = -1
ignorehitpause = 1

[State -4, 641236 Timer]
type = mapadd
map = "check_641236_6"
trigger1 = map(check_641236_6) > 0
value = -1
ignorehitpause = 1


[State -4, 641236]
type = mapset
trigger1 = map(check_641236_6412) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
map = "check_641236_OK"
value = 10
ignorehitpause = 1

[State -4, 641236]
type = mapset
trigger1 = map(check_641236_64) > 0
trigger1 = command = "D"
map = "check_641236_6412"
value = 10
ignorehitpause = 1

[State -4, 641236]
type = mapset
trigger1 = map(check_641236_6) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "check_641236_64"
value = 10
ignorehitpause = 1

[State -4, 641236]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
map = "check_641236_6"
value = 10
ignorehitpause = 1


[State -4, 641236 OFF]
type = mapset
map = "check_641236_OK"
trigger1 = map(check_641236_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 641236 OFF]
type = mapset
map = "check_641236_6412"
trigger1 = map(check_641236_6412) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 641236 OFF]
type = mapset
map = "check_641236_64"
trigger1 = map(check_641236_64) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 641236 OFF]
type = mapset
map = "check_641236_6"
trigger1 = map(check_641236_6) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 641236kk Timer]
type = mapadd
map = "cmd_641236kk"
trigger1 = map(cmd_641236kk) > 0
value = -1
ignorehitpause = 1

[State -4, 641236kk]
type = mapset
map = "cmd_641236kk"
trigger1 = map(check_641236_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_641236k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 641236kk OFF]
type = mapset
map = "cmd_641236kk"
trigger1 = map(cmd_641236kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 641236pp Timer]
type = mapadd
map = "cmd_641236pp"
trigger1 = map(cmd_641236pp) > 0
value = -1
ignorehitpause = 1

[State -4, 641236pp]
type = mapset
map = "cmd_641236pp"
trigger1 = map(check_641236_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_641236p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 641236pp OFF]
type = mapset
map = "cmd_641236pp"
trigger1 = map(cmd_641236pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 641236k Timer]
type = mapadd
map = "cmd_641236k"
trigger1 = map(cmd_641236k) > 0
value = -1
ignorehitpause = 1

[State -4, 641236k]
type = mapset
map = "cmd_641236k"
trigger1 = map(check_641236_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 641236k OFF]
type = mapset
map = "cmd_641236k"
trigger1 = map(cmd_641236k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 641236p Timer]
type = mapadd
map = "cmd_641236p"
trigger1 = map(cmd_641236p) > 0
value = -1
ignorehitpause = 1

[State -4, 641236p]
type = mapset
map = "cmd_641236p"
trigger1 = map(check_641236_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 641236p OFF]
type = mapset
map = "cmd_641236p"
trigger1 = map(cmd_641236p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 632142 (SIMPLIFIED RAISING STORM) --------------------------------------------------------------------------

[State -4, 632142 Timer]
type = mapadd
map = "check_632142_OK"
trigger1 = map(check_632142_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 632142 Timer]
type = mapadd
map = "check_632142_63214"
trigger1 = map(check_632142_63214) > 0
value = -1
ignorehitpause = 1

[State -4, 632142 Timer]
type = mapadd
map = "check_632142_632"
trigger1 = map(check_632142_632) > 0
value = -1
ignorehitpause = 1

[State -4, 632142 Timer]
type = mapadd
map = "check_632142_6"
trigger1 = map(check_632142_6) > 0
value = -1
ignorehitpause = 1


[State -4, 632142]
type = mapset
trigger1 = map(check_632142_63214) > 0
trigger1 = command = "D"
map = "check_632142_OK"
value = 10
ignorehitpause = 1

[State -4, 632142]
type = mapset
trigger1 = map(check_632142_632) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "check_632142_63214"
value = 10
ignorehitpause = 1

[State -4, 632142]
type = mapset
trigger1 = map(check_632142_6) > 0
trigger1 = command = "D"
map = "check_632142_632"
value = 10
ignorehitpause = 1

[State -4, 632142]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
map = "check_632142_6"
value = 10
ignorehitpause = 1


[State -4, 632142 OFF]
type = mapset
map = "check_632142_OK"
trigger1 = map(check_632142_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632142 OFF]
type = mapset
map = "check_632142_63214"
trigger1 = map(check_632142_63214) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632142 OFF]
type = mapset
map = "check_632142_632"
trigger1 = map(check_632142_632) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632142 OFF]
type = mapset
map = "check_632142_6"
trigger1 = map(check_632142_6) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632142pp Timer]
type = mapadd
map = "cmd_632142pp"
trigger1 = map(cmd_632142pp) > 0
value = -1
ignorehitpause = 1

[State -4, 632142pp]
type = mapset
map = "cmd_632142pp"
trigger1 = map(check_632142_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_632142p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632142pp OFF]
type = mapset
map = "cmd_632142pp"
trigger1 = map(cmd_632142pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632142p Timer]
type = mapadd
map = "cmd_632142p"
trigger1 = map(cmd_632142p) > 0
value = -1
ignorehitpause = 1

[State -4, 632142p]
type = mapset
map = "cmd_632142p"
trigger1 = map(check_632142_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632142p OFF]
type = mapset
map = "cmd_632142p"
trigger1 = map(cmd_632142p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 632146 (DEADLY RAVE) --------------------------------------------------------------------------

[State -4, 632146 Timer]
type = mapadd
map = "check_632146_OK"
trigger1 = map(check_632146_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 632146 Timer]
type = mapadd
map = "check_632146_63214"
trigger1 = map(check_632146_63214) > 0
value = -1
ignorehitpause = 1

[State -4, 632146 Timer]
type = mapadd
map = "check_632146_632"
trigger1 = map(check_632146_632) > 0
value = -1
ignorehitpause = 1

[State -4, 632146 Timer]
type = mapadd
map = "check_632146_6"
trigger1 = map(check_632146_6) > 0
value = -1
ignorehitpause = 1


[State -4, 632146]
type = mapset
trigger1 = map(check_632146_63214) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
map = "check_632146_OK"
value = 10
ignorehitpause = 1

[State -4, 632146]
type = mapset
trigger1 = map(check_632146_632) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "check_632146_63214"
value = 10
ignorehitpause = 1

[State -4, 632146]
type = mapset
trigger1 = map(check_632146_6) > 0
trigger1 = command = "D"
map = "check_632146_632"
value = 10
ignorehitpause = 1

[State -4, 632146]
type = mapset
trigger1 = ifelse(map(cmd_reverse), command = "/B", command = "/F")
map = "check_632146_6"
value = 10
ignorehitpause = 1


[State -4, 632146 OFF]
type = mapset
map = "check_632146_OK"
trigger1 = map(check_632146_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632146 OFF]
type = mapset
map = "check_632146_63214"
trigger1 = map(check_632146_63214) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632146 OFF]
type = mapset
map = "check_632146_632"
trigger1 = map(check_632146_632) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 632146 OFF]
type = mapset
map = "check_632146_6"
trigger1 = map(check_632146_6) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632146kk Timer]
type = mapadd
map = "cmd_632146kk"
trigger1 = map(cmd_632146kk) > 0
value = -1
ignorehitpause = 1

[State -4, 632146kk]
type = mapset
map = "cmd_632146kk"
trigger1 = map(check_632146_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_632146k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632146kk OFF]
type = mapset
map = "cmd_632146kk"
trigger1 = map(cmd_632146kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632146pp Timer]
type = mapadd
map = "cmd_632146pp"
trigger1 = map(cmd_632146pp) > 0
value = -1
ignorehitpause = 1

[State -4, 632146pp]
type = mapset
map = "cmd_632146pp"
trigger1 = map(check_632146_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_632146p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632146pp OFF]
type = mapset
map = "cmd_632146pp"
trigger1 = map(cmd_632146pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632146k Timer]
type = mapadd
map = "cmd_632146k"
trigger1 = map(cmd_632146k) > 0
value = -1
ignorehitpause = 1

[State -4, 632146k]
type = mapset
map = "cmd_632146k"
trigger1 = map(check_632146_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632146k OFF]
type = mapset
map = "cmd_632146k"
trigger1 = map(cmd_632146k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 632146p Timer]
type = mapadd
map = "cmd_632146p"
trigger1 = map(cmd_632146p) > 0
value = -1
ignorehitpause = 1

[State -4, 632146p]
type = mapset
map = "cmd_632146p"
trigger1 = map(check_632146_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 632146p OFF]
type = mapset
map = "cmd_632146p"
trigger1 = map(cmd_632146p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 4646 --------------------------------------------------------------------------

[State -4, 4646 Timer]
type = mapadd
map = "check_4646_OK"
trigger1 = map(check_4646_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 4646 Timer]
type = mapadd
map = "check_4646_464"
trigger1 = map(check_4646_464) > 0
value = -1
ignorehitpause = 1

[State -4, 4646 Timer]
type = mapadd
map = "check_4646_46"
trigger1 = map(check_4646_46) > 0
value = -1
ignorehitpause = 1

[State -4, 4646 Timer]
type = mapadd
map = "check_4646_4"
trigger1 = map(check_4646_4) > 0
value = -1
ignorehitpause = 1


[State -4, 4646]
type = mapset
map = "check_4646_OK"
trigger1 = map(check_4646_464) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
value = 10
ignorehitpause = 1

[State -4, 4646]
type = mapset
map = "check_4646_464"
trigger1 = map(check_4646_46) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 4646]
type = mapset
map = "check_4646_46"
trigger1 = map(check_4646_4) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 4646];super cancel leniency
type = mapset
map = "check_4646_46"
trigger1 = map(check_4646_46) > 0
trigger1 = map(check_kk) || map(check_pp) || map(check_k) || map(check_p)
value = 20
ignorehitpause = 1

[State -4, 4646]
type = mapset
map = "check_4646_4"
trigger1 = map(charge4) >= 45
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
value = 10
ignorehitpause = 1


[State -4, 4646 OFF]
type = mapset
map = "check_4646_OK"
trigger1 = map(check_4646_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 4646 OFF]
type = mapset
map = "check_4646_464"
trigger1 = map(check_4646_464) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 4646 OFF]
type = mapset
map = "check_4646_46"
trigger1 = map(check_4646_46) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 4646 OFF]
type = mapset
map = "check_4646_4"
trigger1 = map(check_4646_4) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 4646kk Timer]
type = mapadd
map = "cmd_4646kk"
trigger1 = map(cmd_4646kk) > 0
value = -1
ignorehitpause = 1

[State -4, 4646kk]
type = mapset
map = "cmd_4646kk"
trigger1 = map(check_4646_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_4646k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 4646kk OFF]
type = mapset
map = "cmd_4646kk"
trigger1 = map(cmd_4646kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 4646pp Timer]
type = mapadd
map = "cmd_4646pp"
trigger1 = map(cmd_4646pp) > 0
value = -1
ignorehitpause = 1

[State -4, 4646pp]
type = mapset
map = "cmd_4646pp"
trigger1 = map(check_4646_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_4646p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 4646pp OFF]
type = mapset
map = "cmd_4646pp"
trigger1 = map(cmd_4646pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 4646k Timer]
type = mapadd
map = "cmd_4646k"
trigger1 = map(cmd_4646k) > 0
value = -1
ignorehitpause = 1

[State -4, 4646k]
type = mapset
map = "cmd_4646k"
trigger1 = map(check_4646_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 4646k OFF]
type = mapset
map = "cmd_4646k"
trigger1 = map(cmd_4646k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 4646p Timer]
type = mapadd
map = "cmd_4646p"
trigger1 = map(cmd_4646p) > 0
value = -1
ignorehitpause = 1

[State -4, 4646p]
type = mapset
map = "cmd_4646p"
trigger1 = map(check_4646_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 4646p OFF]
type = mapset
map = "cmd_4646p"
trigger1 = map(cmd_4646p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- 1319 --------------------------------------------------------------------------

[State -4, 1319 Timer]
type = mapadd
map = "check_1319_OK"
trigger1 = map(check_1319_OK) > 0
value = -1
ignorehitpause = 1

[State -4, 1319 Timer]
type = mapadd
map = "check_1319_131"
trigger1 = map(check_1319_131) > 0
value = -1
ignorehitpause = 1

[State -4, 1319 Timer]
type = mapadd
map = "check_1319_13"
trigger1 = map(check_1319_13) > 0
value = -1
ignorehitpause = 1

[State -4, 1319 Timer]
type = mapadd
map = "check_1319_1"
trigger1 = map(check_1319_1) > 0
value = -1
ignorehitpause = 1


[State -4, 1319]
type = mapset
map = "check_1319_OK"
trigger1 = map(check_1319_131) > 0
trigger1 = command = "$U"
value = 10
ignorehitpause = 1

[State -4, 1319]
type = mapset
map = "check_1319_131"
trigger1 = map(check_1319_13) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 10
ignorehitpause = 1

[State -4, 1319]
type = mapset
map = "check_1319_13"
trigger1 = map(check_1319_1) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 10
ignorehitpause = 1

[State -4, 1319]
type = mapset
map = "check_1319_1"
trigger1 = map(charge2) >= 45
trigger1 = map(charge4) >= 45
trigger1 = ifelse(map(cmd_reverse), command = "/DF", command = "/DB")
value = 10
ignorehitpause = 1


[State -4, 1319 OFF]
type = mapset
map = "check_1319_OK"
trigger1 = map(check_1319_OK) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 1319 OFF]
type = mapset
map = "check_1319_131"
trigger1 = map(check_1319_131) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 1319 OFF]
type = mapset
map = "check_1319_13"
trigger1 = map(check_1319_13) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, 1319 OFF]
type = mapset
map = "check_1319_1"
trigger1 = map(check_1319_1) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 1319kk Timer]
type = mapadd
map = "cmd_1319kk"
trigger1 = map(cmd_1319kk) > 0
value = -1
ignorehitpause = 1

[State -4, 1319kk]
type = mapset
map = "cmd_1319kk"
trigger1 = map(check_1319_OK)
trigger1 = map(check_kk)
trigger2 = map(cmd_1319k)
trigger2 = map(check_kk)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 1319kk OFF]
type = mapset
map = "cmd_1319kk"
trigger1 = map(cmd_1319kk)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 1319pp Timer]
type = mapadd
map = "cmd_1319pp"
trigger1 = map(cmd_1319pp) > 0
value = -1
ignorehitpause = 1

[State -4, 1319pp]
type = mapset
map = "cmd_1319pp"
trigger1 = map(check_1319_OK)
trigger1 = map(check_pp)
trigger2 = map(cmd_1319p)
trigger2 = map(check_pp)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 1319pp OFF]
type = mapset
map = "cmd_1319pp"
trigger1 = map(cmd_1319pp)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 1319k Timer]
type = mapadd
map = "cmd_1319k"
trigger1 = map(cmd_1319k) > 0
value = -1
ignorehitpause = 1

[State -4, 1319k]
type = mapset
map = "cmd_1319k"
trigger1 = map(check_1319_OK)
trigger1 = map(check_k)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 1319k OFF]
type = mapset
map = "cmd_1319k"
trigger1 = map(cmd_1319k)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


[State -4, 1319p Timer]
type = mapadd
map = "cmd_1319p"
trigger1 = map(cmd_1319p) > 0
value = -1
ignorehitpause = 1

[State -4, 1319p]
type = mapset
map = "cmd_1319p"
trigger1 = map(check_1319_OK)
trigger1 = map(check_p)
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, 1319p OFF]
type = mapset
map = "cmd_1319p"
trigger1 = map(cmd_1319p)
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- RAGING DEMON --------------------------------------------------------------------------

[State -4, Demon Timer]
type = mapadd
map = "cmd_demon"
trigger1 = map(cmd_demon) > 0
value = -1
ignorehitpause = 1

[State -4, Demon Timer]
type = mapadd
map = "check_demon_xx6a"
trigger1 = map(check_demon_xx6a) > 0
value = -1
ignorehitpause = 1

[State -4, Demon Timer]
type = mapadd
map = "check_demon_xx6"
trigger1 = map(check_demon_xx6) > 0
value = -1
ignorehitpause = 1

[State -4, Demon Timer]
type = mapadd
map = "check_demon_xx"
trigger1 = map(check_demon_xx) > 0
value = -1
ignorehitpause = 1

[State -4, Demon Timer]
type = mapadd
map = "check_demon_x"
trigger1 = map(check_demon_x) > 0
value = -1
ignorehitpause = 1


[State -4, Demon];Reversing order of last 3 inputs allows pressing them simultaneously
type = mapset
map = "check_demon_xx6"
trigger1 = map(check_demon_xx) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
value = 15
ignorehitpause = 1

[State -4, Demon]
type = mapset
map = "check_demon_xx6a"
trigger1 = map(check_demon_xx6) > 0
trigger1 = command = "a"
value = 15
ignorehitpause = 1

[State -4, Demon]
type = mapset
map = "cmd_demon"
trigger1 = map(check_demon_xx6a) > 0
trigger1 = command = "z"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Demon]
type = mapset
map = "check_demon_xx"
trigger1 = map(check_demon_x) > 0
trigger1 = command = "x"
value = 15
ignorehitpause = 1

[State -4, Demon]
type = mapset
map = "check_demon_x"
trigger1 = command = "x"
value = 15
ignorehitpause = 1


[State -4, Demon OFF]
type = mapset
map = "cmd_demon"
trigger1 = map(cmd_demon) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Demon OFF]
type = mapset
map = "check_demon_xx6a"
trigger1 = map(check_demon_xx6a) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Demon OFF]
type = mapset
map = "check_demon_xx6"
trigger1 = map(check_demon_xx6) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Demon OFF]
type = mapset
map = "check_demon_xx"
trigger1 = map(check_demon_xx) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Demon OFF]
type = mapset
map = "check_demon_x"
trigger1 = map(check_demon_x) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- TENRAIHA --------------------------------------------------------------------------

[State -4, Tenraiha Timer]
type = mapadd
map = "cmd_tenraiha"
trigger1 = map(cmd_tenraiha) > 0
value = -1
ignorehitpause = 1

[State -4, Tenraiha Timer]
type = mapadd
map = "check_tenraiha_acyy"
trigger1 = map(check_tenraiha_acyy) > 0
value = -1
ignorehitpause = 1

[State -4, Tenraiha Timer]
type = mapadd
map = "check_tenraiha_acy"
trigger1 = map(check_tenraiha_acy) > 0
value = -1
ignorehitpause = 1

[State -4, Tenraiha Timer]
type = mapadd
map = "check_tenraiha_ac"
trigger1 = map(check_tenraiha_ac) > 0
value = -1
ignorehitpause = 1

[State -4, Tenraiha Timer]
type = mapadd
map = "check_tenraiha_a"
trigger1 = map(check_tenraiha_a) > 0
value = -1
ignorehitpause = 1


[State -4, Tenraiha];Reversing order of last 2 inputs allows pressing them simultaneously
type = mapset
map = "check_tenraiha_acyy"
trigger1 = map(check_tenraiha_acy) > 0
trigger1 = command = "y"
value = 15
ignorehitpause = 1

[State -4, Tenraiha]
type = mapset
map = "cmd_tenraiha"
trigger1 = map(check_tenraiha_acyy) > 0
trigger1 = command = "U"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Tenraiha]
type = mapset
map = "check_tenraiha_acy"
trigger1 = map(check_tenraiha_ac) > 0
trigger1 = command = "y"
value = 15
ignorehitpause = 1

[State -4, Tenraiha]
type = mapset
map = "check_tenraiha_ac"
trigger1 = map(check_tenraiha_a) > 0
trigger1 = command = "c"
value = 15
ignorehitpause = 1

[State -4, Tenraiha]
type = mapset
map = "check_tenraiha_a"
trigger1 = command = "a"
value = 15
ignorehitpause = 1


[State -4, Tenraiha OFF]
type = mapset
map = "cmd_tenraiha"
trigger1 = map(cmd_tenraiha) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Tenraiha OFF]
type = mapset
map = "check_tenraiha_acyy"
trigger1 = map(check_tenraiha_acyy) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Tenraiha OFF]
type = mapset
map = "check_tenraiha_acy"
trigger1 = map(check_tenraiha_acy) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Tenraiha OFF]
type = mapset
map = "check_tenraiha_ac"
trigger1 = map(check_tenraiha_ac) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Tenraiha OFF]
type = mapset
map = "check_tenraiha_a"
trigger1 = map(check_tenraiha_a) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- OTOKO MICHI --------------------------------------------------------------------------

[State -4, Otoko Timer]
type = mapadd
map = "cmd_otoko"
trigger1 = map(cmd_otoko) > 0
value = -1
ignorehitpause = 1

[State -4, Otoko Timer]
type = mapadd
map = "check_otoko_zaBx"
trigger1 = map(check_otoko_zaBx) > 0
value = -1
ignorehitpause = 1

[State -4, Otoko Timer]
type = mapadd
map = "check_otoko_zaB"
trigger1 = map(check_otoko_zaB) > 0
value = -1
ignorehitpause = 1

[State -4, Otoko Timer]
type = mapadd
map = "check_otoko_za"
trigger1 = map(check_otoko_za) > 0
value = -1
ignorehitpause = 1

[State -4, Otoko Timer]
type = mapadd
map = "check_otoko_z"
trigger1 = map(check_otoko_z) > 0
value = -1
ignorehitpause = 1


[State -4, Otoko]
type = mapset
map = "cmd_otoko"
trigger1 = map(check_otoko_zaBx) > 0
trigger1 = command = "x"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Otoko]
type = mapset
map = "check_otoko_zaBx"
trigger1 = map(check_otoko_zaB) > 0
trigger1 = command = "x"
value = 15
ignorehitpause = 1

[State -4, Otoko]
type = mapset
map = "check_otoko_zaB"
trigger1 = map(check_otoko_za) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 15
ignorehitpause = 1

[State -4, Otoko]
type = mapset
map = "check_otoko_za"
trigger1 = map(check_otoko_z) > 0
trigger1 = command = "a"
value = 15
ignorehitpause = 1

[State -4, Otoko]
type = mapset
map = "check_otoko_z"
trigger1 = command = "z"
value = 15
ignorehitpause = 1


[State -4, Otoko OFF]
type = mapset
map = "cmd_otoko"
trigger1 = map(cmd_otoko) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Otoko OFF]
type = mapset
map = "check_otoko_zaBx"
trigger1 = map(check_otoko_zaBx) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Otoko OFF]
type = mapset
map = "check_otoko_zaB"
trigger1 = map(check_otoko_zaB) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Otoko OFF]
type = mapset
map = "check_otoko_za"
trigger1 = map(check_otoko_za) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Otoko OFF]
type = mapset
map = "check_otoko_z"
trigger1 = map(check_otoko_z) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- ETERNAL SLUMBER --------------------------------------------------------------------------

[State -4, Slumber Timer]
type = mapadd
map = "cmd_slumber"
trigger1 = map(cmd_slumber) > 0
value = -1
ignorehitpause = 1

[State -4, Slumber Timer]
type = mapadd
map = "check_slumber_xbBy"
trigger1 = map(check_slumber_xbBy) > 0
value = -1
ignorehitpause = 1

[State -4, Slumber Timer]
type = mapadd
map = "check_slumber_xbB"
trigger1 = map(check_slumber_xbB) > 0
value = -1
ignorehitpause = 1

[State -4, Slumber Timer]
type = mapadd
map = "check_slumber_xb"
trigger1 = map(check_slumber_xb) > 0
value = -1
ignorehitpause = 1

[State -4, Slumber Timer]
type = mapadd
map = "check_slumber_x"
trigger1 = map(check_slumber_x) > 0
value = -1
ignorehitpause = 1


[State -4, Slumber]
type = mapset
map = "cmd_slumber"
trigger1 = map(check_slumber_xbBy) > 0
trigger1 = command = "c"
value = map(cmd_buffertime)
ignorehitpause = 1

[State -4, Slumber]
type = mapset
map = "check_slumber_xbBy"
trigger1 = map(check_slumber_xbB) > 0
trigger1 = command = "y"
value = 15
ignorehitpause = 1

[State -4, Slumber]
type = mapset
map = "check_slumber_xbB"
trigger1 = map(check_slumber_xb) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
value = 15
ignorehitpause = 1

[State -4, Slumber]
type = mapset
map = "check_slumber_xb"
trigger1 = map(check_slumber_x) > 0
trigger1 = command = "b"
value = 15
ignorehitpause = 1

[State -4, Slumber]
type = mapset
map = "check_slumber_x"
trigger1 = command = "x"
value = 15
ignorehitpause = 1


[State -4, Slumber OFF]
type = mapset
map = "cmd_slumber"
trigger1 = map(cmd_slumber) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Slumber OFF]
type = mapset
map = "check_slumber_xbBy"
trigger1 = map(check_slumber_xbBy) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Slumber OFF]
type = mapset
map = "check_slumber_xbB"
trigger1 = map(check_slumber_xbB) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Slumber OFF]
type = mapset
map = "check_slumber_xb"
trigger1 = map(check_slumber_xb) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1

[State -4, Slumber OFF]
type = mapset
map = "check_slumber_x"
trigger1 = map(check_slumber_x) > 0
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1


;==========================================================================< OTHER INPUTS >===========================================================================

;--------------------------------------------------------------------------- FORWARD DASH --------------------------------------------------------------------------

[State -6, Dash Forward Timer]
type = mapadd
map = "cmd_66"
trigger1 = map(cmd_66) > 0
value = -1
ignorehitpause = 1

[State -6, Dash Forward Timer]
type = mapadd
map = "check_66_565"
trigger1 = map(check_66_565) > 0
value = -1
ignorehitpause = 1

[State -6, Dash Forward Timer]
type = mapadd
map = "check_66_56"
trigger1 = map(check_66_56) > 0
value = -1
ignorehitpause = 1

[State -6, Dash Forward Timer]
type = mapadd
map = "check_66_5"
trigger1 = map(check_66_5) > 0
value = -1
ignorehitpause = 1

[State -6, Dash Forward]
type = mapset
trigger1 = map(check_66_565) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
map = "cmd_66"
value = 1
ignorehitpause = 1

[State -6, Dash Forward]
type = mapset
trigger1 = map(check_66_56) > 0
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_66_565"
value = map(check_66_56);neutral does not reset timer
ignorehitpause = 1

[State -6, Dash Forward]
type = mapset
trigger1 = map(check_66_5) > 0
trigger1 = ifelse(map(cmd_reverse), command = "B", command = "F")
map = "check_66_56"
value = 10
ignorehitpause = 1

[State -6, Dash Forward]
type = mapset
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_66_5"
value = 10
ignorehitpause = 1

[State -6, Dash Forward OFF]
type = mapset
triggerall = map(check_66_5)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_66_5) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_66_5"
value = 0
ignorehitpause = 1

[State -6, Dash Forward OFF]
type = mapset
triggerall = map(check_66_56)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_66_56) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_66_56"
value = 0
ignorehitpause = 1

[State -6, Dash Forward OFF]
type = mapset
triggerall = map(check_66_565)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_66_565) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_66_565"
value = 0
ignorehitpause = 1

[State -6, Dash Forward OFF]
type = mapset
triggerall = map(cmd_66)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(cmd_66) <= 5
trigger2 = command = "/U" || command = "/D"
map = "cmd_66"
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- BACKWARD DASH --------------------------------------------------------------------------

[State -4, Dash Backward Timer]
type = mapadd
map = "cmd_44"
trigger1 = map(cmd_44) > 0
value = -1
ignorehitpause = 1

[State -4, Dash Backward Timer]
type = mapadd
map = "check_44_545"
trigger1 = map(check_44_545) > 0
value = -1
ignorehitpause = 1

[State -4, Dash Backward Timer]
type = mapadd
map = "check_44_54"
trigger1 = map(check_44_54) > 0
value = -1
ignorehitpause = 1

[State -4, Dash Backward Timer]
type = mapadd
map = "check_44_5"
trigger1 = map(check_44_5) > 0
value = -1
ignorehitpause = 1

[State -4, Dash Backward]
type = mapset
trigger1 = map(check_44_545) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "cmd_44"
value = 1
ignorehitpause = 1

[State -4, Dash Backward]
type = mapset
trigger1 = map(check_44_54) > 0
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_44_545"
value = map(check_44_54);neutral does not reset timer
ignorehitpause = 1

[State -4, Dash Backward]
type = mapset
trigger1 = map(check_44_5) > 0
trigger1 = ifelse(map(cmd_reverse), command = "F", command = "B")
map = "check_44_54"
value = 10
ignorehitpause = 1

[State -4, Dash Backward]
type = mapset
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_44_5"
value = 10
ignorehitpause = 1

[State -4, Dash Backward OFF]
type = mapset
triggerall = map(check_44_5)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_44_5) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_44_5"
value = 0
ignorehitpause = 1

[State -4, Dash Backward OFF]
type = mapset
triggerall = map(check_44_54)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_44_54) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_44_54"
value = 0
ignorehitpause = 1

[State -4, Dash Backward OFF]
type = mapset
triggerall = map(check_44_545)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_44_545) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_44_545"
value = 0
ignorehitpause = 1

[State -4, Dash Backward OFF]
type = mapset
triggerall = map(cmd_44)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(cmd_44) <= 5
trigger2 = command = "/U" || command = "/D"
map = "cmd_44"
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- HIGH JUMP --------------------------------------------------------------------------

[State -2, High Jump Timer]
type = mapadd
map = "cmd_highjump"
trigger1 = map(cmd_highjump) > 0
value = -1
ignorehitpause = 1

[State -2, High Jump Timer]
type = mapadd
map = "check_highjump_52"
trigger1 = map(check_highjump_52) > 0
value = -1
ignorehitpause = 1

[State -2, High Jump Timer]
type = mapadd
map = "check_highjump_5"
trigger1 = map(check_highjump_5) > 0
value = -1
ignorehitpause = 1


[State -2, High Jump]
type = mapset
trigger1 = map(check_highjump_52) > 0
trigger1 = command = "$U"
map = "cmd_highjump"
value = 1
ignorehitpause = 1

[State -2, High Jump]
type = mapset
trigger1 = map(check_highjump_5) > 0
trigger1 = command = "$D"
map = "check_highjump_52"
value = 16;KOF2002
;12 MvC1 normal speed
ignorehitpause = 1

[State -2, High Jump]
type = mapset
trigger1 = command != "/$D"
map = "check_highjump_5"
value = 10
ignorehitpause = 1


;--------------------------------------------------------------------------- FORWARD AIR DASH --------------------------------------------------------------------------

[State -6, Air Dash Forward Timer]
type = mapadd
map = "cmd_air66"
trigger1 = map(cmd_air66) > 0
value = -1
ignorehitpause = 1

[State -6, Air Dash Forward Timer]
type = mapadd
map = "check_air66_565"
trigger1 = map(check_air66_565) > 0
value = -1
ignorehitpause = 1

[State -6, Air Dash Forward Timer]
type = mapadd
map = "check_air66_56"
trigger1 = map(check_air66_56) > 0
value = -1
ignorehitpause = 1

[State -6, Air Dash Forward Timer]
type = mapadd
map = "check_air66_5"
trigger1 = map(check_air66_5) > 0
value = -1
ignorehitpause = 1

[State -6, Air Dash Forward]
type = mapset
trigger1 = map(check_air66_565) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
map = "cmd_air66"
value = 1
ignorehitpause = 1

[State -6, Air Dash Forward]
type = mapset
trigger1 = map(check_air66_56) > 0
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_air66_565"
value = map(check_air66_56);neutral does not reset timer
ignorehitpause = 1

[State -6, Air Dash Forward]
type = mapset
trigger1 = map(check_air66_5) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$B", command = "$F")
map = "check_air66_56"
value = 10
ignorehitpause = 1

[State -6, Air Dash Forward]
type = mapset
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_air66_5"
value = 10
ignorehitpause = 1

[State -6, Air Dash Forward OFF]
type = mapset
triggerall = map(check_air66_5)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_air66_5) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air66_5"
value = 0
ignorehitpause = 1

[State -6, Air Dash Forward OFF]
type = mapset
triggerall = map(check_air66_56)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_air66_56) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air66_56"
value = 0
ignorehitpause = 1

[State -6, Air Dash Forward OFF]
type = mapset
triggerall = map(check_air66_565)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(check_air66_565) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air66_565"
value = 0
ignorehitpause = 1

[State -6, Air Dash Forward OFF]
type = mapset
triggerall = map(cmd_air66)
trigger1 = ifelse(map(cmd_reverse), command = "/$F", command = "/$B")
trigger2 = map(cmd_air66) <= 5
trigger2 = command = "/U" || command = "/D"
map = "cmd_air66"
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- BACKWARD AIR DASH --------------------------------------------------------------------------

[State -4, Air Dash Backward Timer]
type = mapadd
map = "cmd_air44"
trigger1 = map(cmd_air44) > 0
value = -1
ignorehitpause = 1

[State -4, Air Dash Backward Timer]
type = mapadd
map = "check_air44_545"
trigger1 = map(check_air44_545) > 0
value = -1
ignorehitpause = 1

[State -4, Air Dash Backward Timer]
type = mapadd
map = "check_air44_54"
trigger1 = map(check_air44_54) > 0
value = -1
ignorehitpause = 1

[State -4, Air Dash Backward Timer]
type = mapadd
map = "check_air44_5"
trigger1 = map(check_air44_5) > 0
value = -1
ignorehitpause = 1

[State -4, Air Dash Backward]
type = mapset
trigger1 = map(check_air44_545) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
map = "cmd_air44"
value = 1
ignorehitpause = 1

[State -4, Air Dash Backward]
type = mapset
trigger1 = map(check_air44_54) > 0
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_air44_545"
value = map(check_air44_54);neutral does not reset timer
ignorehitpause = 1

[State -4, Air Dash Backward]
type = mapset
trigger1 = map(check_air44_5) > 0
trigger1 = ifelse(map(cmd_reverse), command = "$F", command = "$B")
map = "check_air44_54"
value = 10
ignorehitpause = 1

[State -4, Air Dash Backward]
type = mapset
trigger1 = command != "/$D"
trigger1 = command != "/$F"
trigger1 = command != "/$U"
trigger1 = command != "/$B"
map = "check_air44_5"
value = 10
ignorehitpause = 1

[State -4, Air Dash Backward OFF]
type = mapset
triggerall = map(check_air44_5)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_air44_5) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air44_5"
value = 0
ignorehitpause = 1

[State -4, Air Dash Backward OFF]
type = mapset
triggerall = map(check_air44_54)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_air44_54) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air44_54"
value = 0
ignorehitpause = 1

[State -4, Air Dash Backward OFF]
type = mapset
triggerall = map(check_air44_545)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(check_air44_545) <= 5
trigger2 = command = "/U" || command = "/D"
map = "check_air44_545"
value = 0
ignorehitpause = 1

[State -4, Air Dash Backward OFF]
type = mapset
triggerall = map(cmd_air44)
trigger1 = ifelse(map(cmd_reverse), command = "/$B", command = "/$F")
trigger2 = map(cmd_air44) <= 5
trigger2 = command = "/U" || command = "/D"
map = "cmd_air44"
value = 0
ignorehitpause = 1


;--------------------------------------------------------------------------- CHARGE MECHANICS --------------------------------------------------------------------------

[State -4, Back Charge Decrease Timer]
type = mapadd
map = "charge4"
triggerall = map(charge4) > 0
trigger1 = !map(cmd_reverse)
trigger1 = command != "holdback" || command = "holdfwd"
trigger2 = map(cmd_reverse)
trigger2 = command = "holdback" || command != "holdfwd"
value = -1
ignorehitpause = 1

[State -4, Back Charge Increase]
type = mapset
map = "charge4"
triggerall = map(charge4) < 45
trigger1 = !map(cmd_reverse)
trigger1 = command = "holdback" && command != "holdfwd"
trigger2 = map(cmd_reverse)
trigger2 = command != "holdback" && command = "holdfwd"
value = ifelse(var(20), 45, map(charge4) + 1)
ignorehitpause = 1

[State -4, Down Charge Decrease Timer]
type = mapadd
map = "charge2"
trigger1 = map(charge2) > 0
trigger1 = command != "holddown"
value = -1
ignorehitpause = 1

[State -4, Down Charge Increase]
type = mapset
map = "charge2"
trigger1 = map(charge2) < 45
trigger1 = command = "holddown"
value = ifelse(var(20), 45, map(charge2) + 1)
ignorehitpause = 1


;--------------------------------------------------------------------------- DISABLE ERASER --------------------------------------------------------------------------

[State -4, Normals ON]
type = mapset
map = "erase_normal"
trigger1 = map(erase_normal)
value = 0
ignorehitpause = 1

[State -4, Specials ON]
type = mapset
map = "erase_special"
trigger1 = map(erase_special)
value = 0
ignorehitpause = 1

[State -4, Supers ON]
type = mapset
map = "erase_super"
trigger1 = map(erase_super)
value = 0
ignorehitpause = 1
