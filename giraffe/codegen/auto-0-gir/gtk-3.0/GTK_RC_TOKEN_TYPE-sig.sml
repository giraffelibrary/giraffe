signature GTK_RC_TOKEN_TYPE =
  sig
    datatype enum =
      INVALID
    | INCLUDE
    | NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | FG
    | BG
    | TEXT
    | BASE
    | XTHICKNESS
    | YTHICKNESS
    | FONT
    | FONTSET
    | FONT_NAME
    | BG_PIXMAP
    | PIXMAP_PATH
    | STYLE
    | BINDING
    | BIND
    | WIDGET
    | WIDGET_CLASS
    | CLASS
    | LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    | ENGINE
    | MODULE_PATH
    | IM_MODULE_PATH
    | IM_MODULE_FILE
    | STOCK
    | LTR
    | RTL
    | COLOR
    | UNBIND
    | LAST
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
