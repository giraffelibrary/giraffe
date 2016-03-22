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
      val getType_ = call (load_sym libgtk "gtk_menu_tool_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_menu_tool_button_new") (GtkWidgetClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_menu_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getMenu_ = call (load_sym libgtk "gtk_menu_tool_button_get_menu") (GtkMenuToolButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setArrowTooltipMarkup_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_markup") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setArrowTooltipText_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_text") (GtkMenuToolButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMenu_ = call (load_sym libgtk "gtk_menu_tool_button_set_menu") (GtkMenuToolButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkMenuToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconWidget label = (GtkWidgetClass.C.withOptPtr &&&> Utf8.C.withOptPtr ---> GtkMenuToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkMenuToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getMenu self = (GtkMenuToolButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenu_ self
    fun setArrowTooltipMarkup self markup = (GtkMenuToolButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GtkMenuToolButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setArrowTooltipText_ (self & text)
    fun setMenu self menu = (GtkMenuToolButtonClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setMenu_ (self & menu)
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
