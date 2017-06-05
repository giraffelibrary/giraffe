structure GtkSensitivityType :> GTK_SENSITIVITY_TYPE =
  struct
    datatype enum =
      AUTO
    | ON
    | OFF
    structure Enum =
      Enum(
        type enum = enum
        val null = AUTO
        val toInt =
          fn
            AUTO => 0
          | ON => 1
          | OFF => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => AUTO
          | 1 => ON
          | 2 => OFF
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_sensitivity_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
