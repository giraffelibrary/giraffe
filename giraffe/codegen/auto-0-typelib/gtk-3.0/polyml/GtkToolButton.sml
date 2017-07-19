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
      val getType_ = call (getSymbol "gtk_tool_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tool_button_new") (GtkWidgetClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_tool_button_get_icon_name") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIconWidget_ = call (getSymbol "gtk_tool_button_get_icon_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getLabel_ = call (getSymbol "gtk_tool_button_get_label") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelWidget_ = call (getSymbol "gtk_tool_button_get_label_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getStockId_ = call (getSymbol "gtk_tool_button_get_stock_id") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseUnderline_ = call (getSymbol "gtk_tool_button_get_use_underline") (GtkToolButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setIconName_ = call (getSymbol "gtk_tool_button_set_icon_name") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setIconWidget_ = call (getSymbol "gtk_tool_button_set_icon_widget") (GtkToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setLabel_ = call (getSymbol "gtk_tool_button_set_label") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLabelWidget_ = call (getSymbol "gtk_tool_button_set_label_widget") (GtkToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setStockId_ = call (getSymbol "gtk_tool_button_set_stock_id") (GtkToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_tool_button_set_use_underline") (GtkToolButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr &&&> Utf8.FFI.withOptPtr ---> GtkToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkToolButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun getIconName self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getIconWidget self = (GtkToolButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getIconWidget_ self
    fun getLabel self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelWidget self = (GtkToolButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getLabelWidget_ self
    fun getStockId self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun getUseUnderline self = (GtkToolButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
