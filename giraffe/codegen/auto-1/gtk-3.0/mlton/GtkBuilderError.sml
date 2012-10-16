structure GtkBuilderError :>
  sig
    include GTK_BUILDER_ERROR
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
    val getType_ = _import "gtk_builder_error_get_type" : unit -> GObjectType.C.val_;
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
          "gtk-builder-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkBuilderError = GtkBuilderError.Error
