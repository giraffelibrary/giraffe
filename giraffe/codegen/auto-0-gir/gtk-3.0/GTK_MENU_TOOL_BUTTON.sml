signature GTK_MENU_TOOL_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type 'a menu_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class option * string option -> base class
    val newFromStock : string -> base class
    val getMenu : 'a class -> base widget_class
    val setArrowTooltipMarkup :
      'a class
       -> string
       -> unit
    val setArrowTooltipText :
      'a class
       -> string
       -> unit
    val setMenu :
      'a class
       -> 'b widget_class
       -> unit
    val showMenuSig : (unit -> unit) -> 'a class Signal.t
    val menuProp : ('a class, base menu_class option, 'b menu_class option) Property.readwrite
  end
