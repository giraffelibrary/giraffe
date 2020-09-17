structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class = 'a GtkToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
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
      val getIconName_ = call (getSymbol "gtk_tool_button_get_icon_name") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getIconWidget_ = call (getSymbol "gtk_tool_button_get_icon_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getLabel_ = call (getSymbol "gtk_tool_button_get_label") (GtkToolButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getLabelWidget_ = call (getSymbol "gtk_tool_button_get_label_widget") (GtkToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
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
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label) before GtkWidgetClass.FFI.touchOptPtr iconWidget before Utf8.FFI.touchOptPtr label
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkToolButtonClass.FFI.fromPtr false) newFromStock_ stockId before Utf8.FFI.touchPtr stockId
    fun getIconName self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconName_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getIconWidget self = (GtkToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getIconWidget_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getLabel self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getLabelWidget self = (GtkToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getStockId self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getUseUnderline self = (GtkToolButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val iconWidgetProp =
        {
          name = "icon-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelWidgetProp =
        {
          name = "label-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val stockIdProp =
        {
          name = "stock-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val useUnderlineProp =
        {
          name = "use-underline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
