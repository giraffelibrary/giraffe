structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tooltip_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val triggerTooltipQuery_ = call (load_sym libgtk "gtk_tooltip_trigger_tooltip_query") (GdkDisplayClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setCustom_ = call (load_sym libgtk "gtk_tooltip_set_custom") (GtkTooltipClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setIcon_ = call (load_sym libgtk "gtk_tooltip_set_icon") (GtkTooltipClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setIconFromGicon_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_gicon")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cOptPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setIconFromIconName_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_icon_name")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setIconFromStock_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_stock")
          (
            GtkTooltipClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setMarkup_ = call (load_sym libgtk "gtk_tooltip_set_markup") (GtkTooltipClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setText_ = call (load_sym libgtk "gtk_tooltip_set_text") (GtkTooltipClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setTipArea_ = call (load_sym libgtk "gtk_tooltip_set_tip_area") (GtkTooltipClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
    fun setTipArea self rect = (GtkTooltipClass.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withPtr ---> I) setTipArea_ (self & rect)
  end
