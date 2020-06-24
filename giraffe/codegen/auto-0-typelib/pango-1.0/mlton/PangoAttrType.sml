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
    | FONT_FEATURES
    | FOREGROUND_ALPHA
    | BACKGROUND_ALPHA
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
          | FONT_FEATURES => 23
          | FOREGROUND_ALPHA => 24
          | BACKGROUND_ALPHA => 25
        exception Value of GInt32.t
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
          | 23 => FONT_FEATURES
          | 24 => FOREGROUND_ALPHA
          | 25 => BACKGROUND_ALPHA
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "pango_attr_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getName_ = _import "pango_attr_type_get_name" : FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;
    val register_ = _import "mlton_pango_attr_type_register" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> FFI.val_;
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName type' = (FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getName_ type'
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
