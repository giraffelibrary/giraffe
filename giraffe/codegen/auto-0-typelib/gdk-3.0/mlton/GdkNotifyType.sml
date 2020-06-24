structure GdkNotifyType :> GDK_NOTIFY_TYPE =
  struct
    datatype enum =
      ANCESTOR
    | VIRTUAL
    | INFERIOR
    | NONLINEAR
    | NONLINEAR_VIRTUAL
    | UNKNOWN
    structure Enum =
      Enum(
        type enum = enum
        val null = ANCESTOR
        val toInt =
          fn
            ANCESTOR => 0
          | VIRTUAL => 1
          | INFERIOR => 2
          | NONLINEAR => 3
          | NONLINEAR_VIRTUAL => 4
          | UNKNOWN => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ANCESTOR
          | 1 => VIRTUAL
          | 2 => INFERIOR
          | 3 => NONLINEAR
          | 4 => NONLINEAR_VIRTUAL
          | 5 => UNKNOWN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_notify_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
