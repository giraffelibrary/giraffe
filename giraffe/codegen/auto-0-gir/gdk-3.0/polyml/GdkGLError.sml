structure GdkGLError :> GDK_G_L_ERROR =
  struct
    datatype enum =
      NOT_AVAILABLE
    | UNSUPPORTED_FORMAT
    | UNSUPPORTED_PROFILE
    structure Enum =
      Enum(
        type enum = enum
        val null = NOT_AVAILABLE
        val toInt =
          fn
            NOT_AVAILABLE => 0
          | UNSUPPORTED_FORMAT => 1
          | UNSUPPORTED_PROFILE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NOT_AVAILABLE
          | 1 => UNSUPPORTED_FORMAT
          | 2 => UNSUPPORTED_PROFILE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_gl_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gdk-gl-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GdkGLError = GdkGLError.Error
