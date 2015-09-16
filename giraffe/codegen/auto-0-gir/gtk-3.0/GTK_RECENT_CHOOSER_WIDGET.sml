signature GTK_RECENT_CHOOSER_WIDGET =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a recent_chooser_class_t
    type 'a recent_manager_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val asRecentChooser : 'a class_t -> base recent_chooser_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newForManager : 'a recent_manager_class_t -> base class_t
  end
