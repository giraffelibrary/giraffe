structure GLibThreadError :>
  sig
    include
      G_LIB_THREAD_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      THREADERRORAGAIN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f = fn THREADERRORAGAIN => f 0
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => THREADERRORAGAIN
          | n => raise Value n
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_thread_error",
          C.fromVal,
          Error
        )
  end
exception GLibThreadError = GLibThreadError.Error
