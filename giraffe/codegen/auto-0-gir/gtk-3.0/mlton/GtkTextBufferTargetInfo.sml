structure GtkTextBufferTargetInfo :> GTK_TEXT_BUFFER_TARGET_INFO =
  struct
    datatype enum =
      BUFFER_CONTENTS
    | RICH_TEXT
    | TEXT
    structure Enum =
      Enum(
        type enum = enum
        val null = BUFFER_CONTENTS
        val toInt =
          fn
            BUFFER_CONTENTS => ~1
          | RICH_TEXT => ~2
          | TEXT => ~3
        exception Value of GInt.t
        val fromInt =
          fn
            ~1 => BUFFER_CONTENTS
          | ~2 => RICH_TEXT
          | ~3 => TEXT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_text_buffer_target_info_get_type" : unit -> GObjectType.FFI.val_;
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
