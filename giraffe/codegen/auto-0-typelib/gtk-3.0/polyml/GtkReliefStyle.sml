structure GtkReliefStyle :> GTK_RELIEF_STYLE =
  struct
    datatype enum =
      NORMAL
    | HALF
    | NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | HALF => 1
          | NONE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => HALF
          | 2 => NONE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_relief_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
