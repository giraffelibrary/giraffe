structure GtkMenuButton :>
  GTK_MENU_BUTTON
    where type 'a class = 'a GtkMenuButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a container_class = 'a GtkContainerClass.class
    where type arrow_type_t = GtkArrowType.t
    where type 'a popover_class = 'a GtkPopoverClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_menu_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_menu_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAlignWidget_ = _import "gtk_menu_button_get_align_widget" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getDirection_ = _import "gtk_menu_button_get_direction" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GtkArrowType.FFI.val_;
    val getMenuModel_ = _import "gtk_menu_button_get_menu_model" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p;
    val getPopover_ = _import "gtk_menu_button_get_popover" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GtkPopoverClass.FFI.opt GtkPopoverClass.FFI.p;
    val getPopup_ = _import "gtk_menu_button_get_popup" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GtkMenuClass.FFI.opt GtkMenuClass.FFI.p;
    val getUsePopover_ = _import "gtk_menu_button_get_use_popover" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p -> GBool.FFI.val_;
    val setAlignWidget_ = fn x1 & x2 => (_import "gtk_menu_button_set_align_widget" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setDirection_ = fn x1 & x2 => (_import "gtk_menu_button_set_direction" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GtkArrowType.FFI.val_ -> unit;) (x1, x2)
    val setMenuModel_ = fn x1 & x2 => (_import "gtk_menu_button_set_menu_model" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    val setPopover_ = fn x1 & x2 => (_import "gtk_menu_button_set_popover" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setPopup_ = fn x1 & x2 => (_import "gtk_menu_button_set_popup" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setUsePopover_ = fn x1 & x2 => (_import "gtk_menu_button_set_use_popover" : GtkMenuButtonClass.FFI.non_opt GtkMenuButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkMenuButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a container_class = 'a GtkContainerClass.class
    type arrow_type_t = GtkArrowType.t
    type 'a popover_class = 'a GtkPopoverClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuButtonClass.FFI.fromPtr false) new_ ()
    fun getAlignWidget self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getAlignWidget_ self before GtkMenuButtonClass.FFI.touchPtr self
    fun getDirection self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkArrowType.FFI.fromVal) getDirection_ self
    fun getMenuModel self = (GtkMenuButtonClass.FFI.withPtr false ---> GioMenuModelClass.FFI.fromOptPtr false) getMenuModel_ self before GtkMenuButtonClass.FFI.touchPtr self
    fun getPopover self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkPopoverClass.FFI.fromOptPtr false) getPopover_ self before GtkMenuButtonClass.FFI.touchPtr self
    fun getPopup self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkMenuClass.FFI.fromOptPtr false) getPopup_ self before GtkMenuButtonClass.FFI.touchPtr self
    fun getUsePopover self = (GtkMenuButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUsePopover_ self
    fun setAlignWidget self alignWidget = (GtkMenuButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setAlignWidget_ (self & alignWidget)
    fun setDirection self direction = (GtkMenuButtonClass.FFI.withPtr false &&&> GtkArrowType.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setMenuModel self menuModel = (GtkMenuButtonClass.FFI.withPtr false &&&> GioMenuModelClass.FFI.withOptPtr false ---> I) setMenuModel_ (self & menuModel)
    fun setPopover self popover = (GtkMenuButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setPopover_ (self & popover)
    fun setPopup self menu = (GtkMenuButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setPopup_ (self & menu)
    fun setUsePopover self usePopover = (GtkMenuButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUsePopover_ (self & usePopover)
    local
      open ValueAccessor
    in
      val alignWidgetProp =
        {
          name = "align-widget",
          gtype = fn () => C.gtype GtkContainerClass.tOpt (),
          get = fn x => fn () => C.get GtkContainerClass.tOpt x,
          set = fn x => C.set GtkContainerClass.tOpt x,
          init = fn x => C.set GtkContainerClass.tOpt x
        }
      val directionProp =
        {
          name = "direction",
          gtype = fn () => C.gtype GtkArrowType.t (),
          get = fn x => fn () => C.get GtkArrowType.t x,
          set = fn x => C.set GtkArrowType.t x,
          init = fn x => C.set GtkArrowType.t x
        }
      val menuModelProp =
        {
          name = "menu-model",
          gtype = fn () => C.gtype GioMenuModelClass.tOpt (),
          get = fn x => fn () => C.get GioMenuModelClass.tOpt x,
          set = fn x => C.set GioMenuModelClass.tOpt x,
          init = fn x => C.set GioMenuModelClass.tOpt x
        }
      val popoverProp =
        {
          name = "popover",
          gtype = fn () => C.gtype GtkPopoverClass.tOpt (),
          get = fn x => fn () => C.get GtkPopoverClass.tOpt x,
          set = fn x => C.set GtkPopoverClass.tOpt x,
          init = fn x => C.set GtkPopoverClass.tOpt x
        }
      val popupProp =
        {
          name = "popup",
          gtype = fn () => C.gtype GtkMenuClass.tOpt (),
          get = fn x => fn () => C.get GtkMenuClass.tOpt x,
          set = fn x => C.set GtkMenuClass.tOpt x,
          init = fn x => C.set GtkMenuClass.tOpt x
        }
      val usePopoverProp =
        {
          name = "use-popover",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
