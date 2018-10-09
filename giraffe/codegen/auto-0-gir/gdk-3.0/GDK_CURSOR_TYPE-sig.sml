signature GDK_CURSOR_TYPE =
  sig
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
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
