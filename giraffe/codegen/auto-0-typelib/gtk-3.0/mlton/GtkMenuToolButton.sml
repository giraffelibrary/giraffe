structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class = 'a GtkMenuToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_menu_tool_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_new" :
              GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_menu_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
    val getMenu_ = _import "gtk_menu_tool_button_get_menu" : GtkMenuToolButtonClass.FFI.non_opt GtkMenuToolButtonClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val setArrowTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_set_arrow_tooltip_markup" :
              GtkMenuToolButtonClass.FFI.non_opt GtkMenuToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkMenuToolButtonClass.FFI.non_opt GtkMenuToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMenu_ = fn x1 & x2 => (_import "gtk_menu_tool_button_set_menu" : GtkMenuToolButtonClass.FFI.non_opt GtkMenuToolButtonClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
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
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkMenuToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkMenuToolButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun getMenu self = (GtkMenuToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getMenu_ self
    fun setArrowTooltipMarkup self markup = (GtkMenuToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GtkMenuToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setArrowTooltipText_ (self & text)
    fun setMenu self menu = (GtkMenuToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setMenu_ (self & menu)
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
          set = fn x => set "menu" GtkMenuClass.tOpt x,
          new = fn x => new "menu" GtkMenuClass.tOpt x
        }
    end
  end
