structure GtkFileChooserWidget :>
  GTK_FILE_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkFileChooserWidgetClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a filechooserclass_t = 'a GtkFileChooserClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type filechooseraction_t = GtkFileChooserAction.t =
  struct
    val getType_ = _import "gtk_file_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_file_chooser_widget_new" : GtkFileChooserAction.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkFileChooserWidgetClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a filechooserclass_t = 'a GtkFileChooserClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type filechooseraction_t = GtkFileChooserAction.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new action = (GtkFileChooserAction.C.withVal ---> GtkFileChooserWidgetClass.C.fromPtr false) new_ action
  end
