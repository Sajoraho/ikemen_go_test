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
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
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
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
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
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[command]
name = "Final Atomic Buster x"
command = ~F, D, B, U, F, D, B, U, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~F, D, B, U, F, D, B, U, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~D, B, U, F, D, B, U, F, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~D, B, U, F, D, B, U, F, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~B, U, F, D, B, U, F, D, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~B, U, F, D, B, U, F, D, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~U, F, D, B, U, F, D, B, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~U, F, D, B, U, F, D, B, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~B, D, F, U, B, D, F, U, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~B, D, F, U, B, D, F, U, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~D, F, U, B, D, F, U, B, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~D, F, U, B, D, F, U, B, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~F, U, B, D, F, U, B, D, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~F, U, B, D, F, U, B, D, ~x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~U, B, D, F, U, B, D, F, x
time = 50

[command]
name = "Final Atomic Buster x"
command = ~U, B, D, F, U, B, D, F, ~x
time = 50

[command]
name = "Final Atomic Buster y"
command = ~F, D, B, U, F, D, B, U, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~F, D, B, U, F, D, B, U, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~D, B, U, F, D, B, U, F, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~D, B, U, F, D, B, U, F, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~B, U, F, D, B, U, F, D, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~B, U, F, D, B, U, F, D, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~U, F, D, B, U, F, D, B, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~U, F, D, B, U, F, D, B, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~B, D, F, U, B, D, F, U, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~B, D, F, U, B, D, F, U, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~D, F, U, B, D, F, U, B, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~D, F, U, B, D, F, U, B, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~F, U, B, D, F, U, B, D, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~F, U, B, D, F, U, B, D, ~y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~U, B, D, F, U, B, D, F, y
time = 50

[command]
name = "Final Atomic Buster y"
command = ~U, B, D, F, U, B, D, F, ~y
time = 50

[command]
name = "Final Atomic Buster z"
command = ~F, D, B, U, F, D, B, U, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~F, D, B, U, F, D, B, U, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~D, B, U, F, D, B, U, F, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~D, B, U, F, D, B, U, F, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~B, U, F, D, B, U, F, D, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~B, U, F, D, B, U, F, D, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~U, F, D, B, U, F, D, B, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~U, F, D, B, U, F, D, B, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~B, D, F, U, B, D, F, U, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~B, D, F, U, B, D, F, U, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~D, F, U, B, D, F, U, B, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~D, F, U, B, D, F, U, B, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~F, U, B, D, F, U, B, D, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~F, U, B, D, F, U, B, D, ~z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~U, B, D, F, U, B, D, F, z
time = 50

[command]
name = "Final Atomic Buster z"
command = ~U, B, D, F, U, B, D, F, ~z
time = 50

[command]
name = "Super Aerial Russian Slam a"
command = ~D, F, D, DF, a
time = 20

[command]
name = "Super Aerial Russian Slam a"
command = ~D, F, D, DF, ~a
time = 20

[command]
name = "Super Aerial Russian Slam b"
command = ~D, F, D, DF, b
time = 20

[command]
name = "Super Aerial Russian Slam b"
command = ~D, F, D, DF, ~b
time = 20

[command]
name = "Super Aerial Russian Slam c"
command = ~D, F, D, DF, c
time = 20

[command]
name = "Super Aerial Russian Slam c"
command = ~D, F, D, DF, ~c
time = 20

;-| Special Motions |------------------------------------------------------
[command]
name = "Atomic Suplex a"
command = ~F, D, B, U, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~F, D, B, U, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~D, B, U, F, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~D, B, U, F, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~B, U, F, D, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~B, U, F, D, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~U, F, D, B, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~U, F, D, B, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~B, D, F, U, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~B, D, F, U, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~D, F, U, B, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~D, F, U, B, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~F, U, B, D, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~F, U, B, D, ~a
time = 15

[command]
name = "Atomic Suplex a"
command = ~U, B, D, F, a
time = 15

