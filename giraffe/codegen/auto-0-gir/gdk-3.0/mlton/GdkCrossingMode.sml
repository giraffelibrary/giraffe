structure GdkCrossingMode :> GDK_CROSSING_MODE =
  struct
    datatype enum =
      NORMAL
    | GRAB
    | UNGRAB
    | GTK_GRAB
    | GTK_UNGRAB
    | STATE_CHANGED
    | TOUCH_BEGIN
    | TOUCH_END
    | DEVICE_SWITCH
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | GRAB => 1
          | UNGRAB => 2
          | GTK_GRAB => 3
          | GTK_UNGRAB => 4
          | STATE_CHANGED => 5
          | TOUCH_BEGIN => 6
          | TOUCH_END => 7
          | DEVICE_SWITCH => 8
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => GRAB
          | 2 => UNGRAB
          | 3 => GTK_GRAB
          | 4 => GTK_UNGRAB
          | 5 => STATE_CHANGED
          | 6 => TOUCH_BEGIN
          | 7 => TOUCH_END
          | 8 => DEVICE_SWITCH
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_crossing_mode_get_type" : unit -> GObjectType.FFI.val_;
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
