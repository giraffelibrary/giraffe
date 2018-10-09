signature GTK_PROGRESS_BAR_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asValue : 'a class -> base Atk.ValueClass.class
    val getType : unit -> GObject.Type.t
  end
