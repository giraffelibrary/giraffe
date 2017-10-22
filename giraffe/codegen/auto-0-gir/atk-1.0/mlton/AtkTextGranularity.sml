structure AtkTextGranularity :> ATK_TEXT_GRANULARITY =
  struct
    datatype enum =
      CHAR
    | WORD
    | SENTENCE
    | LINE
    | PARAGRAPH
    structure Enum =
      Enum(
        type enum = enum
        val null = CHAR
        val toInt =
          fn
            CHAR => 0
          | WORD => 1
          | SENTENCE => 2
          | LINE => 3
          | PARAGRAPH => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CHAR
          | 1 => WORD
          | 2 => SENTENCE
          | 3 => LINE
          | 4 => PARAGRAPH
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_text_granularity_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
