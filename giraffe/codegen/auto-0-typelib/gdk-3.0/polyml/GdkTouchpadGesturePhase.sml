structure GdkTouchpadGesturePhase :> GDK_TOUCHPAD_GESTURE_PHASE =
  struct
    datatype enum =
      BEGIN
    | UPDATE
    | END
    | CANCEL
    structure Enum =
      Enum(
        type enum = enum
        val null = BEGIN
        val toInt =
          fn
            BEGIN => 0
          | UPDATE => 1
          | END => 2
          | CANCEL => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BEGIN
          | 1 => UPDATE
          | 2 => END
          | 3 => CANCEL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_touchpad_gesture_phase_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
