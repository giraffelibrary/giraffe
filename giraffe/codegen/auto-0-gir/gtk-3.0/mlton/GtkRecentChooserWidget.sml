structure GtkRecentChooserWidget :>
  GTK_RECENT_CHOOSER_WIDGET
    where type 'a class = 'a GtkRecentChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    val getType_ = _import "gtk_recent_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_chooser_widget_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newForManager_ = _import "gtk_recent_chooser_widget_new_for_manager" : GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    type 'a class = 'a GtkRecentChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserWidgetClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GtkRecentManagerClass.C.withPtr ---> GtkRecentChooserWidgetClass.C.fromPtr false) newForManager_ manager
  end
