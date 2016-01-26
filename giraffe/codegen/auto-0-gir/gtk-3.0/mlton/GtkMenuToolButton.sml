structure GtkMenuToolButton :>
  GTK_MENU_TOOL_BUTTON
    where type 'a class_t = 'a GtkMenuToolButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t =
  struct
    val getType_ = _import "gtk_menu_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_new" :
              unit GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_menu_tool_button_new_from_stock" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getMenu_ = _import "gtk_menu_tool_button_get_menu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setArrowTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_tool_button_set_arrow_tooltip_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMenu_ = fn x1 & x2 => (_import "gtk_menu_tool_button_set_menu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
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
    fun new iconWidget label = (GObjectObjectClass.C.withOptPtr &&&> FFI.String.C.withConstOptPtr ---> GtkMenuToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (FFI.String.C.withConstPtr ---> GtkMenuToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getMenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenu_ self
    fun setArrowTooltipMarkup self markup = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setArrowTooltipMarkup_ (self & markup)
    fun setArrowTooltipText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setArrowTooltipText_ (self & text)
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
