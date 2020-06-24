structure GtkBaselinePosition :> GTK_BASELINE_POSITION =
  struct
    datatype enum =
      TOP
    | CENTER
    | BOTTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = TOP
        val toInt =
          fn
            TOP => 0
          | CENTER => 1
          | BOTTOM => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TOP
          | 1 => CENTER
          | 2 => BOTTOM
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_baseline_position_get_type" : unit -> GObjectType.FFI.val_;
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
