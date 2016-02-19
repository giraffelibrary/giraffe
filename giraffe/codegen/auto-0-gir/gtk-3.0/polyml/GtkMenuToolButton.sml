structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class_t = 'a GtkMenuToolButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_tool_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_menu_tool_button_new") (GObjectObjectClass.PolyML.OPTPTR &&> Utf8.PolyML.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromStock_ = call (load_sym libgtk "gtk_menu_tool_button_new_from_stock") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getMenu_ = call (load_sym libgtk "gtk_menu_tool_button_get_menu") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setArrowTooltipMarkup_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_markup") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setArrowTooltipText_ = call (load_sym libgtk "gtk_menu_tool_button_set_arrow_tooltip_text") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setMenu_ = call (load_sym libgtk "gtk_menu_tool_button_set_menu") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkMenuToolButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type t = base class_t
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
