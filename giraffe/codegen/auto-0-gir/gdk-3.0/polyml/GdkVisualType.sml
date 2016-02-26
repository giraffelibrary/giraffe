structure GdkVisualType :>
  sig
    include GDK_VISUAL_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      STATIC_GRAY
    | GRAYSCALE
    | STATIC_COLOR
    | PSEUDO_COLOR
    | TRUE_COLOR
    | DIRECT_COLOR
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STATIC_GRAY => f 0
          | GRAYSCALE => f 1
          | STATIC_COLOR => f 2
          | PSEUDO_COLOR => f 3
          | TRUE_COLOR => f 4
          | DIRECT_COLOR => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STATIC_GRAY
          | 1 => GRAYSCALE
          | 2 => STATIC_COLOR
          | 3 => PSEUDO_COLOR
          | 4 => TRUE_COLOR
          | 5 => DIRECT_COLOR
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
      val getType_ = call (load_sym libgdk "gdk_visual_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = STATIC_GRAY
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
