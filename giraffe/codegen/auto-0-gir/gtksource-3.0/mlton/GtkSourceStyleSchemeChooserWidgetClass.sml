structure GtkSourceStyleSchemeChooserWidgetClass :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    open GtkBinClass
    type 'a style_scheme_chooser_widget = unit
    type 'a class = 'a style_scheme_chooser_widget class
    val getType_ = _import "gtk_source_style_scheme_chooser_widget_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end