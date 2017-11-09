structure GtkStateType :> GTK_STATE_TYPE =
  struct
    datatype enum =
      NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | INCONSISTENT
    | FOCUSED
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | ACTIVE => 1
          | PRELIGHT => 2
          | SELECTED => 3
          | INSENSITIVE => 4
          | INCONSISTENT => 5
          | FOCUSED => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => ACTIVE
          | 2 => PRELIGHT
          | 3 => SELECTED
          | 4 => INSENSITIVE
          | 5 => INCONSISTENT
          | 6 => FOCUSED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_state_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
