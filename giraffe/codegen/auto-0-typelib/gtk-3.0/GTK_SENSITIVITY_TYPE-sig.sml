signature GTK_SENSITIVITY_TYPE =
  sig
    datatype enum =
      AUTO
    | ON
    | OFF
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end