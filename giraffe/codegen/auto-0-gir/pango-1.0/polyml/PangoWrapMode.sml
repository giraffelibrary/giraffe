structure PangoWrapMode :> PANGO_WRAP_MODE =
  struct
    datatype enum =
      WORD
    | CHAR
    | WORD_CHAR
    structure Enum =
      Enum(
        type enum = enum
        val null = WORD
        val toInt =
          fn
            WORD => 0
          | CHAR => 1
          | WORD_CHAR => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => WORD
          | 1 => CHAR
          | 2 => WORD_CHAR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_wrap_mode_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
