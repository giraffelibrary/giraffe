structure GtkButtonsType :> GTK_BUTTONS_TYPE =
  struct
    datatype enum =
      NONE
    | OK
    | CLOSE
    | CANCEL
    | YES_NO
    | OK_CANCEL
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | OK => 1
          | CLOSE => 2
          | CANCEL => 3
          | YES_NO => 4
          | OK_CANCEL => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => OK
          | 2 => CLOSE
          | 3 => CANCEL
          | 4 => YES_NO
          | 5 => OK_CANCEL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_buttons_type_get_type" : unit -> GObjectType.FFI.val_;
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
