signature GTK_JUSTIFICATION =
  sig
    datatype enum =
      LEFT
    | RIGHT
    | CENTER
    | FILL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
