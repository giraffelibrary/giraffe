structure GLibThreadPriority :>
  sig
    include G_LIB_THREAD_PRIORITY
  end =
  struct
    datatype t =
      LOW
    | NORMAL
    | HIGH
    | URGENT
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LOW => f 0
          | NORMAL => f 1
          | HIGH => f 2
          | URGENT => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LOW
          | 1 => NORMAL
          | 2 => HIGH
          | 3 => URGENT
          | n => raise Value n
      end
    val null = LOW
  end
