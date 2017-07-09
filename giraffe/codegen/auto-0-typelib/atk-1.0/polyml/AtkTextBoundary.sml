structure AtkTextBoundary :> ATK_TEXT_BOUNDARY =
  struct
    datatype enum =
      CHAR
    | WORD_START
    | WORD_END
    | SENTENCE_START
    | SENTENCE_END
    | LINE_START
    | LINE_END
    structure Enum =
      Enum(
        type enum = enum
        val null = CHAR
        val toInt =
          fn
            CHAR => 0
          | WORD_START => 1
          | WORD_END => 2
          | SENTENCE_START => 3
          | SENTENCE_END => 4
          | LINE_START => 5
          | LINE_END => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CHAR
          | 1 => WORD_START
          | 2 => WORD_END
          | 3 => SENTENCE_START
          | 4 => SENTENCE_END
          | 5 => LINE_START
          | 6 => LINE_END
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_text_boundary_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
