structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class_t = 'a GtkSourceMarkAttributesClass.t
    where type 'a mark_class_t = 'a GtkSourceMarkClass.t =
  struct
    val getType_ = _import "gtk_source_mark_attributes_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_mark_attributes_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getGicon_ = _import "gtk_source_mark_attributes_get_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIconName_ = _import "gtk_source_mark_attributes_get_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPixbuf_ = _import "gtk_source_mark_attributes_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getStockId_ = _import "gtk_source_mark_attributes_get_stock_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltipMarkup_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_markup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getTooltipText_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val renderIcon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_mark_attributes_render_icon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_stock_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceMarkAttributesClass.t
    type 'a mark_class_t = 'a GtkSourceMarkClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceMarkAttributesClass.C.fromPtr true) new_ ()
    fun getBackground self =
      let
        val background & retVal = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getStockId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun getTooltipMarkup self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ (self & mark)
    fun renderIcon self widget size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStockId_ (self & stockId)
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
