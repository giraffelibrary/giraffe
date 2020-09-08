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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getAlignWidget_ = call (getSymbol "gtk_menu_button_get_align_widget") (GtkMenuButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getDirection_ = call (getSymbol "gtk_menu_button_get_direction") (GtkMenuButtonClass.PolyML.cPtr --> GtkArrowType.PolyML.cVal)
      val getMenuModel_ = call (getSymbol "gtk_menu_button_get_menu_model") (GtkMenuButtonClass.PolyML.cPtr --> GioMenuModelClass.PolyML.cOptPtr)
      val getPopover_ = call (getSymbol "gtk_menu_button_get_popover") (GtkMenuButtonClass.PolyML.cPtr --> GtkPopoverClass.PolyML.cOptPtr)
      val getPopup_ = call (getSymbol "gtk_menu_button_get_popup") (GtkMenuButtonClass.PolyML.cPtr --> GtkMenuClass.PolyML.cOptPtr)
      val getUsePopover_ = call (getSymbol "gtk_menu_button_get_use_popover") (GtkMenuButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAlignWidget_ = call (getSymbol "gtk_menu_button_set_align_widget") (GtkMenuButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setDirection_ = call (getSymbol "gtk_menu_button_set_direction") (GtkMenuButtonClass.PolyML.cPtr &&> GtkArrowType.PolyML.cVal --> cVoid)
      val setMenuModel_ = call (getSymbol "gtk_menu_button_set_menu_model") (GtkMenuButtonClass.PolyML.cPtr &&> GioMenuModelClass.PolyML.cOptPtr --> cVoid)
      val setPopover_ = call (getSymbol "gtk_menu_button_set_popover") (GtkMenuButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setPopup_ = call (getSymbol "gtk_menu_button_set_popup") (GtkMenuButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setUsePopover_ = call (getSymbol "gtk_menu_button_set_use_popover") (GtkMenuButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun getAlignWidget self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getAlignWidget_ self
    fun getDirection self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkArrowType.FFI.fromVal) getDirection_ self
    fun getMenuModel self = (GtkMenuButtonClass.FFI.withPtr false ---> GioMenuModelClass.FFI.fromOptPtr false) getMenuModel_ self
    fun getPopover self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkPopoverClass.FFI.fromOptPtr false) getPopover_ self
    fun getPopup self = (GtkMenuButtonClass.FFI.withPtr false ---> GtkMenuClass.FFI.fromOptPtr false) getPopup_ self
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
