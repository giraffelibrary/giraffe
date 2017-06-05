structure GtkDirectionType :> GTK_DIRECTION_TYPE =
  struct
    datatype enum =
      TAB_FORWARD
    | TAB_BACKWARD
    | UP
    | DOWN
    | LEFT
    | RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = TAB_FORWARD
        val toInt =
          fn
            TAB_FORWARD => 0
          | TAB_BACKWARD => 1
          | UP => 2
          | DOWN => 3
          | LEFT => 4
          | RIGHT => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TAB_FORWARD
          | 1 => TAB_BACKWARD
          | 2 => UP
          | 3 => DOWN
          | 4 => LEFT
          | 5 => RIGHT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_direction_type_get_type" : unit -> GObjectType.FFI.val_;
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
