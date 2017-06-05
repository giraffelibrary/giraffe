structure GtkSourceBracketMatchType :> GTK_SOURCE_BRACKET_MATCH_TYPE =
  struct
    datatype enum =
      NONE
    | OUT_OF_RANGE
    | NOT_FOUND
    | FOUND
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | OUT_OF_RANGE => 1
          | NOT_FOUND => 2
          | FOUND => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => OUT_OF_RANGE
          | 2 => NOT_FOUND
          | 3 => FOUND
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_bracket_match_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
