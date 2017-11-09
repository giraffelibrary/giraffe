structure GtkSpinButtonUpdatePolicy :> GTK_SPIN_BUTTON_UPDATE_POLICY =
  struct
    datatype enum =
      ALWAYS
    | IF_VALID
    structure Enum =
      Enum(
        type enum = enum
        val null = ALWAYS
        val toInt =
          fn
            ALWAYS => 0
          | IF_VALID => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ALWAYS
          | 1 => IF_VALID
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_spin_button_update_policy_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
