structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accessible_get_type" : unit -> GObjectType.C.val_;
    val connectWidgetDestroyed_ = _import "gtk_accessible_connect_widget_destroyed" : GtkAccessibleClass.C.notnull GtkAccessibleClass.C.p -> unit;
    val getWidget_ = _import "gtk_accessible_get_widget" : GtkAccessibleClass.C.notnull GtkAccessibleClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val setWidget_ = fn x1 & x2 => (_import "gtk_accessible_set_widget" : GtkAccessibleClass.C.notnull GtkAccessibleClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun connectWidgetDestroyed self = (GtkAccessibleClass.C.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GtkAccessibleClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setWidget self widget = (GtkAccessibleClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setWidget_ (self & widget)
  end
