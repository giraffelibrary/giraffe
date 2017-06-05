signature GIO_EMBLEM_ORIGIN =
  sig
    datatype enum =
      UNKNOWN
    | DEVICE
    | LIVEMETADATA
    | TAG
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
