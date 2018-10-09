signature PANGO_WRAP_MODE =
  sig
    datatype enum =
      WORD
    | CHAR
    | WORD_CHAR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
