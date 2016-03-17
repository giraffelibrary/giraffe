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
      val new_ = call (load_sym libgtk "gtk_menu_tool_button_new") (GObjectObjectClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_menu_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getMenu_ = call (load_sym libgtk "gtk_menu_tool_button_get_menu") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setArrowTooltipMarkup_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_markup") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setArrowTooltipText_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMenu_ = call (load_sym libgtk "gtk_menu_tool_button_set_menu") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
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
    fun new iconWidget label = (GObjectObjectClass.C.withOptPtr &&&> Utf8.C.withOptPtr ---> GtkMenuToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkMenuToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getMenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenu_ self
    fun setArrowTooltipMarkup self markup = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setArrowTooltipText_ (self & text)
    fun setMenu self menu = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setMenu_ (self & menu)
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
