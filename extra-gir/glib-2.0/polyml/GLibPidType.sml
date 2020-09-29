structure GLibPidType :> G_LIB_PID_TYPE =
  struct
    open GIntType

    type t = Posix.Process.pid

    val toC = toC o SysWord.toLargeInt o Posix.Process.pidToWord
    val updateC = Fn.const Fn.ignore
    val fromC = Posix.Process.wordToPid o SysWord.fromLargeInt o fromC
  end
