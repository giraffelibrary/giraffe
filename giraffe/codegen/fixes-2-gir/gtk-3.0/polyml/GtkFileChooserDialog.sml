structure GtkFileChooserDialog :>
  GTK_FILE_CHOOSER_DIALOG
    where type 'a class = 'a GtkFileChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_dialog_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "giraffe_gtk_file_chooser_dialog_new")
          (
            Utf8.PolyML.cInOptPtr
             &&> GtkWindowClass.PolyML.cOptPtr
             &&> GtkFileChooserAction.PolyML.cVal
             --> GtkFileChooserDialogClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GtkFileChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkFileChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title parent action =
      (
        Utf8.FFI.withOptPtr
         &&&> GtkWindowClass.FFI.withOptPtr
         &&&> GtkFileChooserAction.FFI.withVal
         ---> GtkFileChooserDialogClass.FFI.fromPtr false
      )
        new_
        (
          title
           & parent
           & action
        )
  end
