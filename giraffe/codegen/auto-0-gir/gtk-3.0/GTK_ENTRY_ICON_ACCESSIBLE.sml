signature GTK_ENTRY_ICON_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asAction : 'a class -> base Atk.ActionClass.class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val getType : unit -> GObject.Type.t
  end
