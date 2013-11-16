structure AtkTextAttribute :>
  sig
    include ATK_TEXT_ATTRIBUTE
  end =
  struct
    datatype t =
      INVALID
    | LEFTMARGIN
    | RIGHTMARGIN
    | INDENT
    | INVISIBLE
    | EDITABLE
    | PIXELSABOVELINES
    | PIXELSBELOWLINES
    | PIXELSINSIDEWRAP
    | BGFULLHEIGHT
    | RISE
    | UNDERLINE
    | STRIKETHROUGH
    | SIZE
    | SCALE
    | WEIGHT
    | LANGUAGE
    | FAMILYNAME
    | BGCOLOR
    | FGCOLOR
    | BGSTIPPLE
    | FGSTIPPLE
    | WRAPMODE
    | DIRECTION
    | JUSTIFICATION
    | STRETCH
    | VARIANT
    | STYLE
    | LASTDEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | LEFTMARGIN => f 1
          | RIGHTMARGIN => f 2
          | INDENT => f 3
          | INVISIBLE => f 4
          | EDITABLE => f 5
          | PIXELSABOVELINES => f 6
          | PIXELSBELOWLINES => f 7
          | PIXELSINSIDEWRAP => f 8
          | BGFULLHEIGHT => f 9
          | RISE => f 10
          | UNDERLINE => f 11
          | STRIKETHROUGH => f 12
          | SIZE => f 13
          | SCALE => f 14
          | WEIGHT => f 15
          | LANGUAGE => f 16
          | FAMILYNAME => f 17
          | BGCOLOR => f 18
          | FGCOLOR => f 19
          | BGSTIPPLE => f 20
          | FGSTIPPLE => f 21
          | WRAPMODE => f 22
          | DIRECTION => f 23
          | JUSTIFICATION => f 24
          | STRETCH => f 25
          | VARIANT => f 26
          | STYLE => f 27
          | LASTDEFINED => f 28
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => LEFTMARGIN
          | 2 => RIGHTMARGIN
          | 3 => INDENT
          | 4 => INVISIBLE
          | 5 => EDITABLE
          | 6 => PIXELSABOVELINES
          | 7 => PIXELSBELOWLINES
          | 8 => PIXELSINSIDEWRAP
          | 9 => BGFULLHEIGHT
          | 10 => RISE
          | 11 => UNDERLINE
          | 12 => STRIKETHROUGH
          | 13 => SIZE
          | 14 => SCALE
          | 15 => WEIGHT
          | 16 => LANGUAGE
          | 17 => FAMILYNAME
          | 18 => BGCOLOR
          | 19 => FGCOLOR
          | 20 => BGSTIPPLE
          | 21 => FGSTIPPLE
          | 22 => WRAPMODE
          | 23 => DIRECTION
          | 24 => JUSTIFICATION
          | 25 => STRETCH
          | 26 => VARIANT
          | 27 => STYLE
          | 28 => LASTDEFINED
          | n => raise Value n
      end
    val getType_ = _import "atk_text_attribute_get_type" : unit -> GObjectType.C.val_;
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
    val forName_ = _import "mlton_atk_text_attribute_for_name" : cstring * unit CPointer.t -> C.val_;
    val getName_ = _import "atk_text_attribute_get_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val getValue_ = fn x1 & x2 => (_import "atk_text_attribute_get_value" : C.val_ * FFI.Int32.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val register_ = _import "mlton_atk_text_attribute_register" : cstring * unit CPointer.t -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.C.withConstPtr ---> C.fromVal) forName_ name
    fun getName attr = (C.withVal ---> FFI.String.C.fromPtr false) getName_ attr
    fun getValue attr index = (C.withVal &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) getValue_ (attr & index)
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
