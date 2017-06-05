signature GIO_MOUNT_OPERATION_RESULT =
  sig
    datatype enum =
      HANDLED
    | ABORTED
    | UNHANDLED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
