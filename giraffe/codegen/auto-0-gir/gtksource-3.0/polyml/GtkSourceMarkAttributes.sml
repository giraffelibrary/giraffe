structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class = 'a GtkSourceMarkAttributesClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_new") (PolyMLFFI.cVoid --> GtkSourceMarkAttributesClass.PolyML.cPtr)
      val getBackground_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getGicon_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getStockId_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_tooltip_markup") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_tooltip_text") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val renderIcon_ =
        call (load_sym libgtksourceview "gtk_source_mark_attributes_render_icon")
          (
            GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setBackground_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setGicon_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setIconName_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setPixbuf_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setStockId_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceMarkAttributesClass.class
    type 'a mark_class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceMarkAttributesClass.C.fromPtr true) new_ ()
    fun getBackground self =
      let
        val background & retVal = (GtkSourceMarkAttributesClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GtkSourceMarkAttributesClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getIconName self = (GtkSourceMarkAttributesClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GtkSourceMarkAttributesClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getStockId self = (GtkSourceMarkAttributesClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun getTooltipMarkup self mark = (GtkSourceMarkAttributesClass.C.withPtr &&&> GtkSourceMarkClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GtkSourceMarkAttributesClass.C.withPtr &&&> GtkSourceMarkClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ (self & mark)
    fun renderIcon self widget size =
      (
        GtkSourceMarkAttributesClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr false
      )
        renderIcon_
        (
          self
           & widget
           & size
        )
    fun setBackground self background = (GtkSourceMarkAttributesClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackground_ (self & background)
    fun setGicon self gicon = (GtkSourceMarkAttributesClass.C.withPtr &&&> GioIconClass.C.withPtr ---> I) setGicon_ (self & gicon)
    fun setIconName self iconName = (GtkSourceMarkAttributesClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceMarkAttributesClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceMarkAttributesClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStockId_ (self & stockId)
    local
      open ClosureMarshal Signal
    in
      fun queryTooltipMarkupSig f = signal "query-tooltip-markup" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
      fun queryTooltipTextSig f = signal "query-tooltip-text" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
    end
    local
      open Property
    in
      val backgroundProp =
        {
          get = fn x => get "background" GdkRgbaRecord.tOpt x,
          set = fn x => set "background" GdkRgbaRecord.tOpt x
        }
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
