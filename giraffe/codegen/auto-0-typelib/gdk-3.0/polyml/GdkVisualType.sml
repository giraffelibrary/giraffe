structure GdkVisualType :>
  sig
    include GDK_VISUAL_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      STATICGRAY
    | GRAYSCALE
    | STATICCOLOR
    | PSEUDOCOLOR
    | TRUECOLOR
    | DIRECTCOLOR
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STATICGRAY => f 0
          | GRAYSCALE => f 1
          | STATICCOLOR => f 2
          | PSEUDOCOLOR => f 3
          | TRUECOLOR => f 4
          | DIRECTCOLOR => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STATICGRAY
          | 1 => GRAYSCALE
          | 2 => STATICCOLOR
          | 3 => PSEUDOCOLOR
          | 4 => TRUECOLOR
          | 5 => DIRECTCOLOR
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_visual_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = STATICGRAY
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end