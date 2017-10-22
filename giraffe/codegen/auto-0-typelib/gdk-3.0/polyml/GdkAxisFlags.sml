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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_axis_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
