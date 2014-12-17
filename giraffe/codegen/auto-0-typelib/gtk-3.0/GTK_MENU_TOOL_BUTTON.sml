signature GTK_MENU_TOOL_BUTTON =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type 'a menuclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a widgetclass_t option
       -> string option
       -> base class_t
    val newFromStock : string -> base class_t
    val getMenu : 'a class_t -> base widgetclass_t
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
       -> 'b widgetclass_t
       -> unit
    val showMenuSig : (unit -> unit) -> 'a class_t Signal.signal
    val menuProp : ('a class_t, base menuclass_t option, 'b menuclass_t option) Property.readwrite
  end