[command]
name = "Atomic Suplex a"
command = ~U, B, D, F, ~a
time = 15

[command]
name = "Atomic Suplex b"
command = ~F, D, B, U, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~F, D, B, U, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~D, B, U, F, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~D, B, U, F, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~B, U, F, D, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~B, U, F, D, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~U, F, D, B, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~U, F, D, B, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~B, D, F, U, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~B, D, F, U, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~D, F, U, B, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~D, F, U, B, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~F, U, B, D, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~F, U, B, D, ~b
time = 15

[command]
name = "Atomic Suplex b"
command = ~U, B, D, F, b
time = 15

[command]
name = "Atomic Suplex b"
command = ~U, B, D, F, ~b
time = 15

[command]
name = "Atomic Suplex c"
command = ~F, D, B, U, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~F, D, B, U, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~D, B, U, F, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~D, B, U, F, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~B, U, F, D, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~B, U, F, D, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~U, F, D, B, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~U, F, D, B, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~B, D, F, U, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~B, D, F, U, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~D, F, U, B, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~D, F, U, B, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~F, U, B, D, c
time = 15

[command]
name = "Atomic Suplex c"
command = ~F, U, B, D, ~c
time = 15

[command]
name = "Atomic Suplex c"
command = ~U, B, D, F, c
time = 15

[command]
name = "Screw Piledriver x"
command = ~F, D, B, U, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~F, D, B, U, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~D, B, U, F, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~D, B, U, F, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~B, U, F, D, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~B, U, F, D, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~U, F, D, B, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~U, F, D, B, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~B, D, F, U, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~B, D, F, U, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~D, F, U, B, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~D, F, U, B, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~F, U, B, D, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~F, U, B, D, ~x
time = 15

[command]
name = "Screw Piledriver x"
command = ~U, B, D, F, x
time = 15

[command]
name = "Screw Piledriver x"
command = ~U, B, D, F, ~x
time = 15

[command]
name = "Screw Piledriver y"
command = ~F, D, B, U, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~F, D, B, U, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~D, B, U, F, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~D, B, U, F, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~B, U, F, D, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~B, U, F, D, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~U, F, D, B, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~U, F, D, B, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~B, D, F, U, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~B, D, F, U, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~D, F, U, B, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~D, F, U, B, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~F, U, B, D, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~F, U, B, D, ~y
time = 15

[command]
name = "Screw Piledriver y"
command = ~U, B, D, F, y
time = 15

[command]
name = "Screw Piledriver y"
command = ~U, B, D, F, ~y
time = 15

[command]
name = "Screw Piledriver z"
command = ~F, D, B, U, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~F, D, B, U, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~D, B, U, F, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~D, B, U, F, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~B, U, F, D, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~B, U, F, D, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~U, F, D, B, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~U, F, D, B, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~B, D, F, U, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~B, D, F, U, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~D, F, U, B, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~D, F, U, B, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~F, U, B, D, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~F, U, B, D, ~z
time = 15

[command]
name = "Screw Piledriver z"
command = ~U, B, D, F, z
time = 15

[command]
name = "Screw Piledriver z"
command = ~U, B, D, F, ~z
time = 15

[command]
name = "Aerial Russian Slam a"
command = ~F, D, DF, a
time = 15

[command]
name = "Aerial Russian Slam a"
command = ~F, D, DF, ~a
time = 15

[command]
name = "Aerial Russian Slam b"
command = ~F, D, DF, b
time = 15

[command]
name = "Aerial Russian Slam b"
command = ~F, D, DF, ~b
time = 15

[command]
name = "Aerial Russian Slam c"
command = ~F, D, DF, c
time = 15

[command]
name = "Aerial Russian Slam c"
command = ~F, D, DF, ~c
time = 15

[Command]
name = "Flat1"
command = ~F, D, DF, x

[Command]
name = "Flat2"
command = ~F, D, DF, y

[Command]
name = "Flat3"
command = ~F, D, DF, z

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
name = "f claw"
command = /$D, c+z
time = 1

