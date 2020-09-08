signature GTK_MODEL_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type button_role_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val activeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val centeredProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val iconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconicProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val invertedProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val menuNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val roleProp : ('a class, unit -> button_role_t, button_role_t -> unit, button_role_t -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
