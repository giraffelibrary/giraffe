structure AtkKeyEventType :> ATK_KEY_EVENT_TYPE =
  struct
    datatype enum =
      PRESS
    | RELEASE
    | LAST_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = PRESS
        val toInt =
          fn
            PRESS => 0
          | RELEASE => 1
          | LAST_DEFINED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PRESS
          | 1 => RELEASE
          | 2 => LAST_DEFINED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_key_event_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
