structure GtkCornerType :> GTK_CORNER_TYPE =
  struct
    datatype enum =
      TOP_LEFT
    | BOTTOM_LEFT
    | TOP_RIGHT
    | BOTTOM_RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = TOP_LEFT
        val toInt =
          fn
            TOP_LEFT => 0
          | BOTTOM_LEFT => 1
          | TOP_RIGHT => 2
          | BOTTOM_RIGHT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => TOP_LEFT
          | 1 => BOTTOM_LEFT
          | 2 => TOP_RIGHT
          | 3 => BOTTOM_RIGHT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_corner_type_get_type" : unit -> GObjectType.FFI.val_;
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
