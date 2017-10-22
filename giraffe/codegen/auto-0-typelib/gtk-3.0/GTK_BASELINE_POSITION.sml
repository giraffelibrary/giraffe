signature GTK_BASELINE_POSITION =
  sig
    datatype enum =
      TOP
    | CENTER
    | BOTTOM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
