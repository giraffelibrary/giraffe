signature GIO_D_BUS_MESSAGE_TYPE =
  sig
    datatype enum =
      INVALID
    | METHOD_CALL
    | METHOD_RETURN
    | ERROR
    | SIGNAL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
