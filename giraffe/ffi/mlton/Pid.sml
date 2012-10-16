structure Pid :>
  sig
    include PID
  end =
  struct
    type t = Posix.Process.pid

    val null = Posix.Process.wordToPid 0w0

    val intToPid = Posix.Process.wordToPid o SysWord.fromInt o Int32.toInt
    val pidToInt = Int32.fromInt o SysWord.toInt o Posix.Process.pidToWord

    structure C =
      struct
        type val_ = FFI.Int32.val_
        type ref_ = FFI.Int32.ref_
        fun withVal f pid = f (pidToInt pid)
        fun withRefVal f pid = withVal (FFI.withRef f) pid
        val fromVal = intToPid
      end
  end
