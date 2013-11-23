structure GdkPixbufPixbufError :>
  sig
    include GDK_PIXBUF_PIXBUF_ERROR
  end =
  struct
    datatype t =
      CORRUPTIMAGE
    | INSUFFICIENTMEMORY
    | BADOPTION
    | UNKNOWNTYPE
    | UNSUPPORTEDOPERATION
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CORRUPTIMAGE => f 0
          | INSUFFICIENTMEMORY => f 1
          | BADOPTION => f 2
          | UNKNOWNTYPE => f 3
          | UNSUPPORTEDOPERATION => f 4
          | FAILED => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CORRUPTIMAGE
          | 1 => INSUFFICIENTMEMORY
          | 2 => BADOPTION
          | 3 => UNKNOWNTYPE
          | 4 => UNSUPPORTEDOPERATION
          | 5 => FAILED
          | n => raise Value n
      end
    val getType_ = _import "gdk_pixbuf_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gdk-pixbuf-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GdkPixbufPixbufError = GdkPixbufPixbufError.Error
