structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class = 'a GtkFileChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    val getType_ = _import "gtk_file_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 & x4 =>
          (
            _import "giraffe_gtk_file_chooser_dialog_new" :
              Utf8.MLton.p1 * unit Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * GtkFileChooserAction.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkFileChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title parent action =
      (
        Utf8.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GtkFileChooserAction.C.withVal
         ---> GtkFileChooserDialogClass.C.fromPtr false
      )
        new_
        (
          title
           & parent
           & action
        )
  end
