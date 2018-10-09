signature GTK_MENU_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asSelection : 'a class -> base Atk.SelectionClass.class
    val getType : unit -> GObject.Type.t
  end
