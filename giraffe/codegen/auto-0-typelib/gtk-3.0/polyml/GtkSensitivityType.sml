structure GtkSensitivityType :> GTK_SENSITIVITY_TYPE =
  struct
    datatype enum =
      AUTO
    | ON
    | OFF
    structure Enum =
      Enum(
        type enum = enum
        val null = AUTO
        val toInt =
          fn
            AUTO => 0
          | ON => 1
          | OFF => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => AUTO
          | 1 => ON
          | 2 => OFF
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_sensitivity_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
