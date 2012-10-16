structure GdkPixbufInterpType :>
  sig
    include GDK_PIXBUF_INTERP_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
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
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NEAREST => f 0
          | TILES => f 1
          | BILINEAR => f 2
          | HYPER => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_interp_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = NEAREST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
