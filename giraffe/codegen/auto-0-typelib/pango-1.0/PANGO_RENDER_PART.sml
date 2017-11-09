signature PANGO_RENDER_PART =
  sig
    datatype enum =
      FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
