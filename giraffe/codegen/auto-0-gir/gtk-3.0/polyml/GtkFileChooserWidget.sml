structure GtkFileChooserWidget :>
  GTK_FILE_CHOOSER_WIDGET
    where type 'a class = 'a GtkFileChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_widget_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_file_chooser_widget_new") (GtkFileChooserAction.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkFileChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new action = (GtkFileChooserAction.C.withVal ---> GtkFileChooserWidgetClass.C.fromPtr false) new_ action
  end
