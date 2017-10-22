structure AtkTextGranularity :> ATK_TEXT_GRANULARITY =
  struct
    datatype enum =
      CHAR
    | WORD
    | SENTENCE
    | LINE
    | PARAGRAPH
    structure Enum =
      Enum(
        type enum = enum
        val null = CHAR
        val toInt =
          fn
            CHAR => 0
          | WORD => 1
          | SENTENCE => 2
          | LINE => 3
          | PARAGRAPH => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CHAR
          | 1 => WORD
          | 2 => SENTENCE
          | 3 => LINE
          | 4 => PARAGRAPH
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_text_granularity_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
