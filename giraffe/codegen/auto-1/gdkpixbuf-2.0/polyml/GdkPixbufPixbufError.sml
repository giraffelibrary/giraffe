structure GdkPixbufPixbufError :>
  sig
    include GDK_PIXBUF_PIXBUF_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            CORRUPTIMAGE => f 0
          | INSUFFICIENTMEMORY => f 1
          | BADOPTION => f 2
          | UNKNOWNTYPE => f 3
          | UNSUPPORTEDOPERATION => f 4
          | FAILED => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
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
