structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFileChooserDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    val getType_ = _import "gtk_file_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 & x4 =>
          (
            _import "giraffe_gtk_file_chooser_dialog_new" :
              GCharVec.MLton.p1 * unit GCharVec.MLton.p2
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
    type 'a class_t = 'a GtkFileChooserDialogClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title parent action =
      (
        Utf8.C.withConstOptPtr
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
