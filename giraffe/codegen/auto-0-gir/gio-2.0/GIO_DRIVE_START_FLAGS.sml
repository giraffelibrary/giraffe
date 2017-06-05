signature GIO_DRIVE_START_FLAGS =
  sig
    datatype enum =
      NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
