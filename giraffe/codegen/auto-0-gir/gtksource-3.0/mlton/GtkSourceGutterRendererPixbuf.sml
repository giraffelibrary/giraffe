structure GtkSourceGutterRendererPixbuf :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF
    where type 'a class = 'a GtkSourceGutterRendererPixbufClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_pixbuf_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_gutter_renderer_pixbuf_new" : unit -> GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p;
    val getGicon_ = _import "gtk_source_gutter_renderer_pixbuf_get_gicon" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getIconName_ = _import "gtk_source_gutter_renderer_pixbuf_get_icon_name" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPixbuf_ = _import "gtk_source_gutter_renderer_pixbuf_get_pixbuf" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getStockId_ = _import "gtk_source_gutter_renderer_pixbuf_get_stock_id" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_gicon" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p * GioIconClass.C.notnull GioIconClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_icon_name" :
              GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_pixbuf_set_pixbuf" : GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_gutter_renderer_pixbuf_set_stock_id" :
              GtkSourceGutterRendererPixbufClass.C.notnull GtkSourceGutterRendererPixbufClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceGutterRendererPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererPixbufClass.C.fromPtr true) new_ ()
    fun getGicon self = (GtkSourceGutterRendererPixbufClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getIconName self = (GtkSourceGutterRendererPixbufClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GtkSourceGutterRendererPixbufClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getStockId self = (GtkSourceGutterRendererPixbufClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun setGicon self icon = (GtkSourceGutterRendererPixbufClass.C.withPtr &&&> GioIconClass.C.withPtr ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkSourceGutterRendererPixbufClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceGutterRendererPixbufClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceGutterRendererPixbufClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStockId_ (self & stockId)
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
