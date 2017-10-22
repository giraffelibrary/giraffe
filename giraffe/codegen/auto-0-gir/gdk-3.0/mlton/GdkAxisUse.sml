structure GdkAxisUse :> GDK_AXIS_USE =
  struct
    datatype enum =
      IGNORE
    | X
    | Y
    | PRESSURE
    | XTILT
    | YTILT
    | WHEEL
    | DISTANCE
    | ROTATION
    | SLIDER
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = IGNORE
        val toInt =
          fn
            IGNORE => 0
          | X => 1
          | Y => 2
          | PRESSURE => 3
          | XTILT => 4
          | YTILT => 5
          | WHEEL => 6
          | DISTANCE => 7
          | ROTATION => 8
          | SLIDER => 9
          | LAST => 10
        exception Value of GInt.t
        val fromInt =
          fn
            0 => IGNORE
          | 1 => X
          | 2 => Y
          | 3 => PRESSURE
          | 4 => XTILT
          | 5 => YTILT
          | 6 => WHEEL
          | 7 => DISTANCE
          | 8 => ROTATION
          | 9 => SLIDER
          | 10 => LAST
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_axis_use_get_type" : unit -> GObjectType.FFI.val_;
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
