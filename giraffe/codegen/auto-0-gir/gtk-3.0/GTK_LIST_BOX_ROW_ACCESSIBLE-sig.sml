signature GTK_LIST_BOX_ROW_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val getType : unit -> GObject.Type.t
  end
