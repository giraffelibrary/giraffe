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
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
