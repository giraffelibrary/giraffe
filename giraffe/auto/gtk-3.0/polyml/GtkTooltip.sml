structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class_t = 'a GtkTooltipClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tooltip_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val triggerTooltipQuery_ = call (load_sym libgtk "gtk_tooltip_trigger_tooltip_query") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setCustom_ = call (load_sym libgtk "gtk_tooltip_set_custom") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setIcon_ = call (load_sym libgtk "gtk_tooltip_set_icon") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setIconFromGicon_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_gicon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setIconFromIconName_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_icon_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setIconFromStock_ =
        call (load_sym libgtk "gtk_tooltip_set_icon_from_stock")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMarkup_ = call (load_sym libgtk "gtk_tooltip_set_markup") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setText_ = call (load_sym libgtk "gtk_tooltip_set_text") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setTipArea_ = call (load_sym libgtk "gtk_tooltip_set_tip_area") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTooltipClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun triggerTooltipQuery display = (GObjectObjectClass.C.withPtr ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self gicon size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setIconFromStock_
        (
          self
           & stockId
           & size
        )
    fun setMarkup self markup = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setMarkup_ (self & markup)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setText_ (self & text)
    fun setTipArea self rect = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) setTipArea_ (self & rect)
  end
