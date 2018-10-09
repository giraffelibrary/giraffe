signature GTK_RECENT_CHOOSER_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a recent_chooser_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asRecentChooser : 'a class -> base recent_chooser_class
    val getType : unit -> GObject.Type.t
  end
