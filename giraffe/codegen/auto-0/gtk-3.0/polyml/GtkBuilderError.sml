structure GtkBuilderError :>
  sig
    include GTK_BUILDER_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALIDTYPEFUNCTION
    | UNHANDLEDTAG
    | MISSINGATTRIBUTE
    | INVALIDATTRIBUTE
    | INVALIDTAG
    | MISSINGPROPERTYVALUE
    | INVALIDVALUE
    | VERSIONMISMATCH
    | DUPLICATEID
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALIDTYPEFUNCTION => f 0
          | UNHANDLEDTAG => f 1
          | MISSINGATTRIBUTE => f 2
          | INVALIDATTRIBUTE => f 3
          | INVALIDTAG => f 4
          | MISSINGPROPERTYVALUE => f 5
          | INVALIDVALUE => f 6
          | VERSIONMISMATCH => f 7
          | DUPLICATEID => f 8
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALIDTYPEFUNCTION
          | 1 => UNHANDLEDTAG
          | 2 => MISSINGATTRIBUTE
          | 3 => INVALIDATTRIBUTE
          | 4 => INVALIDTAG
          | 5 => MISSINGPROPERTYVALUE
          | 6 => INVALIDVALUE
          | 7 => VERSIONMISMATCH
          | 8 => DUPLICATEID
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
      val getType_ = call (load_sym libgtk "gtk_builder_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
          "gtk-builder-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkBuilderError = GtkBuilderError.Error
