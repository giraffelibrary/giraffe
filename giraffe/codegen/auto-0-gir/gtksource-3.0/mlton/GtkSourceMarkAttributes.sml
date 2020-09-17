structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class = 'a GtkSourceMarkAttributesClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class =
  struct
    val getType_ = _import "gtk_source_mark_attributes_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_mark_attributes_new" : unit -> GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_background" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getGicon_ = _import "gtk_source_mark_attributes_get_gicon" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_source_mark_attributes_get_icon_name" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_source_mark_attributes_get_pixbuf" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val getStockId_ = _import "gtk_source_mark_attributes_get_stock_id" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTooltipMarkup_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_markup" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getTooltipText_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_get_tooltip_text" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val renderIcon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_mark_attributes_render_icon" :
              GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_background" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_gicon" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_icon_name" :
              GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_source_mark_attributes_set_pixbuf" : GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_attributes_set_stock_id" :
              GtkSourceMarkAttributesClass.FFI.non_opt GtkSourceMarkAttributesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
        val background & retVal = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getGicon_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getIconName self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getPixbuf self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getStockId self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getTooltipMarkup self mark = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getTooltipText_ (self & mark)
    fun renderIcon self (widget, size) =
      (
        GtkSourceMarkAttributesClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr false
      )
        renderIcon_
        (
          self
           & widget
           & size
        )
       before GtkSourceMarkAttributesClass.FFI.touchPtr self
       before GtkWidgetClass.FFI.touchPtr widget
    fun setBackground self background = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setBackground_ (self & background)
    fun setGicon self gicon = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setGicon_ (self & gicon)
    fun setIconName self iconName = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStockId_ (self & stockId)
    local
      open ClosureMarshal Signal
    in
      fun queryTooltipMarkupSig f = signal "query-tooltip-markup" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
      fun queryTooltipTextSig f = signal "query-tooltip-text" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
    end
    local
      open ValueAccessor
    in
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
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
