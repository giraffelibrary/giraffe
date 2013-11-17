structure GLibIOChannelError :>
  sig
    include
      G_LIB_I_O_CHANNEL_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      FBIG
    | INVAL
    | IO
    | ISDIR
    | NOSPC
    | NXIO
    | OVERFLOW
    | PIPE
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FBIG => f 0
          | INVAL => f 1
          | IO => f 2
          | ISDIR => f 3
          | NOSPC => f 4
          | NXIO => f 5
          | OVERFLOW => f 6
          | PIPE => f 7
          | FAILED => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-io-channel-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibIOChannelError = GLibIOChannelError.Error
