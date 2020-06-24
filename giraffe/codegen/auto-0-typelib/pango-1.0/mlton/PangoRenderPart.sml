structure PangoRenderPart :> PANGO_RENDER_PART =
  struct
    datatype enum =
      FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    structure Enum =
      Enum(
        type enum = enum
        val null = FOREGROUND
        val toInt =
          fn
            FOREGROUND => 0
          | BACKGROUND => 1
          | UNDERLINE => 2
          | STRIKETHROUGH => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FOREGROUND
          | 1 => BACKGROUND
          | 2 => UNDERLINE
          | 3 => STRIKETHROUGH
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "pango_render_part_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
