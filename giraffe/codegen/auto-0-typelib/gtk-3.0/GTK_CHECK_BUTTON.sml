signature GTK_CHECK_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
  end
