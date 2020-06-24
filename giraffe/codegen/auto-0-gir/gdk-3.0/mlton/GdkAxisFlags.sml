structure GdkAxisFlags :> GDK_AXIS_FLAGS =
  struct
    val X = 0w2
    val Y = 0w4
    val PRESSURE = 0w8
    val XTILT = 0w16
    val YTILT = 0w32
    val WHEEL = 0w64
    val DISTANCE = 0w128
    val ROTATION = 0w256
    val SLIDER = 0w512
    val allFlags =
      [
        X,
        Y,
        PRESSURE,
        XTILT,
        YTILT,
        WHEEL,
        DISTANCE,
        ROTATION,
        SLIDER
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_axis_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
