structure GtkStateType :> GTK_STATE_TYPE =
  struct
    datatype enum =
      NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | INCONSISTENT
    | FOCUSED
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | ACTIVE => 1
          | PRELIGHT => 2
          | SELECTED => 3
          | INSENSITIVE => 4
          | INCONSISTENT => 5
          | FOCUSED => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => ACTIVE
          | 2 => PRELIGHT
          | 3 => SELECTED
          | 4 => INSENSITIVE
          | 5 => INCONSISTENT
          | 6 => FOCUSED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_state_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
