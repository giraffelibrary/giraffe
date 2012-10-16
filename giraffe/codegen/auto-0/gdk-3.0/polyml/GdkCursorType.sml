structure GdkCursorType :>
  sig
    include GDK_CURSOR_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      XCURSOR
    | ARROW
    | BASEDARROWDOWN
    | BASEDARROWUP
    | BOAT
    | BOGOSITY
    | BOTTOMLEFTCORNER
    | BOTTOMRIGHTCORNER
    | BOTTOMSIDE
    | BOTTOMTEE
    | BOXSPIRAL
    | CENTERPTR
    | CIRCLE
    | CLOCK
    | COFFEEMUG
    | CROSS
    | CROSSREVERSE
    | CROSSHAIR
    | DIAMONDCROSS
    | DOT
    | DOTBOX
    | DOUBLEARROW
    | DRAFTLARGE
    | DRAFTSMALL
    | DRAPEDBOX
    | EXCHANGE
    | FLEUR
    | GOBBLER
    | GUMBY
    | HAND1
    | HAND2
    | HEART
    | ICON
    | IRONCROSS
    | LEFTPTR
    | LEFTSIDE
    | LEFTTEE
    | LEFTBUTTON
    | LLANGLE
    | LRANGLE
    | MAN
    | MIDDLEBUTTON
    | MOUSE
    | PENCIL
    | PIRATE
    | PLUS
    | QUESTIONARROW
    | RIGHTPTR
    | RIGHTSIDE
    | RIGHTTEE
    | RIGHTBUTTON
    | RTLLOGO
    | SAILBOAT
    | SBDOWNARROW
    | SBHDOUBLEARROW
    | SBLEFTARROW
    | SBRIGHTARROW
    | SBUPARROW
    | SBVDOUBLEARROW
    | SHUTTLE
    | SIZING
    | SPIDER
    | SPRAYCAN
    | STAR
    | TARGET
    | TCROSS
    | TOPLEFTARROW
    | TOPLEFTCORNER
    | TOPRIGHTCORNER
    | TOPSIDE
    | TOPTEE
    | TREK
    | ULANGLE
    | UMBRELLA
    | URANGLE
    | WATCH
    | XTERM
    | LASTCURSOR
    | BLANKCURSOR
    | CURSORISPIXMAP
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            XCURSOR => f 0
          | ARROW => f 2
          | BASEDARROWDOWN => f 4
          | BASEDARROWUP => f 6
          | BOAT => f 8
          | BOGOSITY => f 10
          | BOTTOMLEFTCORNER => f 12
          | BOTTOMRIGHTCORNER => f 14
          | BOTTOMSIDE => f 16
          | BOTTOMTEE => f 18
          | BOXSPIRAL => f 20
          | CENTERPTR => f 22
          | CIRCLE => f 24
          | CLOCK => f 26
          | COFFEEMUG => f 28
          | CROSS => f 30
          | CROSSREVERSE => f 32
          | CROSSHAIR => f 34
          | DIAMONDCROSS => f 36
          | DOT => f 38
          | DOTBOX => f 40
          | DOUBLEARROW => f 42
          | DRAFTLARGE => f 44
          | DRAFTSMALL => f 46
          | DRAPEDBOX => f 48
          | EXCHANGE => f 50
          | FLEUR => f 52
          | GOBBLER => f 54
          | GUMBY => f 56
          | HAND1 => f 58
          | HAND2 => f 60
          | HEART => f 62
          | ICON => f 64
          | IRONCROSS => f 66
          | LEFTPTR => f 68
          | LEFTSIDE => f 70
          | LEFTTEE => f 72
          | LEFTBUTTON => f 74
          | LLANGLE => f 76
          | LRANGLE => f 78
          | MAN => f 80
          | MIDDLEBUTTON => f 82
          | MOUSE => f 84
          | PENCIL => f 86
          | PIRATE => f 88
          | PLUS => f 90
          | QUESTIONARROW => f 92
          | RIGHTPTR => f 94
          | RIGHTSIDE => f 96
          | RIGHTTEE => f 98
          | RIGHTBUTTON => f 100
          | RTLLOGO => f 102
          | SAILBOAT => f 104
          | SBDOWNARROW => f 106
          | SBHDOUBLEARROW => f 108
          | SBLEFTARROW => f 110
          | SBRIGHTARROW => f 112
          | SBUPARROW => f 114
          | SBVDOUBLEARROW => f 116
          | SHUTTLE => f 118
          | SIZING => f 120
          | SPIDER => f 122
          | SPRAYCAN => f 124
          | STAR => f 126
          | TARGET => f 128
          | TCROSS => f 130
          | TOPLEFTARROW => f 132
          | TOPLEFTCORNER => f 134
          | TOPRIGHTCORNER => f 136
          | TOPSIDE => f 138
          | TOPTEE => f 140
          | TREK => f 142
          | ULANGLE => f 144
          | UMBRELLA => f 146
          | URANGLE => f 148
          | WATCH => f 150
          | XTERM => f 152
          | LASTCURSOR => f 153
          | BLANKCURSOR => f ~2
          | CURSORISPIXMAP => f ~1
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => XCURSOR
          | 2 => ARROW
          | 4 => BASEDARROWDOWN
          | 6 => BASEDARROWUP
          | 8 => BOAT
          | 10 => BOGOSITY
          | 12 => BOTTOMLEFTCORNER
          | 14 => BOTTOMRIGHTCORNER
          | 16 => BOTTOMSIDE
          | 18 => BOTTOMTEE
          | 20 => BOXSPIRAL
          | 22 => CENTERPTR
          | 24 => CIRCLE
          | 26 => CLOCK
          | 28 => COFFEEMUG
          | 30 => CROSS
          | 32 => CROSSREVERSE
          | 34 => CROSSHAIR
          | 36 => DIAMONDCROSS
          | 38 => DOT
          | 40 => DOTBOX
          | 42 => DOUBLEARROW
          | 44 => DRAFTLARGE
          | 46 => DRAFTSMALL
          | 48 => DRAPEDBOX
          | 50 => EXCHANGE
          | 52 => FLEUR
          | 54 => GOBBLER
          | 56 => GUMBY
          | 58 => HAND1
          | 60 => HAND2
          | 62 => HEART
          | 64 => ICON
          | 66 => IRONCROSS
          | 68 => LEFTPTR
          | 70 => LEFTSIDE
          | 72 => LEFTTEE
          | 74 => LEFTBUTTON
          | 76 => LLANGLE
          | 78 => LRANGLE
          | 80 => MAN
          | 82 => MIDDLEBUTTON
          | 84 => MOUSE
          | 86 => PENCIL
          | 88 => PIRATE
          | 90 => PLUS
          | 92 => QUESTIONARROW
          | 94 => RIGHTPTR
          | 96 => RIGHTSIDE
          | 98 => RIGHTTEE
          | 100 => RIGHTBUTTON
          | 102 => RTLLOGO
          | 104 => SAILBOAT
          | 106 => SBDOWNARROW
          | 108 => SBHDOUBLEARROW
          | 110 => SBLEFTARROW
          | 112 => SBRIGHTARROW
          | 114 => SBUPARROW
          | 116 => SBVDOUBLEARROW
          | 118 => SHUTTLE
          | 120 => SIZING
          | 122 => SPIDER
          | 124 => SPRAYCAN
          | 126 => STAR
          | 128 => TARGET
          | 130 => TCROSS
          | 132 => TOPLEFTARROW
          | 134 => TOPLEFTCORNER
          | 136 => TOPRIGHTCORNER
          | 138 => TOPSIDE
          | 140 => TOPTEE
          | 142 => TREK
          | 144 => ULANGLE
          | 146 => UMBRELLA
          | 148 => URANGLE
          | 150 => WATCH
          | 152 => XTERM
          | 153 => LASTCURSOR
          | ~2 => BLANKCURSOR
          | ~1 => CURSORISPIXMAP
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_cursor_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = XCURSOR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
