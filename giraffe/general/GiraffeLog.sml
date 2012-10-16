structure GiraffeLog :> GIRAFFE_LOG =
  struct
    fun critical msg =
      (
        app print ["GIRAFFE-CRITICAL ", msg, "\n"];
        TextIO.flushOut TextIO.stdOut
      )
  end
