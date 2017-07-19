signature GTK_FILE_CHOOSER_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a file_chooser_class
    type 'a window_class
    type file_chooser_action_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asFileChooser : 'a class -> base file_chooser_class
    val getType : unit -> GObject.Type.t
    val new :
      string option
       * 'a window_class option
       * file_chooser_action_t
       -> base class
  end
