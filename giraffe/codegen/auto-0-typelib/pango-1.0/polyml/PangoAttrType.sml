structure PangoAttrType :>
  sig
    include PANGO_ATTR_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | LANGUAGE => f 1
          | FAMILY => f 2
          | STYLE => f 3
          | WEIGHT => f 4
          | VARIANT => f 5
          | STRETCH => f 6
          | SIZE => f 7
          | FONT_DESC => f 8
          | FOREGROUND => f 9
          | BACKGROUND => f 10
          | UNDERLINE => f 11
          | STRIKETHROUGH => f 12
          | RISE => f 13
          | SHAPE => f 14
          | SCALE => f 15
          | FALLBACK => f 16
          | LETTER_SPACING => f 17
          | UNDERLINE_COLOR => f 18
          | STRIKETHROUGH_COLOR => f 19
          | ABSOLUTE_SIZE => f 20
          | GRAVITY => f 21
          | GRAVITY_HINT => f 22
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_attr_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    local
      open PolyMLFFI
    in
      val getName_ = call (load_sym libpango "pango_attr_type_get_name") (PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val register_ = call (load_sym libpango "pango_attr_type_register") (FFI.String.PolyML.INPTR --> PolyML.VAL)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName type' = (C.withVal ---> FFI.String.C.fromPtr false) getName_ type'
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
