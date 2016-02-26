structure GtkBuilderError :>
  sig
    include GTK_BUILDER_ERROR
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      INVALID_TYPE_FUNCTION
    | UNHANDLED_TAG
    | MISSING_ATTRIBUTE
    | INVALID_ATTRIBUTE
    | INVALID_TAG
    | MISSING_PROPERTY_VALUE
    | INVALID_VALUE
    | VERSION_MISMATCH
    | DUPLICATE_ID
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID_TYPE_FUNCTION => f 0
          | UNHANDLED_TAG => f 1
          | MISSING_ATTRIBUTE => f 2
          | INVALID_ATTRIBUTE => f 3
          | INVALID_TAG => f 4
          | MISSING_PROPERTY_VALUE => f 5
          | INVALID_VALUE => f 6
          | VERSION_MISMATCH => f 7
          | DUPLICATE_ID => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID_TYPE_FUNCTION
          | 1 => UNHANDLED_TAG
          | 2 => MISSING_ATTRIBUTE
          | 3 => INVALID_ATTRIBUTE
          | 4 => INVALID_TAG
          | 5 => MISSING_PROPERTY_VALUE
          | 6 => INVALID_VALUE
          | 7 => VERSION_MISMATCH
          | 8 => DUPLICATE_ID
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
      val getType_ = call (load_sym libgtk "gtk_builder_error_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
          "gtk-builder-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkBuilderError = GtkBuilderError.Error
