structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tooltip_get_type" : unit -> GObjectType.FFI.val_;
    val triggerTooltipQuery_ = _import "gtk_tooltip_trigger_tooltip_query" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> unit;
    val setCustom_ = fn x1 & x2 => (_import "gtk_tooltip_set_custom" : GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_tooltip_set_icon" : GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p * unit GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setIconFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tooltip_set_icon_from_gicon" :
              GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * unit GioIconClass.FFI.p
               * GInt.FFI.val_
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
              GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GInt.FFI.val_
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
              GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GInt.FFI.val_
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
              GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
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
              GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTipArea_ = fn x1 & x2 => (_import "gtk_tooltip_set_tip_area" : GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTooltipClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun triggerTooltipQuery display = (GdkDisplayClass.FFI.withPtr ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GtkTooltipClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GtkTooltipClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self gicon size =
      (
        GtkTooltipClass.FFI.withPtr
         &&&> GioIconClass.FFI.withOptPtr
         &&&> GInt.FFI.withVal
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
        GtkTooltipClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt.FFI.withVal
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
        GtkTooltipClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setIconFromStock_
        (
          self
           & stockId
           & size
        )
    fun setMarkup self markup = (GtkTooltipClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setMarkup_ (self & markup)
    fun setText self text = (GtkTooltipClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setText_ (self & text)
    fun setTipArea self rect = (GtkTooltipClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withPtr ---> I) setTipArea_ (self & rect)
  end
