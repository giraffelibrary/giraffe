structure GtkCssProviderError :>
  sig
    include GTK_CSS_PROVIDER_ERROR
  end =
  struct
    datatype t =
      FAILED
    | SYNTAX
    | IMPORT
    | NAME
    | DEPRECATED
    | UNKNOWNVALUE
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
          | UNKNOWNVALUE => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => SYNTAX
          | 2 => IMPORT
          | 3 => NAME
          | 4 => DEPRECATED
          | 5 => UNKNOWNVALUE
          | n => raise Value n
      end
    val getType_ = _import "gtk_css_provider_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
