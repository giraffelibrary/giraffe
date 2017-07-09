structure GtkPolicyType :> GTK_POLICY_TYPE =
  struct
    datatype enum =
      ALWAYS
    | AUTOMATIC
    | NEVER
    structure Enum =
      Enum(
        type enum = enum
        val null = ALWAYS
        val toInt =
          fn
            ALWAYS => 0
          | AUTOMATIC => 1
          | NEVER => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ALWAYS
          | 1 => AUTOMATIC
          | 2 => NEVER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_policy_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
