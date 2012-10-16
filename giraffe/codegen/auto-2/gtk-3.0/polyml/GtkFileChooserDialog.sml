structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFileChooserDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a filechooserclass_t = 'a GtkFileChooserClass.t
    where type 'a windowclass_t = 'a GtkWindowClass.t
    where type filechooseraction_t = GtkFileChooserAction.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgiraffegtk "giraffe_gtk_file_chooser_dialog_new")
          (
            FFI.PolyML.String.INOPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GtkFileChooserAction.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GtkFileChooserDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a filechooserclass_t = 'a GtkFileChooserClass.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    type filechooseraction_t = GtkFileChooserAction.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title parent action =
      (
        FFI.String.withConstOptPtr
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
