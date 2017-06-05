signature GIO_BUS_TYPE =
  sig
    datatype enum =
      STARTER
    | NONE
    | SYSTEM
    | SESSION
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
