signature GIO_DRIVE_START_STOP_TYPE =
  sig
    datatype enum =
      UNKNOWN
    | SHUTDOWN
    | NETWORK
    | MULTIDISK
    | PASSWORD
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
