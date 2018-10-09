signature GDK_VISUAL_TYPE =
  sig
    datatype enum =
      STATIC_GRAY
    | GRAYSCALE
    | STATIC_COLOR
    | PSEUDO_COLOR
    | TRUE_COLOR
    | DIRECT_COLOR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
