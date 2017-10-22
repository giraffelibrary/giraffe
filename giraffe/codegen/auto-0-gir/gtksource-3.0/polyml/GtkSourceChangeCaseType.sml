structure GtkSourceChangeCaseType :> GTK_SOURCE_CHANGE_CASE_TYPE =
  struct
    datatype enum =
      LOWER
    | UPPER
    | TOGGLE
    | TITLE
    structure Enum =
      Enum(
        type enum = enum
        val null = LOWER
        val toInt =
          fn
            LOWER => 0
          | UPPER => 1
          | TOGGLE => 2
          | TITLE => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LOWER
          | 1 => UPPER
          | 2 => TOGGLE
          | 3 => TITLE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_change_case_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
