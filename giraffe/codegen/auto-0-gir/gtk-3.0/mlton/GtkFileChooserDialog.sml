structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFileChooserDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t =
  struct
    val getType_ = _import "gtk_file_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GtkFileChooserDialogClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
