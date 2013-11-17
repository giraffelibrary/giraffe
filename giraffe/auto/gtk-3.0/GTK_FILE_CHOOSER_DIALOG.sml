signature GTK_FILE_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type filechooseraction_t
    type 'a windowclass_t
    type 'a filechooserclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFileChooser : 'a class_t -> base filechooserclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string option
       -> 'a windowclass_t option
       -> filechooseraction_t
       -> base class_t
  end
