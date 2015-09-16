signature GTK_FILE_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a file_chooser_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asFileChooser : 'a class_t -> base file_chooser_class_t
    val getType : unit -> GObject.Type.t
  end
