structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tooltip_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val triggerTooltipQuery_ = call (getSymbol "gtk_tooltip_trigger_tooltip_query") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val setCustom_ = call (getSymbol "gtk_tooltip_set_custom") (GtkTooltipClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setIcon_ = call (getSymbol "gtk_tooltip_set_icon") (GtkTooltipClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setIconFromGicon_ =
        call (getSymbol "gtk_tooltip_set_icon_from_gicon")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cOptPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setIconFromIconName_ =
        call (getSymbol "gtk_tooltip_set_icon_from_icon_name")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setIconFromStock_ =
        call (getSymbol "gtk_tooltip_set_icon_from_stock")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setMarkup_ = call (getSymbol "gtk_tooltip_set_markup") (GtkTooltipClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setText_ = call (getSymbol "gtk_tooltip_set_text") (GtkTooltipClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setTipArea_ = call (getSymbol "gtk_tooltip_set_tip_area") (GtkTooltipClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
    end
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
