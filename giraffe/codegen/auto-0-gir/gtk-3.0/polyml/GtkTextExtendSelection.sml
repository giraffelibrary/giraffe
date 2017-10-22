structure GtkTextExtendSelection :> GTK_TEXT_EXTEND_SELECTION =
  struct
    datatype enum =
      WORD
    | LINE
    structure Enum =
      Enum(
        type enum = enum
        val null = WORD
        val toInt =
          fn
            WORD => 0
          | LINE => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => WORD
          | 1 => LINE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_extend_selection_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
