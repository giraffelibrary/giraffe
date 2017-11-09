signature GIO_D_BUS_MESSAGE_BYTE_ORDER =
  sig
    datatype enum =
      BIG_ENDIAN
    | LITTLE_ENDIAN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
