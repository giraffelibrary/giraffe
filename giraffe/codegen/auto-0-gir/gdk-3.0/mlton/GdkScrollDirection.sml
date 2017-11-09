structure GdkScrollDirection :> GDK_SCROLL_DIRECTION =
  struct
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = UP
        val toInt =
          fn
            UP => 0
          | DOWN => 1
          | LEFT => 2
          | RIGHT => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UP
          | 1 => DOWN
          | 2 => LEFT
          | 3 => RIGHT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_scroll_direction_get_type" : unit -> GObjectType.FFI.val_;
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
