structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class = 'a GtkSourceMarkAttributesClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class =
  struct
    val getType_ = _import "gtk_source_mark_attributes_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_mark_attributes_new" : unit -> GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_background" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getGicon_ = _import "gtk_source_mark_attributes_get_gicon" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_source_mark_attributes_get_icon_name" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_source_mark_attributes_get_pixbuf" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getStockId_ = _import "gtk_source_mark_attributes_get_stock_id" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getTooltipMarkup_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_markup" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getTooltipText_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_text" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val renderIcon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_mark_attributes_render_icon" :
              GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_background" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_gicon" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GioIconClass.FFI.notnull GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_icon_name" :
              GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_pixbuf" : GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_stock_id" :
              GtkSourceMarkAttributesClass.FFI.notnull GtkSourceMarkAttributesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
    fun renderIcon self widget size =
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
