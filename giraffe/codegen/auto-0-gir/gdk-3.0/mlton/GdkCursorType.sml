structure GdkCursorType :> GDK_CURSOR_TYPE =
  struct
    datatype enum =
      X_CURSOR
    | ARROW
    | BASED_ARROW_DOWN
    | BASED_ARROW_UP
    | BOAT
    | BOGOSITY
    | BOTTOM_LEFT_CORNER
    | BOTTOM_RIGHT_CORNER
    | BOTTOM_SIDE
    | BOTTOM_TEE
    | BOX_SPIRAL
    | CENTER_PTR
    | CIRCLE
    | CLOCK
    | COFFEE_MUG
    | CROSS
    | CROSS_REVERSE
    | CROSSHAIR
    | DIAMOND_CROSS
    | DOT
    | DOTBOX
    | DOUBLE_ARROW
    | DRAFT_LARGE
    | DRAFT_SMALL
    | DRAPED_BOX
    | EXCHANGE
    | FLEUR
    | GOBBLER
    | GUMBY
    | HAND_1
    | HAND_2
    | HEART
    | ICON
    | IRON_CROSS
    | LEFT_PTR
    | LEFT_SIDE
    | LEFT_TEE
    | LEFTBUTTON
    | LL_ANGLE
    | LR_ANGLE
    | MAN
    | MIDDLEBUTTON
    | MOUSE
    | PENCIL
    | PIRATE
    | PLUS
    | QUESTION_ARROW
    | RIGHT_PTR
    | RIGHT_SIDE
    | RIGHT_TEE
    | RIGHTBUTTON
    | RTL_LOGO
    | SAILBOAT
    | SB_DOWN_ARROW
    | SB_H_DOUBLE_ARROW
    | SB_LEFT_ARROW
    | SB_RIGHT_ARROW
    | SB_UP_ARROW
    | SB_V_DOUBLE_ARROW
    | SHUTTLE
    | SIZING
    | SPIDER
    | SPRAYCAN
    | STAR
    | TARGET
    | TCROSS
    | TOP_LEFT_ARROW
    | TOP_LEFT_CORNER
    | TOP_RIGHT_CORNER
    | TOP_SIDE
    | TOP_TEE
    | TREK
    | UL_ANGLE
    | UMBRELLA
    | UR_ANGLE
    | WATCH
    | XTERM
    | LAST_CURSOR
    | BLANK_CURSOR
    | CURSOR_IS_PIXMAP
    structure Enum =
      Enum(
        type enum = enum
        val null = X_CURSOR
        val toInt =
          fn
            X_CURSOR => 0
          | ARROW => 2
          | BASED_ARROW_DOWN => 4
          | BASED_ARROW_UP => 6
          | BOAT => 8
          | BOGOSITY => 10
          | BOTTOM_LEFT_CORNER => 12
          | BOTTOM_RIGHT_CORNER => 14
          | BOTTOM_SIDE => 16
          | BOTTOM_TEE => 18
          | BOX_SPIRAL => 20
          | CENTER_PTR => 22
          | CIRCLE => 24
          | CLOCK => 26
          | COFFEE_MUG => 28
          | CROSS => 30
          | CROSS_REVERSE => 32
          | CROSSHAIR => 34
          | DIAMOND_CROSS => 36
          | DOT => 38
          | DOTBOX => 40
          | DOUBLE_ARROW => 42
          | DRAFT_LARGE => 44
          | DRAFT_SMALL => 46
          | DRAPED_BOX => 48
          | EXCHANGE => 50
          | FLEUR => 52
          | GOBBLER => 54
          | GUMBY => 56
          | HAND_1 => 58
          | HAND_2 => 60
          | HEART => 62
          | ICON => 64
          | IRON_CROSS => 66
          | LEFT_PTR => 68
          | LEFT_SIDE => 70
          | LEFT_TEE => 72
          | LEFTBUTTON => 74
          | LL_ANGLE => 76
          | LR_ANGLE => 78
          | MAN => 80
          | MIDDLEBUTTON => 82
          | MOUSE => 84
          | PENCIL => 86
          | PIRATE => 88
          | PLUS => 90
          | QUESTION_ARROW => 92
          | RIGHT_PTR => 94
          | RIGHT_SIDE => 96
          | RIGHT_TEE => 98
          | RIGHTBUTTON => 100
          | RTL_LOGO => 102
          | SAILBOAT => 104
          | SB_DOWN_ARROW => 106
          | SB_H_DOUBLE_ARROW => 108
          | SB_LEFT_ARROW => 110
          | SB_RIGHT_ARROW => 112
          | SB_UP_ARROW => 114
          | SB_V_DOUBLE_ARROW => 116
          | SHUTTLE => 118
          | SIZING => 120
          | SPIDER => 122
          | SPRAYCAN => 124
          | STAR => 126
          | TARGET => 128
          | TCROSS => 130
          | TOP_LEFT_ARROW => 132
          | TOP_LEFT_CORNER => 134
          | TOP_RIGHT_CORNER => 136
          | TOP_SIDE => 138
          | TOP_TEE => 140
          | TREK => 142
          | UL_ANGLE => 144
          | UMBRELLA => 146
          | UR_ANGLE => 148
          | WATCH => 150
          | XTERM => 152
          | LAST_CURSOR => 153
          | BLANK_CURSOR => ~2
          | CURSOR_IS_PIXMAP => ~1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => X_CURSOR
          | 2 => ARROW
          | 4 => BASED_ARROW_DOWN
          | 6 => BASED_ARROW_UP
          | 8 => BOAT
          | 10 => BOGOSITY
          | 12 => BOTTOM_LEFT_CORNER
          | 14 => BOTTOM_RIGHT_CORNER
          | 16 => BOTTOM_SIDE
          | 18 => BOTTOM_TEE
          | 20 => BOX_SPIRAL
          | 22 => CENTER_PTR
          | 24 => CIRCLE
          | 26 => CLOCK
          | 28 => COFFEE_MUG
          | 30 => CROSS
          | 32 => CROSS_REVERSE
          | 34 => CROSSHAIR
          | 36 => DIAMOND_CROSS
          | 38 => DOT
          | 40 => DOTBOX
          | 42 => DOUBLE_ARROW
          | 44 => DRAFT_LARGE
          | 46 => DRAFT_SMALL
          | 48 => DRAPED_BOX
          | 50 => EXCHANGE
          | 52 => FLEUR
          | 54 => GOBBLER
          | 56 => GUMBY
          | 58 => HAND_1
          | 60 => HAND_2
          | 62 => HEART
          | 64 => ICON
          | 66 => IRON_CROSS
          | 68 => LEFT_PTR
          | 70 => LEFT_SIDE
          | 72 => LEFT_TEE
          | 74 => LEFTBUTTON
          | 76 => LL_ANGLE
          | 78 => LR_ANGLE
          | 80 => MAN
          | 82 => MIDDLEBUTTON
          | 84 => MOUSE
          | 86 => PENCIL
          | 88 => PIRATE
          | 90 => PLUS
          | 92 => QUESTION_ARROW
          | 94 => RIGHT_PTR
          | 96 => RIGHT_SIDE
          | 98 => RIGHT_TEE
          | 100 => RIGHTBUTTON
          | 102 => RTL_LOGO
          | 104 => SAILBOAT
          | 106 => SB_DOWN_ARROW
          | 108 => SB_H_DOUBLE_ARROW
          | 110 => SB_LEFT_ARROW
          | 112 => SB_RIGHT_ARROW
          | 114 => SB_UP_ARROW
          | 116 => SB_V_DOUBLE_ARROW
          | 118 => SHUTTLE
          | 120 => SIZING
          | 122 => SPIDER
          | 124 => SPRAYCAN
          | 126 => STAR
          | 128 => TARGET
          | 130 => TCROSS
          | 132 => TOP_LEFT_ARROW
          | 134 => TOP_LEFT_CORNER
          | 136 => TOP_RIGHT_CORNER
          | 138 => TOP_SIDE
          | 140 => TOP_TEE
          | 142 => TREK
          | 144 => UL_ANGLE
          | 146 => UMBRELLA
          | 148 => UR_ANGLE
          | 150 => WATCH
          | 152 => XTERM
          | 153 => LAST_CURSOR
          | ~2 => BLANK_CURSOR
          | ~1 => CURSOR_IS_PIXMAP
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_cursor_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
