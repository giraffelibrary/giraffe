signature GTK_MENU_TOOL_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type 'a menu_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a widget_class_t option
       -> string option
       -> base class_t
    val newFromStock : string -> base class_t
    val getMenu : 'a class_t -> base widget_class_t
    val setArrowTooltipMarkup :
      'a class_t
       -> string
       -> unit
    val setArrowTooltipText :
      'a class_t
       -> string
       -> unit
    val setMenu :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val showMenuSig : (unit -> unit) -> 'a class_t Signal.signal
    val menuProp : ('a class_t, base menu_class_t option, 'b menu_class_t option) Property.readwrite
  end
