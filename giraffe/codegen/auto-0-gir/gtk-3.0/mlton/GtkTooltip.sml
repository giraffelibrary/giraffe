structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tooltip_get_type" : unit -> GObjectType.C.val_;
    val triggerTooltipQuery_ = _import "gtk_tooltip_trigger_tooltip_query" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;
    val setCustom_ = fn x1 & x2 => (_import "gtk_tooltip_set_custom" : GtkTooltipClass.C.notnull GtkTooltipClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_tooltip_set_icon" : GtkTooltipClass.C.notnull GtkTooltipClass.C.p * unit GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val setIconFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tooltip_set_icon_from_gicon" :
              GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * unit GioIconClass.C.p
               * FFI.Int.C.val_
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
              GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Int.C.val_
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
              GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Int.C.val_
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
              GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
              GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTipArea_ = fn x1 & x2 => (_import "gtk_tooltip_set_tip_area" : GtkTooltipClass.C.notnull GtkTooltipClass.C.p * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTooltipClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun triggerTooltipQuery display = (GdkDisplayClass.C.withPtr ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GtkTooltipClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GtkTooltipClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self gicon size =
      (
        GtkTooltipClass.C.withPtr
         &&&> GioIconClass.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setIconFromGicon_
        (
          self
           & gicon
           & size
        )
    fun setIconFromIconName self iconName size =
      (
        GtkTooltipClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setIconFromIconName_
        (
          self
           & iconName
           & size
        )
    fun setIconFromStock self stockId size =
      (
        GtkTooltipClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setIconFromStock_
        (
          self
           & stockId
           & size
        )
    fun setMarkup self markup = (GtkTooltipClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setMarkup_ (self & markup)
    fun setText self text = (GtkTooltipClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setText_ (self & text)
    fun setTipArea self rect = (GtkTooltipClass.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) setTipArea_ (self & rect)
  end
