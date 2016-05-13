structure PangoWeight :>
  sig
    include PANGO_WEIGHT
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      THIN
    | ULTRALIGHT
    | LIGHT
    | BOOK
    | NORMAL
    | MEDIUM
    | SEMIBOLD
    | BOLD
    | ULTRABOLD
    | HEAVY
    | ULTRAHEAVY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            THIN => f 100
          | ULTRALIGHT => f 200
          | LIGHT => f 300
          | BOOK => f 380
          | NORMAL => f 400
          | MEDIUM => f 500
          | SEMIBOLD => f 600
          | BOLD => f 700
          | ULTRABOLD => f 800
          | HEAVY => f 900
          | ULTRAHEAVY => f 1000
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            100 => THIN
          | 200 => ULTRALIGHT
          | 300 => LIGHT
          | 380 => BOOK
          | 400 => NORMAL
          | 500 => MEDIUM
          | 600 => SEMIBOLD
          | 700 => BOLD
          | 800 => ULTRABOLD
          | 900 => HEAVY
          | 1000 => ULTRAHEAVY
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
      val getType_ = call (load_sym libpango "pango_weight_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = THIN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
