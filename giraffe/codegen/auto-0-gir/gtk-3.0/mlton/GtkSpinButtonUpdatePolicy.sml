structure GtkSpinButtonUpdatePolicy :> GTK_SPIN_BUTTON_UPDATE_POLICY =
  struct
    datatype enum =
      ALWAYS
    | IF_VALID
    structure Enum =
      Enum(
        type enum = enum
        val null = ALWAYS
        val toInt =
          fn
            ALWAYS => 0
          | IF_VALID => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ALWAYS
          | 1 => IF_VALID
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_spin_button_update_policy_get_type" : unit -> GObjectType.FFI.val_;
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
