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
