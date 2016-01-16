structure GtkCssProviderError :>
  sig
    include GTK_CSS_PROVIDER_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      FAILED
    | SYNTAX
    | IMPORT
    | NAME
    | DEPRECATED
    | UNKNOWN_VALUE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | SYNTAX => f 1
          | IMPORT => f 2
          | NAME => f 3
          | DEPRECATED => f 4
          | UNKNOWN_VALUE => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => SYNTAX
          | 2 => IMPORT
          | 3 => NAME
          | 4 => DEPRECATED
          | 5 => UNKNOWN_VALUE
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
      val getType_ = call (load_sym libgtk "gtk_css_provider_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
          "gtk-css-provider-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkCssProviderError = GtkCssProviderError.Error
