structure GdkCursorType :>
  sig
    include GDK_CURSOR_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            X_CURSOR => f 0
          | ARROW => f 2
          | BASED_ARROW_DOWN => f 4
          | BASED_ARROW_UP => f 6
          | BOAT => f 8
          | BOGOSITY => f 10
          | BOTTOM_LEFT_CORNER => f 12
          | BOTTOM_RIGHT_CORNER => f 14
          | BOTTOM_SIDE => f 16
          | BOTTOM_TEE => f 18
          | BOX_SPIRAL => f 20
          | CENTER_PTR => f 22
          | CIRCLE => f 24
          | CLOCK => f 26
          | COFFEE_MUG => f 28
          | CROSS => f 30
          | CROSS_REVERSE => f 32
          | CROSSHAIR => f 34
          | DIAMOND_CROSS => f 36
          | DOT => f 38
          | DOTBOX => f 40
          | DOUBLE_ARROW => f 42
          | DRAFT_LARGE => f 44
          | DRAFT_SMALL => f 46
          | DRAPED_BOX => f 48
          | EXCHANGE => f 50
          | FLEUR => f 52
          | GOBBLER => f 54
          | GUMBY => f 56
          | HAND_1 => f 58
          | HAND_2 => f 60
          | HEART => f 62
          | ICON => f 64
          | IRON_CROSS => f 66
          | LEFT_PTR => f 68
          | LEFT_SIDE => f 70
          | LEFT_TEE => f 72
          | LEFTBUTTON => f 74
          | LL_ANGLE => f 76
          | LR_ANGLE => f 78
          | MAN => f 80
          | MIDDLEBUTTON => f 82
          | MOUSE => f 84
          | PENCIL => f 86
          | PIRATE => f 88
          | PLUS => f 90
          | QUESTION_ARROW => f 92
          | RIGHT_PTR => f 94
          | RIGHT_SIDE => f 96
          | RIGHT_TEE => f 98
          | RIGHTBUTTON => f 100
          | RTL_LOGO => f 102
          | SAILBOAT => f 104
          | SB_DOWN_ARROW => f 106
          | SB_H_DOUBLE_ARROW => f 108
          | SB_LEFT_ARROW => f 110
          | SB_RIGHT_ARROW => f 112
          | SB_UP_ARROW => f 114
          | SB_V_DOUBLE_ARROW => f 116
          | SHUTTLE => f 118
          | SIZING => f 120
          | SPIDER => f 122
          | SPRAYCAN => f 124
          | STAR => f 126
          | TARGET => f 128
          | TCROSS => f 130
          | TOP_LEFT_ARROW => f 132
          | TOP_LEFT_CORNER => f 134
          | TOP_RIGHT_CORNER => f 136
          | TOP_SIDE => f 138
          | TOP_TEE => f 140
          | TREK => f 142
          | UL_ANGLE => f 144
          | UMBRELLA => f 146
          | UR_ANGLE => f 148
          | WATCH => f 150
          | XTERM => f 152
          | LAST_CURSOR => f 153
          | BLANK_CURSOR => f ~2
          | CURSOR_IS_PIXMAP => f ~1
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_cursor_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = X_CURSOR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
