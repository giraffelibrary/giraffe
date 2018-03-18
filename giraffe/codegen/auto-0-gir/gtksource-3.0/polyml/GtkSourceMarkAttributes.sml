structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class = 'a GtkSourceMarkAttributesClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_mark_attributes_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_mark_attributes_new") (cVoid --> GtkSourceMarkAttributesClass.PolyML.cPtr)
      val getBackground_ = call (getSymbol "gtk_source_mark_attributes_get_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGicon_ = call (getSymbol "gtk_source_mark_attributes_get_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_source_mark_attributes_get_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (getSymbol "gtk_source_mark_attributes_get_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getStockId_ = call (getSymbol "gtk_source_mark_attributes_get_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (getSymbol "gtk_source_mark_attributes_get_tooltip_markup") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (getSymbol "gtk_source_mark_attributes_get_tooltip_text") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val renderIcon_ =
        call (getSymbol "gtk_source_mark_attributes_render_icon")
          (
            GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setBackground_ = call (getSymbol "gtk_source_mark_attributes_set_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setGicon_ = call (getSymbol "gtk_source_mark_attributes_set_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setIconName_ = call (getSymbol "gtk_source_mark_attributes_set_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setPixbuf_ = call (getSymbol "gtk_source_mark_attributes_set_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val setStockId_ = call (getSymbol "gtk_source_mark_attributes_set_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceMarkAttributesClass.class
    type 'a mark_class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceMarkAttributesClass.FFI.fromPtr true) new_ ()
    fun getBackground self =
      let
        val background & retVal = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GtkSourceMarkAttributesClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getGicon_ self
    fun getIconName self = (GtkSourceMarkAttributesClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getPixbuf self = (GtkSourceMarkAttributesClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getStockId self = (GtkSourceMarkAttributesClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun getTooltipMarkup self mark = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GtkSourceMarkClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GtkSourceMarkClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getTooltipText_ (self & mark)
    fun renderIcon self (widget, size) =
      (
        GtkSourceMarkAttributesClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr false
      )
        renderIcon_
        (
          self
           & widget
           & size
        )
    fun setBackground self background = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setBackground_ (self & background)
    fun setGicon self gicon = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setGicon_ (self & gicon)
    fun setIconName self iconName = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceMarkAttributesClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStockId_ (self & stockId)
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
          set = fn x => set "background" GdkRgbaRecord.tOpt x,
          new = fn x => new "background" GdkRgbaRecord.tOpt x
        }
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
