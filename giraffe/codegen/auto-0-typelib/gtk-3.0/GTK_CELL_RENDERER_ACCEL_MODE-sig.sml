signature GTK_CELL_RENDERER_ACCEL_MODE =
  sig
    datatype enum =
      GTK
    | OTHER
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end