signature PANGO_ATTR_TYPE =
  sig
    datatype enum =
      INVALID
    | LANGUAGE
    | FAMILY
    | STYLE
    | WEIGHT
    | VARIANT
    | STRETCH
    | SIZE
    | FONT_DESC
    | FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    | RISE
    | SHAPE
    | SCALE
    | FALLBACK
    | LETTER_SPACING
    | UNDERLINE_COLOR
    | STRIKETHROUGH_COLOR
    | ABSOLUTE_SIZE
    | GRAVITY
    | GRAVITY_HINT
    | FONT_FEATURES
    | FOREGROUND_ALPHA
    | BACKGROUND_ALPHA
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
    val getName : t -> string
    val register : string -> t
  end
