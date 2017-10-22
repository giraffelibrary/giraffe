signature GTK_SOURCE_BACKGROUND_PATTERN_TYPE =
  sig
    datatype enum =
      NONE
    | GRID
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
