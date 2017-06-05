structure GtkSpinType :> GTK_SPIN_TYPE =
  struct
    datatype enum =
      STEP_FORWARD
    | STEP_BACKWARD
    | PAGE_FORWARD
    | PAGE_BACKWARD
    | HOME
    | END
    | USER_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = STEP_FORWARD
        val toInt =
          fn
            STEP_FORWARD => 0
          | STEP_BACKWARD => 1
          | PAGE_FORWARD => 2
          | PAGE_BACKWARD => 3
          | HOME => 4
          | END => 5
          | USER_DEFINED => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => STEP_FORWARD
          | 1 => STEP_BACKWARD
          | 2 => PAGE_FORWARD
          | 3 => PAGE_BACKWARD
          | 4 => HOME
          | 5 => END
          | 6 => USER_DEFINED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_spin_type_get_type" : unit -> GObjectType.FFI.val_;
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
