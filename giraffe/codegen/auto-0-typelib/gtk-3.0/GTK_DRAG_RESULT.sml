signature GTK_DRAG_RESULT =
  sig
    datatype enum =
      SUCCESS
    | NO_TARGET
    | USER_CANCELLED
    | TIMEOUT_EXPIRED
    | GRAB_BROKEN
    | ERROR
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
