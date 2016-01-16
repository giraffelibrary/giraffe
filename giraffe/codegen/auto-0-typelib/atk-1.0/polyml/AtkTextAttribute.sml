structure AtkTextAttribute :>
  sig
    include ATK_TEXT_ATTRIBUTE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | LEFT_MARGIN
    | RIGHT_MARGIN
    | INDENT
    | INVISIBLE
    | EDITABLE
    | PIXELS_ABOVE_LINES
    | PIXELS_BELOW_LINES
    | PIXELS_INSIDE_WRAP
    | BG_FULL_HEIGHT
    | RISE
    | UNDERLINE
    | STRIKETHROUGH
    | SIZE
    | SCALE
    | WEIGHT
    | LANGUAGE
    | FAMILY_NAME
    | BG_COLOR
    | FG_COLOR
    | BG_STIPPLE
    | FG_STIPPLE
    | WRAP_MODE
    | DIRECTION
    | JUSTIFICATION
    | STRETCH
    | VARIANT
    | STYLE
    | LAST_DEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | LEFT_MARGIN => f 1
          | RIGHT_MARGIN => f 2
          | INDENT => f 3
          | INVISIBLE => f 4
          | EDITABLE => f 5
          | PIXELS_ABOVE_LINES => f 6
          | PIXELS_BELOW_LINES => f 7
          | PIXELS_INSIDE_WRAP => f 8
          | BG_FULL_HEIGHT => f 9
          | RISE => f 10
          | UNDERLINE => f 11
          | STRIKETHROUGH => f 12
          | SIZE => f 13
          | SCALE => f 14
          | WEIGHT => f 15
          | LANGUAGE => f 16
          | FAMILY_NAME => f 17
          | BG_COLOR => f 18
          | FG_COLOR => f 19
          | BG_STIPPLE => f 20
          | FG_STIPPLE => f 21
          | WRAP_MODE => f 22
          | DIRECTION => f 23
          | JUSTIFICATION => f 24
          | STRETCH => f 25
          | VARIANT => f 26
          | STYLE => f 27
          | LAST_DEFINED => f 28
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => LEFT_MARGIN
          | 2 => RIGHT_MARGIN
          | 3 => INDENT
          | 4 => INVISIBLE
          | 5 => EDITABLE
          | 6 => PIXELS_ABOVE_LINES
          | 7 => PIXELS_BELOW_LINES
          | 8 => PIXELS_INSIDE_WRAP
          | 9 => BG_FULL_HEIGHT
          | 10 => RISE
          | 11 => UNDERLINE
          | 12 => STRIKETHROUGH
          | 13 => SIZE
          | 14 => SCALE
          | 15 => WEIGHT
          | 16 => LANGUAGE
          | 17 => FAMILY_NAME
          | 18 => BG_COLOR
          | 19 => FG_COLOR
          | 20 => BG_STIPPLE
          | 21 => FG_STIPPLE
          | 22 => WRAP_MODE
          | 23 => DIRECTION
          | 24 => JUSTIFICATION
          | 25 => STRETCH
          | 26 => VARIANT
          | 27 => STYLE
          | 28 => LAST_DEFINED
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
      val getType_ = call (load_sym libatk "atk_text_attribute_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
      val forName_ = call (load_sym libatk "atk_text_attribute_for_name") (FFI.String.PolyML.INPTR --> PolyML.VAL)
      val getName_ = call (load_sym libatk "atk_text_attribute_get_name") (PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getValue_ = call (load_sym libatk "atk_text_attribute_get_value") (PolyML.VAL &&> FFI.Int32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val register_ = call (load_sym libatk "atk_text_attribute_register") (FFI.String.PolyML.INPTR --> PolyML.VAL)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.C.withConstPtr ---> C.fromVal) forName_ name
    fun getName attr = (C.withVal ---> FFI.String.C.fromPtr false) getName_ attr
    fun getValue attr index = (C.withVal &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) getValue_ (attr & index)
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
