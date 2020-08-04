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
    fun getGicon self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getGicon_ self
    fun getIconName self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getPixbuf self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getStockId self = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun setGicon self icon = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> GioIconClass.FFI.withOptPtr false ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceGutterRendererPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStockId_ (self & stockId)
    local
      open Property
    in
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x,
          new = fn x => new "gicon" GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x,
          new = fn x => new "icon-name" stringOpt x
        }
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x,
          new = fn x => new "stock-id" stringOpt x
        }
    end
  end
