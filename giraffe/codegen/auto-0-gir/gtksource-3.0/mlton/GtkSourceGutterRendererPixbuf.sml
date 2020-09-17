structure GtkSourceGutterRendererPixbuf :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF
    where type 'a class = 'a GtkSourceGutterRendererPixbufClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_pixbuf_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_gutter_renderer_pixbuf_new" : unit -> GtkSourceGutterRendererClass.FFI.non_opt GtkSourceGutterRendererClass.FFI.p;
    val getGicon_ = _import "gtk_source_gutter_renderer_pixbuf_get_gicon" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_source_gutter_renderer_pixbuf_get_icon_name" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_source_gutter_renderer_pixbuf_get_pixbuf" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val getStockId_ = _import "gtk_source_gutter_renderer_pixbuf_get_stock_id" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_gicon" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p * GioIconClass.FFI.opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_icon_name" :
              GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_pixbuf" : GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_stock_id" :
              GtkSourceGutterRendererPixbufClass.FFI.non_opt GtkSourceGutterRendererPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceGutterRendererPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererPixbufClass.FFI.fromPtr true) new_ ()
    fun getGicon self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getGicon_ self before GtkSourceGutterRendererPixbufClass.FFI.touchPtr self
    fun getIconName self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self before GtkSourceGutterRendererPixbufClass.FFI.touchPtr self
    fun getPixbuf self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self before GtkSourceGutterRendererPixbufClass.FFI.touchPtr self
    fun getStockId self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkSourceGutterRendererPixbufClass.FFI.touchPtr self
    fun setGicon self icon = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> GioIconClass.FFI.withOptPtr false ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStockId_ (self & stockId)
    local
      open ValueAccessor
    in
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val pixbufProp =
        {
          name = "pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val stockIdProp =
        {
          name = "stock-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
