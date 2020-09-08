signature GTK_POPOVER_MENU =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val openSubmenu :
      'a class
       -> string
       -> unit
    val visibleSubmenuProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
