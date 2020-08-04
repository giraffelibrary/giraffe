structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class = 'a GtkFileChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class =
  struct
    val getType_ = _import "gtk_file_chooser_dialog_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkFileChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFileChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
