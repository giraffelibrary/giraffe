structure AtkLayer :>
  sig
    include ATK_LAYER
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | BACKGROUND
    | CANVAS
    | WIDGET
    | MDI
    | POPUP
    | OVERLAY
    | WINDOW
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | BACKGROUND => f 1
          | CANVAS => f 2
          | WIDGET => f 3
          | MDI => f 4
          | POPUP => f 5
          | OVERLAY => f 6
          | WINDOW => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => BACKGROUND
          | 2 => CANVAS
          | 3 => WIDGET
          | 4 => MDI
          | 5 => POPUP
          | 6 => OVERLAY
          | 7 => WINDOW
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
      val getType_ = call (load_sym libatk "atk_layer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = INVALID
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
