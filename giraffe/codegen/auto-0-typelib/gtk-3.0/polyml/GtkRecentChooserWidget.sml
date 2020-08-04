structure GtkRecentChooserWidget :>
  GTK_RECENT_CHOOSER_WIDGET
    where type 'a class = 'a GtkRecentChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_widget_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_recent_chooser_widget_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newForManager_ = call (getSymbol "gtk_recent_chooser_widget_new_for_manager") (GtkRecentManagerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkRecentChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkRecentChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserWidgetClass.FFI.fromPtr false) new_ ()
    fun newForManager manager = (GtkRecentManagerClass.FFI.withPtr false ---> GtkRecentChooserWidgetClass.FFI.fromPtr false) newForManager_ manager
  end
