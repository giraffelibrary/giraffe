signature GDK_DRAG_CANCEL_REASON =
  sig
    datatype enum =
      NO_TARGET
    | USER_CANCELLED
    | ERROR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
