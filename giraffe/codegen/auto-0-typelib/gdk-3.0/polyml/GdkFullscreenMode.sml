structure GdkFullscreenMode :> GDK_FULLSCREEN_MODE =
  struct
    datatype enum =
      CURRENT_MONITOR
    | ALL_MONITORS
    structure Enum =
      Enum(
        type enum = enum
        val null = CURRENT_MONITOR
        val toInt =
          fn
            CURRENT_MONITOR => 0
          | ALL_MONITORS => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CURRENT_MONITOR
          | 1 => ALL_MONITORS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_fullscreen_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
