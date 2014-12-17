signature GTK_FILE_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a filechooserclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFileChooser : 'a class_t -> base filechooserclass_t
    val getType : unit -> GObject.Type.t
  end
