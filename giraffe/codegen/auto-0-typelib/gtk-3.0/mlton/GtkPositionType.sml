structure GtkPositionType :> GTK_POSITION_TYPE =
  struct
    datatype enum =
      LEFT
    | RIGHT
    | TOP
    | BOTTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = LEFT
        val toInt =
          fn
            LEFT => 0
          | RIGHT => 1
          | TOP => 2
          | BOTTOM => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LEFT
          | 1 => RIGHT
          | 2 => TOP
          | 3 => BOTTOM
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_position_type_get_type" : unit -> GObjectType.FFI.val_;
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
