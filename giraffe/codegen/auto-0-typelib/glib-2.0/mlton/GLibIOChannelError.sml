structure GLibIOChannelError :>
  G_LIB_I_O_CHANNEL_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      FBIG
    | INVAL
    | IO
    | ISDIR
    | NOSPC
    | NXIO
    | OVERFLOW
    | PIPE
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = FBIG
        val toInt =
          fn
            FBIG => 0
          | INVAL => 1
          | IO => 2
          | ISDIR => 3
          | NOSPC => 4
          | NXIO => 5
          | OVERFLOW => 6
          | PIPE => 7
          | FAILED => 8
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FBIG
          | 1 => INVAL
          | 2 => IO
          | 3 => ISDIR
          | 4 => NOSPC
          | 5 => NXIO
          | 6 => OVERFLOW
          | 7 => PIPE
          | 8 => FAILED
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-io-channel-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibIOChannelError = GLibIOChannelError.Error
