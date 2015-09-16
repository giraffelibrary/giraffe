structure PangoAttrType :>
  sig
    include PANGO_ATTR_TYPE
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
    val getType_ = _import "pango_attr_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    val getName_ = _import "pango_attr_type_get_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val register_ = _import "mlton_pango_attr_type_register" : cstring * unit CPointer.t -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName type' = (C.withVal ---> FFI.String.C.fromPtr false) getName_ type'
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
