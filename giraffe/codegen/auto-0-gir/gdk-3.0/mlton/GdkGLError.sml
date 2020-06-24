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
    val getType_ = _import "gdk_gl_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
