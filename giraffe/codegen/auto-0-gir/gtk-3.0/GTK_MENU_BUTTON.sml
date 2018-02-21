signature GTK_MENU_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type 'a container_class
    type arrow_type_t
    type 'a popover_class
    type 'a menu_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getAlignWidget : 'a class -> base widget_class option
    val getDirection : 'a class -> arrow_type_t
    val getMenuModel : 'a class -> base Gio.MenuModelClass.class option
    val getPopover : 'a class -> base popover_class option
    val getPopup : 'a class -> base menu_class option
    val getUsePopover : 'a class -> bool
    val setAlignWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setDirection :
      'a class
       -> arrow_type_t
       -> unit
    val setMenuModel :
      'a class
       -> 'b Gio.MenuModelClass.class option
       -> unit
    val setPopover :
      'a class
       -> 'b widget_class option
       -> unit
    val setPopup :
      'a class
       -> 'b widget_class option
       -> unit
    val setUsePopover :
      'a class
       -> bool
       -> unit
    val alignWidgetProp : ('a class, base container_class option, 'b container_class option) Property.readwrite
    val directionProp : ('a class, arrow_type_t, arrow_type_t) Property.readwrite
    val menuModelProp : ('a class, base Gio.MenuModelClass.class option, 'b Gio.MenuModelClass.class option) Property.readwrite
    val popoverProp : ('a class, base popover_class option, 'b popover_class option) Property.readwrite
    val popupProp : ('a class, base menu_class option, 'b menu_class option) Property.readwrite
    val usePopoverProp : ('a class, bool, bool) Property.readwrite
  end
