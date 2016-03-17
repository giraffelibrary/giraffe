signature GTK_RECENT_CHOOSER_WIDGET =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a recent_chooser_class
    type 'a recent_manager_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val asRecentChooser : 'a class -> base recent_chooser_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newForManager : 'a recent_manager_class -> base class
  end
