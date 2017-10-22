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
    val activeProp : ('a class, bool, bool) Property.readwrite
    val centeredProp : ('a class, bool, bool) Property.readwrite
    val iconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconicProp : ('a class, bool, bool) Property.readwrite
    val invertedProp : ('a class, bool, bool) Property.readwrite
    val menuNameProp : ('a class, string option, string option) Property.readwrite
    val roleProp : ('a class, button_role_t, button_role_t) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
  end
