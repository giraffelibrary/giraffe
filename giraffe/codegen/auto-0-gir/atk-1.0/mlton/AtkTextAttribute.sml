structure AtkTextAttribute :> ATK_TEXT_ATTRIBUTE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | LEFT_MARGIN => 1
          | RIGHT_MARGIN => 2
          | INDENT => 3
          | INVISIBLE => 4
          | EDITABLE => 5
          | PIXELS_ABOVE_LINES => 6
          | PIXELS_BELOW_LINES => 7
          | PIXELS_INSIDE_WRAP => 8
          | BG_FULL_HEIGHT => 9
          | RISE => 10
          | UNDERLINE => 11
          | STRIKETHROUGH => 12
          | SIZE => 13
          | SCALE => 14
          | WEIGHT => 15
          | LANGUAGE => 16
          | FAMILY_NAME => 17
          | BG_COLOR => 18
          | FG_COLOR => 19
          | BG_STIPPLE => 20
          | FG_STIPPLE => 21
          | WRAP_MODE => 22
          | DIRECTION => 23
          | JUSTIFICATION => 24
          | STRETCH => 25
          | VARIANT => 26
          | STYLE => 27
          | LAST_DEFINED => 28
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
    val getType_ = _import "atk_text_attribute_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val forName_ = _import "mlton_atk_text_attribute_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> FFI.val_;
    val getName_ = _import "atk_text_attribute_get_name" : FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getValue_ = fn x1 & x2 => (_import "atk_text_attribute_get_value" : FFI.val_ * GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val register_ = _import "mlton_atk_text_attribute_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> FFI.val_;
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forName name = (Utf8.FFI.withPtr ---> FFI.fromVal) forName_ name
    fun getName attr = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ attr
    fun getValue (attr, index) = (FFI.withVal &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getValue_ (attr & index)
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
