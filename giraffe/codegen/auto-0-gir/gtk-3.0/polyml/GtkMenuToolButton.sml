structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class = 'a GtkMenuToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_tool_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_tool_button_new") (GtkWidgetClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_menu_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getMenu_ = call (getSymbol "gtk_menu_tool_button_get_menu") (GtkMenuToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setArrowTooltipMarkup_ = call (getSymbol "gtk_menu_tool_button_set_arrow_tooltip_markup") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setArrowTooltipText_ = call (getSymbol "gtk_menu_tool_button_set_arrow_tooltip_text") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMenu_ = call (getSymbol "gtk_menu_tool_button_set_menu") (GtkMenuToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkMenuToolButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkMenuToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label) before GtkWidgetClass.FFI.touchOptPtr iconWidget before Utf8.FFI.touchOptPtr label
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkMenuToolButtonClass.FFI.fromPtr false) newFromStock_ stockId before Utf8.FFI.touchPtr stockId
    fun getMenu self = (GtkMenuToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getMenu_ self before GtkMenuToolButtonClass.FFI.touchPtr self
    fun setArrowTooltipMarkup self markup = (GtkMenuToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GtkMenuToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setArrowTooltipText_ (self & text)
    fun setMenu self menu = (GtkMenuToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setMenu_ (self & menu)
    local
      open ClosureMarshal Signal
    in
      fun showMenuSig f = signal "show-menu" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val menuProp =
        {
          name = "menu",
          gtype = fn () => C.gtype GtkMenuClass.tOpt (),
          get = fn x => fn () => C.get GtkMenuClass.tOpt x,
          set = fn x => C.set GtkMenuClass.tOpt x,
          init = fn x => C.set GtkMenuClass.tOpt x
        }
    end
  end
