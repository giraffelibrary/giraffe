structure PangoAttrType :> PANGO_ATTR_TYPE =
  struct
    datatype enum =
      INVALID
    | LANGUAGE
    | FAMILY
    | STYLE
    | WEIGHT
    | VARIANT
    | STRETCH
    | SIZE
    | FONT_DESC
    | FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    | RISE
    | SHAPE
    | SCALE
    | FALLBACK
    | LETTER_SPACING
    | UNDERLINE_COLOR
    | STRIKETHROUGH_COLOR
    | ABSOLUTE_SIZE
    | GRAVITY
    | GRAVITY_HINT
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | LANGUAGE => 1
          | FAMILY => 2
          | STYLE => 3
          | WEIGHT => 4
          | VARIANT => 5
          | STRETCH => 6
          | SIZE => 7
          | FONT_DESC => 8
          | FOREGROUND => 9
          | BACKGROUND => 10
          | UNDERLINE => 11
          | STRIKETHROUGH => 12
          | RISE => 13
          | SHAPE => 14
          | SCALE => 15
          | FALLBACK => 16
          | LETTER_SPACING => 17
          | UNDERLINE_COLOR => 18
          | STRIKETHROUGH_COLOR => 19
          | ABSOLUTE_SIZE => 20
          | GRAVITY => 21
          | GRAVITY_HINT => 22
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => LANGUAGE
          | 2 => FAMILY
          | 3 => STYLE
          | 4 => WEIGHT
          | 5 => VARIANT
          | 6 => STRETCH
          | 7 => SIZE
          | 8 => FONT_DESC
          | 9 => FOREGROUND
          | 10 => BACKGROUND
          | 11 => UNDERLINE
          | 12 => STRIKETHROUGH
          | 13 => RISE
          | 14 => SHAPE
          | 15 => SCALE
          | 16 => FALLBACK
          | 17 => LETTER_SPACING
          | 18 => UNDERLINE_COLOR
          | 19 => STRIKETHROUGH_COLOR
          | 20 => ABSOLUTE_SIZE
          | 21 => GRAVITY
          | 22 => GRAVITY_HINT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_attr_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
    local
      open PolyMLFFI
    in
      val getName_ = call (getSymbol "pango_attr_type_get_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val register_ = call (getSymbol "pango_attr_type_register") (Utf8.PolyML.cInPtr --> PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName type' = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ type'
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
