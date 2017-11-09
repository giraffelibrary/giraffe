structure GdkPixbufPixbufAlphaMode :> GDK_PIXBUF_PIXBUF_ALPHA_MODE =
  struct
    datatype enum =
      BILEVEL
    | FULL
    structure Enum =
      Enum(
        type enum = enum
        val null = BILEVEL
        val toInt =
          fn
            BILEVEL => 0
          | FULL => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BILEVEL
          | 1 => FULL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_pixbuf_alpha_mode_get_type" : unit -> GObjectType.FFI.val_;
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
