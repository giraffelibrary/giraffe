structure Pid :>
  sig
    include PID

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    type t = Posix.Process.pid

    val null = Posix.Process.wordToPid 0w0

    val intToPid = Posix.Process.wordToPid o SysWord.fromLargeInt
    val pidToInt = SysWord.toLargeInt o Posix.Process.pidToWord

    structure C =
      struct
        type val_ = FFI.Int32.C.val_
        type ref_ = FFI.Int32.C.ref_
        fun withVal f = FFI.Int32.C.withVal f o pidToInt
        fun withRefVal f = FFI.Int32.C.withRefVal f o pidToInt
        val fromVal = intToPid o FFI.Int32.C.fromVal
      end

    structure PolyML =
      struct
        val VAL = FFI.Int32.PolyML.VAL
        val REF = FFI.Int32.PolyML.REF
      end
  end
