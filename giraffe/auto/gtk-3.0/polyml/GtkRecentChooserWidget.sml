structure GtkRecentChooserWidget :>
  GTK_RECENT_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkRecentChooserWidgetClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    where type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_chooser_widget_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_recent_chooser_widget_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newForManager_ = call (load_sym libgtk "gtk_recent_chooser_widget_new_for_manager") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkRecentChooserWidgetClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserWidgetClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserWidgetClass.C.fromPtr false) newForManager_ manager
  end