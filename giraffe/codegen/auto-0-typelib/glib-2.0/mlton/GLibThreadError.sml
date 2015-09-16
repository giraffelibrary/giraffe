structure GLibThreadError :>
  sig
    include
      G_LIB_THREAD_ERROR
        where type error_record_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      THREAD_ERROR_AGAIN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f = fn THREAD_ERROR_AGAIN => f 0
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => THREAD_ERROR_AGAIN
          | n => raise Value n
      end
    exception Error of t
    type error_record_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_thread_error",
          C.fromVal,
          Error
        )
  end
exception GLibThreadError = GLibThreadError.Error
