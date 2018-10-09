signature GTK_LEVEL_BAR_MODE =
  sig
    datatype enum =
      CONTINUOUS
    | DISCRETE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
