structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class = 'a GtkMenuToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_menu_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_new" :
              unit GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_menu_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val getMenu_ = _import "gtk_menu_tool_button_get_menu" : GtkMenuToolButtonClass.C.notnull GtkMenuToolButtonClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val setArrowTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_set_arrow_tooltip_markup" :
              GtkMenuToolButtonClass.C.notnull GtkMenuToolButtonClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setArrowTooltipText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_set_arrow_tooltip_text" :
              GtkMenuToolButtonClass.C.notnull GtkMenuToolButtonClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMenu_ = fn x1 & x2 => (_import "gtk_menu_tool_button_set_menu" : GtkMenuToolButtonClass.C.notnull GtkMenuToolButtonClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
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
