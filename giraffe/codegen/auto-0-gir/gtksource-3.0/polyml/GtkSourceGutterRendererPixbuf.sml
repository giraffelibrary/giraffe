structure GtkSourceGutterRendererPixbuf :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF
    where type 'a class = 'a GtkSourceGutterRendererPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_new") (cVoid --> GtkSourceGutterRendererClass.PolyML.cPtr)
      val getGicon_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_get_gicon") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_get_icon_name") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_get_pixbuf") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getStockId_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_get_stock_id") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setGicon_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_set_gicon") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> cVoid)
      val setIconName_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_set_icon_name") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setPixbuf_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_set_pixbuf") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setStockId_ = call (getSymbol "gtk_source_gutter_renderer_pixbuf_set_stock_id") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
    end
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
