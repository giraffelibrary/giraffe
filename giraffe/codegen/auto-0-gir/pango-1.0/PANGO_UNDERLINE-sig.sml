signature PANGO_UNDERLINE =
  sig
    datatype enum =
      NONE
    | SINGLE
    | DOUBLE
    | LOW
    | ERROR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
