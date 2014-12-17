signature GTK_FONT_SELECTION_DIALOG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
  end
