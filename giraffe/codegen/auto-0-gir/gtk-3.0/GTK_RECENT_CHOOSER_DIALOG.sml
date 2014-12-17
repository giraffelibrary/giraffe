signature GTK_RECENT_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a recentchooserclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asRecentChooser : 'a class_t -> base recentchooserclass_t
    val getType : unit -> GObject.Type.t
  end
