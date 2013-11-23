structure GLibPid :> G_LIB_PID =
  struct
    type t = Posix.Process.pid

    val intToPid = Posix.Process.wordToPid o SysWord.fromLargeInt
    val pidToInt = SysWord.toLargeInt o Posix.Process.pidToWord

    val null = intToPid FFI.Int32.null

    structure C =
      struct
        type val_ = FFI.Int32.C.val_
        type ref_ = FFI.Int32.C.ref_
        fun withVal f = FFI.Int32.C.withVal f o pidToInt
        fun withRefVal f = FFI.Int32.C.withRefVal f o pidToInt
        val fromVal = intToPid o FFI.Int32.C.fromVal
      end

    structure PolyML = FFI.Int32.PolyML
  end
