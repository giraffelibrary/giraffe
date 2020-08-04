structure GtkSourceGutterRendererPixbufClass :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type C.opt = GtkSourceGutterRendererClass.C.opt
    where type C.non_opt = GtkSourceGutterRendererClass.C.non_opt
    where type 'a C.p = 'a GtkSourceGutterRendererClass.C.p =
  struct
    type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    open GtkSourceGutterRendererClass
    type 'a gutter_renderer_pixbuf = unit
    type 'a class = 'a gutter_renderer_pixbuf class
    val getType_ = _import "gtk_source_gutter_renderer_pixbuf_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
