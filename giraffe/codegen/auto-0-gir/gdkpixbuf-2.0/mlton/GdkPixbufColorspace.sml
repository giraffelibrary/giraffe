structure GdkPixbufColorspace :> GDK_PIXBUF_COLORSPACE =
  struct
    datatype enum =
      RGB
    structure Enum =
      Enum(
        type enum = enum
        val null = RGB
        val toInt = fn RGB => 0
        exception Value of GInt.t
        val fromInt =
          fn
            0 => RGB
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_colorspace_get_type" : unit -> GObjectType.FFI.val_;
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
