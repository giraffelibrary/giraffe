structure AtkTextClipType :> ATK_TEXT_CLIP_TYPE =
  struct
    datatype enum =
      NONE
    | MIN
    | MAX
    | BOTH
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | MIN => 1
          | MAX => 2
          | BOTH => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => MIN
          | 2 => MAX
          | 3 => BOTH
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_text_clip_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