[Command]
name = "roll"
command = /$F,a+x
time = 1

[Command]
name = "dodge"
command = a+x
time = 1


[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "gcancelroll"
command = /$F,a+x
time = 1

[Command]
name = "gcancelattack"
command = /$F,b+y
time = 1

[Command]
name = "QLariat"
command = a+b
time = 1

[Command]
name = "QLariat"
command = b+c
time = 1

[Command]
name = "QLariat"
command = a+c
time = 1

[Command]
name = "SLariat"
command = x+y
time = 1

[Command]
name = "SLariat"
command = y+z
time = 1

[Command]
name = "SLariat"
command = x+z
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
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
name = "a1"
command = a
time = 1
buffer.time = 1

[Command]
name = "b1"
command = b
time = 1
buffer.time = 1

[Command]
name = "c1"
command = c
time = 1
buffer.time = 1

[Command]
name = "x1"
command = x
time = 1
buffer.time = 1

[Command]
name = "y1"
command = y
time = 1
buffer.time = 1

[Command]
name = "z1"
command = z
time = 1
buffer.time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
name = "fwd";Required (do not remove)
command = F
time = 1

[Command]
name = "back";Required (do not remove)
command = B
time = 1

[Command]
name = "up" ;Required (do not remove)
command = U
time = 1

[Command]
name = "down";Required (do not remove)
command = D
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



;-| Dir + Button |----------------------------------------------------
[Command]
name = "foward y"
command = /$F, y
time = 1

[Command]
name = "forward z"
command = /$F, z
time = 1

[Command]
name = "up z"
command = /$U, z
time = 1

[Command]
name = "down z"
command = /$D, z
time = 1

[Command]
name = "down b"
command = /$D, b
time = 1

[Command]
name = "downback c"
command = /$DB, c
time = 1

[Command]
name = "downback b"
command = /$DB, b
time = 1

[Command]
name = "holdz";Required (do not remove)
command = /z
time = 1

[Command]
name = "holdc";Required (do not remove)
command = /c
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
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = statetype = S
triggerall = Stateno !=[720,721]
trigger1 = command = "FF" && ctrl

 

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------



;===========================================================================
[State -1, Final Atomic Buster]
Type = ChangeState
TriggerAll = power >= 3000 && (Command = "Final Atomic Buster z")
Trigger1 = StateType != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2040
;---------------------------------------------------------------------------
[State -1, Super Aerial Russian Slam]
Type = ChangeState
TriggerAll = power >= 3000 && (Command = "Super Aerial Russian Slam c")
Trigger1 = StateType != a && (Ctrl || stateno = 52)
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2030
;---------------------------------------------------------------------------
[State -1, Super Aerial Russian Slam]
Type = ChangeState
TriggerAll = power >= 2000 && (Command = "Super Aerial Russian Slam b")
Trigger1 = StateType != a && (Ctrl || stateno = 52)
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2030
;---------------------------------------------------------------------------
[State -1, Super Aerial Russian Slam]
Type = ChangeState
TriggerAll = power >= 1000 && (Command = "Super Aerial Russian Slam a")
Trigger1 = StateType != a && (Ctrl || stateno = 52)
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2020
;---------------------------------------------------------------------------
[State -1, Final Atomic Buster]
Type = ChangeState
TriggerAll = power >= 2000 && (Command = "Final Atomic Buster y")
Trigger1 = StateType != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2010
;---------------------------------------------------------------------------
[State -1, Final Atomic Buster]
Type = ChangeState
TriggerAll = power >= 1000 && (Command = "Final Atomic Buster x")
Trigger1 = StateType != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 2000
;---------------------------------------------------------------------------
[State -1, atomic suplex or flying powerbomb]
type = ChangeState
triggerall = command = "Atomic Suplex a" || command = "Atomic Suplex b" || command = "Atomic Suplex c"
trigger1 = statetype != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger2 = var(5)
trigger3 = Stateno=[100,101]
value = 1050
anim = var(10) := ifelse(command = "Atomic Suplex a", 1050, ifelse(command = "Atomic Suplex b", 1051, 1052))
;---------------------------------------------------------------------------

[State -1, screw piledriver]
type = ChangeState
triggerall = command = "Screw Piledriver x" || command = "Screw Piledriver y" || command = "Screw Piledriver z"
trigger1 = statetype != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger2 = var(5)
trigger3 = Stateno=[100,101]
value = 1030
anim = var(10) := ifelse(command = "Screw Piledriver x", 1030, ifelse(command = "Screw Piledriver y", 1031, 1032))

;---------------------------------------------------------------------------
[State -1, Aerial Russian Slam]
Type = ChangeState
TriggerAll = Command = "Aerial Russian Slam a" || command = "Aerial Russian Slam b" || command = "Aerial Russian Slam c"
Trigger1 = StateType != a && (Ctrl || stateno = 52)
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1060
anim = ifelse(command = "Aerial Russian Slam c", 1062, ifelse(command = "Aerial Russian Slam b", 1061, 1060))

[State -1]
Type = ChangeState
Triggerall = Command = "Flat3"
Trigger1 = StateType != a  && ctrl
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1022

[State -1]
Type = ChangeState
Triggerall = Command = "Flat1"
Trigger1 = StateType != a  && ctrl
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1020

[State -1]
Type = ChangeState
Triggerall = Command = "Flat2"
Trigger1 = StateType != a  && ctrl
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1021

;---------------------------------------------------------------------------
[State -1]
Type = ChangeState
Triggerall = Command = "SLariat"
Trigger1= StateType != a  && ctrl
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1001
;---------------------------------------------------------------------------

[State -1]
Type = ChangeState
Triggerall = Command = "QLariat"
Trigger1 = StateType != a  && ctrl
trigger2 = var(5)
trigger3 = Stateno=[100,101]
Value = 1000

;---------------------------------------------------------------------------
;Recovery - Roll
[State -1]
type = VarSet
trigger1 = (Var(0) = 0) && (MoveType = H) && command = "recovery"
v = 0
value = 1

[State -1]
type = VarSet
trigger1 = ((Var(0) = 1) && (MoveType != H)) || (Lose)
v = 0
value = 0
 
;--------------------------------------------------------------------------- 

[State -1, guard Cancel]
Type = ChangeState
TriggerAll = Command = "gcancelattack" 
trigger1 = ((StateNo = 150) || (StateNo = 152)) && (Power >= 1000)
trigger1 = statetype != A
Value = 900
IgnoreHitPause = 1

[State -1, guard Cancel]
Type = ChangeState
TriggerAll = Command = "roll" 
trigger1 = ((StateNo = 150) || (StateNo = 152)) && (Power >= 1000)
trigger1 = statetype != A
Value = 902
IgnoreHitPause = 1
;---------------------------------------------------------------------------
[State -1, Air Throw]
type = ChangeState
value = 850
triggerall = command = "z"
triggerall = statetype = A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 5
trigger1 =(p2statetype = A)
trigger1 = p2movetype != H

[State -1, Claw]
type = ChangeState
value = 805
triggerall = command = "f claw" 
triggerall = stateno != 100
Trigger1 = StateType != a && (ctrl || stateno = 40 || stateno = 52) && stateno != 100
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;---------------------------------------------------------------------------
[State -1, Biting]
type = ChangeState
value = 804
triggerall = command = "c" 
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 8
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 8
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H
;---------------------------------------------------------------------------
[State -1, Pildriver]
type = ChangeState
value  = 802
triggerall = command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 8
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;---------------------------------------------------------------------------
[State -1, Pildriver]
type = ChangeState
value  = 801
triggerall = command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdback"
trigger1 = p2bodydist X < 8
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;---------------------------------------------------------------------------



;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

[State -1, Roll]
type = ChangeState
value = 710
triggerall = command = "roll"
trigger1 = statetype != A && ctrl
trigger2 = Stateno=[100,101]
;--------------------------------------------------------------------------- 
[State -1, Dodge]
type = ChangeState
value = 700
triggerall = command = "dodge"
trigger1 = statetype != A
trigger1 = ctrl = 1

;---------------------------------------------------------------------------

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno=[100,101]


;Stand Light Punch
[State -1]
Type = ChangeState
Triggerall = Command = "x"
Triggerall = Command != "holddown"
Trigger1 = ctrl = 1
Trigger1 = StateType = S
trigger2 = Stateno=[100,101]
trigger3 = stateno = 400 && animelem = 2, > 1
Value = 200

;---------------------------------------------------------------------------


;Overhead
[State -1, Stand Overhead]
type = ChangeState
value = 220
triggerall = command = "foward y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger2 = Stateno=[100,101]
trigger1 = ctrl

;---------------------------------------------------------------------------

;Stand Medium Punch
[State -1,]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = ctrl 
trigger1 = statetype = S
trigger2 = Stateno=[100,101]



;Stand Hard Punch
[State -1]
Type = ChangeState
Triggerall = Command = "z"
Triggerall = Command != "holddown"
Trigger1 = ctrl = 1
Trigger1 = StateType = S
trigger2 = Stateno=[100,101]
Value = 230

;Stand Light Kick
[State -1]
Type = ChangeState
Triggerall = Command = "a"
Triggerall = Command != "holddown"
Trigger1 = ctrl = 1
Trigger1 = StateType = S
trigger2 = Stateno=[100,101]
trigger3 = stateno = 400 && animelem = 2, > 1
Value = 240

;Stand Medium Kick
[State -1]
Type = ChangeState
Triggerall = Command = "b"
Triggerall = Command != "holddown"
Trigger1 = ctrl = 1
Trigger1 = StateType = S
trigger2 = Stateno=[100,101]
Value = 250

;Stand Hard Kick
[State -1]
Type = ChangeState
Triggerall = Command = "c"
Triggerall = Command != "holddown"
Trigger1 = ctrl = 1
Trigger1 = StateType = S
trigger2 = Stateno=[100,101]
Value = 260

;---------------------------------------------------------------------------
[State -1, Crouching Hard Kick]
type = ChangeState
value = 460
triggerall = command = "downback c"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]
;---------------------------------------------------------------------------

