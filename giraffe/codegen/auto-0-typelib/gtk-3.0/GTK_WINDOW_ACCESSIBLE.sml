signature GTK_WINDOW_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asWindow : 'a class -> base Atk.WindowClass.class
    val getType : unit -> GObject.Type.t
  end
