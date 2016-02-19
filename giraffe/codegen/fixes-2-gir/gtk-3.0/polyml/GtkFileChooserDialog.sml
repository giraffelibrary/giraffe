structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFileChooserDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgiraffegtk "giraffe_gtk_file_chooser_dialog_new")
          (
            Utf8.PolyML.INOPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GtkFileChooserAction.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
    end
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
