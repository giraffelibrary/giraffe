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

    val intToPid = Posix.Process.wordToPid o SysWord.fromInt o LargeInt.toInt
    val pidToInt = LargeInt.fromInt o SysWord.toInt o Posix.Process.pidToWord

    structure C =
      struct
        type val_ = FFI.Int32.val_
        type ref_ = FFI.Int32.ref_
        fun withVal f pid = f (pidToInt pid)
        fun withRefVal f pid = withVal (FFI.withRef FFI.PolyML.Int32.VAL f) pid
        val fromVal = intToPid
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Int32.VAL
        val REF = FFI.PolyML.Int32.REF
      end
  end
