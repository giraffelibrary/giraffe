structure GtkFileChooserWidget :>
  GTK_FILE_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkFileChooserWidgetClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_widget_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_file_chooser_widget_new") (GtkFileChooserAction.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkFileChooserWidgetClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new action = (GtkFileChooserAction.C.withVal ---> GtkFileChooserWidgetClass.C.fromPtr false) new_ action
  end
