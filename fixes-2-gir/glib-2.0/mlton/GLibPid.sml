structure GLibPid :> G_LIB_PID =
  CScalar(
    structure CValueType = GLibPidType
    val null = Posix.Process.wordToPid 0w0
  )
