structure GdkPixbufInterpType :>
  sig
    include GDK_PIXBUF_INTERP_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NEAREST
    | TILES
    | BILINEAR
    | HYPER
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NEAREST => f 0
          | TILES => f 1
          | BILINEAR => f 2
          | HYPER => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NEAREST
          | 1 => TILES
          | 2 => BILINEAR
          | 3 => HYPER
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
      val getType_ = call (load_sym libgdkpixbuf "gdk_interp_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = NEAREST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
