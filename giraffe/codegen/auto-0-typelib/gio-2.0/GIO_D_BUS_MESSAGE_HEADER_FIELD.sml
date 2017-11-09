signature GIO_D_BUS_MESSAGE_HEADER_FIELD =
  sig
    datatype enum =
      INVALID
    | PATH
    | INTERFACE
    | MEMBER
    | ERROR_NAME
    | REPLY_SERIAL
    | DESTINATION
    | SENDER
    | SIGNATURE
    | NUM_UNIX_FDS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
