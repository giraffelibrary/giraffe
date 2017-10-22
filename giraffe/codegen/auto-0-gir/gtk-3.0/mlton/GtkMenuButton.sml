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
    val new_ = _import "gtk_menu_button_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getAlignWidget_ = _import "gtk_menu_button_get_align_widget" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDirection_ = _import "gtk_menu_button_get_direction" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GtkArrowType.FFI.val_;
    val getMenuModel_ = _import "gtk_menu_button_get_menu_model" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p;
    val getPopover_ = _import "gtk_menu_button_get_popover" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p;
    val getPopup_ = _import "gtk_menu_button_get_popup" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GtkMenuClass.FFI.notnull GtkMenuClass.FFI.p;
    val getUsePopover_ = _import "gtk_menu_button_get_use_popover" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p -> GBool.FFI.val_;
    val setAlignWidget_ = fn x1 & x2 => (_import "gtk_menu_button_set_align_widget" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setDirection_ = fn x1 & x2 => (_import "gtk_menu_button_set_direction" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * GtkArrowType.FFI.val_ -> unit;) (x1, x2)
    val setMenuModel_ = fn x1 & x2 => (_import "gtk_menu_button_set_menu_model" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * unit GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    val setPopover_ = fn x1 & x2 => (_import "gtk_menu_button_set_popover" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setPopup_ = fn x1 & x2 => (_import "gtk_menu_button_set_popup" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setUsePopover_ = fn x1 & x2 => (_import "gtk_menu_button_set_use_popover" : GtkMenuButtonClass.FFI.notnull GtkMenuButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuButtonClass.FFI.fromPtr false) new_ ()
    fun getAlignWidget self = (GtkMenuButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getAlignWidget_ self
    fun getDirection self = (GtkMenuButtonClass.FFI.withPtr ---> GtkArrowType.FFI.fromVal) getDirection_ self
    fun getMenuModel self = (GtkMenuButtonClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr false) getMenuModel_ self
    fun getPopover self = (GtkMenuButtonClass.FFI.withPtr ---> GtkPopoverClass.FFI.fromPtr false) getPopover_ self
    fun getPopup self = (GtkMenuButtonClass.FFI.withPtr ---> GtkMenuClass.FFI.fromPtr false) getPopup_ self
    fun getUsePopover self = (GtkMenuButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUsePopover_ self
    fun setAlignWidget self alignWidget = (GtkMenuButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setAlignWidget_ (self & alignWidget)
    fun setDirection self direction = (GtkMenuButtonClass.FFI.withPtr &&&> GtkArrowType.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setMenuModel self menuModel = (GtkMenuButtonClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setMenuModel_ (self & menuModel)
    fun setPopover self popover = (GtkMenuButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setPopover_ (self & popover)
    fun setPopup self menu = (GtkMenuButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setPopup_ (self & menu)
    fun setUsePopover self usePopover = (GtkMenuButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUsePopover_ (self & usePopover)
    local
      open Property
    in
      val alignWidgetProp =
        {
          get = fn x => get "align-widget" GtkContainerClass.tOpt x,
          set = fn x => set "align-widget" GtkContainerClass.tOpt x
        }
      val directionProp =
        {
          get = fn x => get "direction" GtkArrowType.t x,
          set = fn x => set "direction" GtkArrowType.t x
        }
      val menuModelProp =
        {
          get = fn x => get "menu-model" GioMenuModelClass.tOpt x,
          set = fn x => set "menu-model" GioMenuModelClass.tOpt x
        }
      val popoverProp =
        {
          get = fn x => get "popover" GtkPopoverClass.tOpt x,
          set = fn x => set "popover" GtkPopoverClass.tOpt x
        }
      val popupProp =
        {
          get = fn x => get "popup" GtkMenuClass.tOpt x,
          set = fn x => set "popup" GtkMenuClass.tOpt x
        }
      val usePopoverProp =
        {
          get = fn x => get "use-popover" boolean x,
          set = fn x => set "use-popover" boolean x
        }
    end
  end
