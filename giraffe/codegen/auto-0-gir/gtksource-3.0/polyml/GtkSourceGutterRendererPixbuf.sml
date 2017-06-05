structure GtkSourceGutterRendererPixbuf :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF
    where type 'a class = 'a GtkSourceGutterRendererPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_new") (PolyMLFFI.cVoid --> GtkSourceGutterRendererClass.PolyML.cPtr)
      val getGicon_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_get_gicon") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_get_icon_name") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_get_pixbuf") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getStockId_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_get_stock_id") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setGicon_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_set_gicon") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setIconName_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_set_icon_name") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setPixbuf_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_set_pixbuf") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setStockId_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_pixbuf_set_stock_id") (GtkSourceGutterRendererPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
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