;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]
trigger3 = stateno = 400 && animelem = 2, > 1


;Crouching Medium Punch
;しゃがみ弱パンチ
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]

;Crouching Hard Punch
;しゃがみ弱パンチ
[State -1, Crouching Hard Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]

;Crouching Light Kick 
;しゃがみ弱パンチ
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]
trigger3 = stateno = 400 && animelem = 2, > 1

;Crouching Medium Kick
;しゃがみ弱パンチ
[State -1, Crouching Medium Kick]
type = ChangeState
value = 441
triggerall = command = "downback b"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]

;Crouching Medium Kick
;しゃがみ弱パンチ
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]

;Crouching Hard Punch
;しゃがみ弱パンチ
[State -1, Crouching Hard Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = ctrl 
trigger1 = statetype = C
trigger2 = Stateno=[100,101]

;---------------------------------------------------------------------------

[State -1, Headbutt]
type = ChangeState
value = 630
triggerall = command = "up z"
trigger1 = statetype = A && vel x=0
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Alternate hard Punch]
type = ChangeState
value = 640
triggerall = command = "forward z"
trigger1 = statetype = A && vel x!=0
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Bodyslam]
type = ChangeState
value = 650
triggerall = command = "down z" 
trigger1 = statetype = A && vel x!=0
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Kneedrop]
type = ChangeState
value = 680
triggerall = command = "down b"
trigger1 = statetype = A && vel x!=0
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------

[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Jump Hard Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Jump Light Kick]
type = ChangeState
value = 660
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Jump Medium Kick]
type = ChangeState
value = 670
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

[State -1, Jump Hard kick]
type = ChangeState
value = 690
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------


