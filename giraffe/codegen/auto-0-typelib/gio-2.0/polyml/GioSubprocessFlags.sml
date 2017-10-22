structure GioSubprocessFlags :> GIO_SUBPROCESS_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val STDIN_PIPE = 0w1
    val STDIN_INHERIT = 0w2
    val STDOUT_PIPE = 0w4
    val STDOUT_SILENCE = 0w8
    val STDERR_PIPE = 0w16
    val STDERR_SILENCE = 0w32
    val STDERR_MERGE = 0w64
    val INHERIT_FDS = 0w128
    val allFlags =
      [
        NONE,
        STDIN_PIPE,
        STDIN_INHERIT,
        STDOUT_PIPE,
        STDOUT_SILENCE,
        STDERR_PIPE,
        STDERR_SILENCE,
        STDERR_MERGE,
        INHERIT_FDS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_subprocess_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
