structure GtkResponseType :> GTK_RESPONSE_TYPE =
  struct
    datatype enum =
      NONE
    | REJECT
    | ACCEPT
    | DELETE_EVENT
    | OK
    | CANCEL
    | CLOSE
    | YES
    | NO
    | APPLY
    | HELP
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => ~1
          | REJECT => ~2
          | ACCEPT => ~3
          | DELETE_EVENT => ~4
          | OK => ~5
          | CANCEL => ~6
          | CLOSE => ~7
          | YES => ~8
          | NO => ~9
          | APPLY => ~10
          | HELP => ~11
        exception Value of GInt.t
        val fromInt =
          fn
            ~1 => NONE
          | ~2 => REJECT
          | ~3 => ACCEPT
          | ~4 => DELETE_EVENT
          | ~5 => OK
          | ~6 => CANCEL
          | ~7 => CLOSE
          | ~8 => YES
          | ~9 => NO
          | ~10 => APPLY
          | ~11 => HELP
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_response_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
