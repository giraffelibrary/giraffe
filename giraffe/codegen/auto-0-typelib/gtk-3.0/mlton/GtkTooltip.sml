structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tooltip_get_type" : unit -> GObjectType.FFI.val_;
    val triggerTooltipQuery_ = _import "gtk_tooltip_trigger_tooltip_query" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;
    val setCustom_ = fn x1 & x2 => (_import "gtk_tooltip_set_custom" : GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_tooltip_set_icon" : GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setIconFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tooltip_set_icon_from_gicon" :
              GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p
               * GioIconClass.FFI.opt GioIconClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconFromIconName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_tooltip_set_icon_from_icon_name" :
              GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconFromStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_tooltip_set_icon_from_stock" :
              GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tooltip_set_markup" :
              GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tooltip_set_text" :
              GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTipArea_ = fn x1 & x2 => (_import "gtk_tooltip_set_tip_area" : GtkTooltipClass.FFI.non_opt GtkTooltipClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTooltipClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun triggerTooltipQuery display = (GdkDisplayClass.FFI.withPtr false ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GtkTooltipClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GtkTooltipClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self (gicon, size) =
      (
        GtkTooltipClass.FFI.withPtr false
         &&&> GioIconClass.FFI.withOptPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setIconFromGicon_
        (
          self
           & gicon
           & size
        )
    fun setIconFromIconName self (iconName, size) =
      (
        GtkTooltipClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setIconFromIconName_
        (
          self
           & iconName
           & size
        )
    fun setIconFromStock self (stockId, size) =
      (
        GtkTooltipClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setIconFromStock_
        (
          self
           & stockId
           & size
        )
    fun setMarkup self markup = (GtkTooltipClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setMarkup_ (self & markup)
    fun setText self text = (GtkTooltipClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setText_ (self & text)
    fun setTipArea self rect = (GtkTooltipClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> I) setTipArea_ (self & rect)
  end
