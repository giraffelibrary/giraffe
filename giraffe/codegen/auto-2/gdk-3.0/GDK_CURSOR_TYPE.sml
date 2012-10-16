signature GDK_CURSOR_TYPE =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end
