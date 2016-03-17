structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class = 'a GtkTooltipClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tooltip_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val triggerTooltipQuery_ = call (load_sym libgtk "gtk_tooltip_trigger_tooltip_query") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setCustom_ = call (load_sym libgtk "gtk_tooltip_set_custom") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIcon_ = call (load_sym libgtk "gtk_tooltip_set_icon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconFromGicon_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_gicon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconFromIconName_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_icon_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconFromStock_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_stock")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setMarkup_ = call (load_sym libgtk "gtk_tooltip_set_markup") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setText_ = call (load_sym libgtk "gtk_tooltip_set_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setTipArea_ = call (load_sym libgtk "gtk_tooltip_set_tip_area") (GObjectObjectClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkTooltipClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun triggerTooltipQuery display = (GObjectObjectClass.C.withPtr ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self gicon size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun setMarkup self markup = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setMarkup_ (self & markup)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setText_ (self & text)
    fun setTipArea self rect = (GObjectObjectClass.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) setTipArea_ (self & rect)
  end
