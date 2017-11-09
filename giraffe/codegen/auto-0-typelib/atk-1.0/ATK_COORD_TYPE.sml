signature ATK_COORD_TYPE =
  sig
    datatype enum =
      SCREEN
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
