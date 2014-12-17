structure GtkRecentChooserWidget :>
  GTK_RECENT_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkRecentChooserWidgetClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    where type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t =
  struct
    val getType_ = _import "gtk_recent_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_chooser_widget_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForManager_ = _import "gtk_recent_chooser_widget_new_for_manager" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkRecentChooserWidgetClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserWidgetClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserWidgetClass.C.fromPtr false) newForManager_ manager
  end
