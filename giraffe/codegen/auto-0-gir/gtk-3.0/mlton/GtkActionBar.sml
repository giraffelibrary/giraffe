structure GtkActionBar :>
  GTK_ACTION_BAR
    where type 'a class = 'a GtkActionBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_action_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_action_bar_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getCenterWidget_ = _import "gtk_action_bar_get_center_widget" : GtkActionBarClass.FFI.notnull GtkActionBarClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val packEnd_ = fn x1 & x2 => (_import "gtk_action_bar_pack_end" : GtkActionBarClass.FFI.notnull GtkActionBarClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val packStart_ = fn x1 & x2 => (_import "gtk_action_bar_pack_start" : GtkActionBarClass.FFI.notnull GtkActionBarClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setCenterWidget_ = fn x1 & x2 => (_import "gtk_action_bar_set_center_widget" : GtkActionBarClass.FFI.notnull GtkActionBarClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkActionBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkActionBarClass.FFI.fromPtr false) new_ ()
    fun getCenterWidget self = (GtkActionBarClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getCenterWidget_ self
    fun packEnd self child = (GtkActionBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) packEnd_ (self & child)
    fun packStart self child = (GtkActionBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) packStart_ (self & child)
    fun setCenterWidget self centerWidget = (GtkActionBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setCenterWidget_ (self & centerWidget)
  end
