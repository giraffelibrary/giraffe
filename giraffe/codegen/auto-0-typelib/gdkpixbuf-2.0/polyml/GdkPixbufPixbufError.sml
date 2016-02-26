structure GdkPixbufPixbufError :>
  sig
    include GDK_PIXBUF_PIXBUF_ERROR
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      CORRUPT_IMAGE
    | INSUFFICIENT_MEMORY
    | BAD_OPTION
    | UNKNOWN_TYPE
    | UNSUPPORTED_OPERATION
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CORRUPT_IMAGE => f 0
          | INSUFFICIENT_MEMORY => f 1
          | BAD_OPTION => f 2
          | UNKNOWN_TYPE => f 3
          | UNSUPPORTED_OPERATION => f 4
          | FAILED => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CORRUPT_IMAGE
          | 1 => INSUFFICIENT_MEMORY
          | 2 => BAD_OPTION
          | 3 => UNKNOWN_TYPE
          | 4 => UNSUPPORTED_OPERATION
          | 5 => FAILED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_error_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
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
