structure GdkPixbufInterpType :> GDK_PIXBUF_INTERP_TYPE =
  struct
    datatype enum =
      NEAREST
    | TILES
    | BILINEAR
    | HYPER
    structure Enum =
      Enum(
        type enum = enum
        val null = NEAREST
        val toInt =
          fn
            NEAREST => 0
          | TILES => 1
          | BILINEAR => 2
          | HYPER => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NEAREST
          | 1 => TILES
          | 2 => BILINEAR
          | 3 => HYPER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_interp_type_get_type" : unit -> GObjectType.FFI.val_;
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
