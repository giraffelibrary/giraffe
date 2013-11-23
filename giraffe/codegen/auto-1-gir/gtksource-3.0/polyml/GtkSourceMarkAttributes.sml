structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class_t = 'a GtkSourceMarkAttributesClass.t
    where type 'a markclass_t = 'a GtkSourceMarkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getBackground_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_background") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getGicon_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_gicon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIconName_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_icon_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPixbuf_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_pixbuf") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getStockId_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_stock_id") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTooltipMarkup_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_tooltip_markup") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTooltipText_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_get_tooltip_text") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val renderIcon_ =
        call (load_sym libgtksourceview "gtk_source_mark_attributes_render_icon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val setBackground_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_background") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setGicon_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_gicon") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setIconName_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_icon_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setPixbuf_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_pixbuf") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setStockId_ = call (load_sym libgtksourceview "gtk_source_mark_attributes_set_stock_id") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceMarkAttributesClass.t
    type 'a markclass_t = 'a GtkSourceMarkClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceMarkAttributesClass.C.fromPtr true) new_ ()
    fun getBackground self =
      let
        val background & retVal = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getStockId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getStockId_ self
    fun getTooltipMarkup self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getTooltipText_ (self & mark)
    fun renderIcon self widget size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr false
      )
        renderIcon_
        (
          self
           & widget
           & size
        )
    fun setBackground self background = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackground_ (self & background)
    fun setGicon self gicon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setGicon_ (self & gicon)
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setStockId_ (self & stockId)
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
