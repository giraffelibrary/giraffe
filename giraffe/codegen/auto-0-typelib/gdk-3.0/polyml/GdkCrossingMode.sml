structure GdkCrossingMode :> GDK_CROSSING_MODE =
  struct
    datatype enum =
      NORMAL
    | GRAB
    | UNGRAB
    | GTK_GRAB
    | GTK_UNGRAB
    | STATE_CHANGED
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
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => GRAB
          | 2 => UNGRAB
          | 3 => GTK_GRAB
          | 4 => GTK_UNGRAB
          | 5 => STATE_CHANGED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_crossing_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
