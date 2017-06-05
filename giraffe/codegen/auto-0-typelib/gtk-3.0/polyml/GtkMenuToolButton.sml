structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class = 'a GtkMenuToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_tool_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_menu_tool_button_new") (GtkWidgetClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_menu_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getMenu_ = call (load_sym libgtk "gtk_menu_tool_button_get_menu") (GtkMenuToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setArrowTooltipMarkup_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_markup") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setArrowTooltipText_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_text") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setMenu_ = call (load_sym libgtk "gtk_menu_tool_button_set_menu") (GtkMenuToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkMenuToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new iconWidget label = (GtkWidgetClass.FFI.withOptPtr &&&> Utf8.FFI.withOptPtr ---> GtkMenuToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkMenuToolButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun getMenu self = (GtkMenuToolButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getMenu_ self
    fun setArrowTooltipMarkup self markup = (GtkMenuToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GtkMenuToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setArrowTooltipText_ (self & text)
    fun setMenu self menu = (GtkMenuToolButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setMenu_ (self & menu)
    local
      open ClosureMarshal Signal
    in
      fun showMenuSig f = signal "show-menu" (void ---> ret_void) f
    end
    local
      open Property
    in
      val menuProp =
        {
          get = fn x => get "menu" GtkMenuClass.tOpt x,
          set = fn x => set "menu" GtkMenuClass.tOpt x
        }
    end
  end
