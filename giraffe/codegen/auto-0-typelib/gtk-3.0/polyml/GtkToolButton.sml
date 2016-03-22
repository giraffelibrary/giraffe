structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class = 'a GtkToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tool_button_new") (GtkWidgetClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getIconName_ = call (load_sym libgtk "gtk_tool_button_get_icon_name") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIconWidget_ = call (load_sym libgtk "gtk_tool_button_get_icon_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getLabel_ = call (load_sym libgtk "gtk_tool_button_get_label") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelWidget_ = call (load_sym libgtk "gtk_tool_button_get_label_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getStockId_ = call (load_sym libgtk "gtk_tool_button_get_stock_id") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseUnderline_ = call (load_sym libgtk "gtk_tool_button_get_use_underline") (GtkToolButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setIconName_ = call (load_sym libgtk "gtk_tool_button_set_icon_name") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setIconWidget_ = call (load_sym libgtk "gtk_tool_button_set_icon_widget") (GtkToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_tool_button_set_label") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setLabelWidget_ = call (load_sym libgtk "gtk_tool_button_set_label_widget") (GtkToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setStockId_ = call (load_sym libgtk "gtk_tool_button_set_stock_id") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setUseUnderline_ = call (load_sym libgtk "gtk_tool_button_set_use_underline") (GtkToolButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconWidget label = (GtkWidgetClass.C.withOptPtr &&&> Utf8.C.withOptPtr ---> GtkToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getIconName self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getIconWidget self = (GtkToolButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getIconWidget_ self
    fun getLabel self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GtkToolButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getStockId self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun getUseUnderline self = (GtkToolButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open Property
    in
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val iconWidgetProp =
        {
          get = fn x => get "icon-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "icon-widget" GtkWidgetClass.tOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
    end
  end
