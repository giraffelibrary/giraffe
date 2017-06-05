structure GtkSourceGutterRendererPixbuf :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF
    where type 'a class = 'a GtkSourceGutterRendererPixbufClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_pixbuf_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_gutter_renderer_pixbuf_new" : unit -> GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p;
    val getGicon_ = _import "gtk_source_gutter_renderer_pixbuf_get_gicon" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_source_gutter_renderer_pixbuf_get_icon_name" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_source_gutter_renderer_pixbuf_get_pixbuf" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getStockId_ = _import "gtk_source_gutter_renderer_pixbuf_get_stock_id" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_gicon" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p * GioIconClass.FFI.notnull GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_icon_name" :
              GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_pixbuf" : GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_stock_id" :
              GtkSourceGutterRendererPixbufClass.FFI.notnull GtkSourceGutterRendererPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    fun getGicon self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getGicon_ self
    fun getIconName self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getPixbuf self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getStockId self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun setGicon self icon = (GtkSourceGutterRendererPixbufClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkSourceGutterRendererPixbufClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceGutterRendererPixbufClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceGutterRendererPixbufClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStockId_ (self & stockId)
    local
      open Property
    in
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x
        }
    end
  end
