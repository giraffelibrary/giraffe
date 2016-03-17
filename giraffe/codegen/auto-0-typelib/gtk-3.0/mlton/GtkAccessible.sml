structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accessible_get_type" : unit -> GObjectType.C.val_;
    val connectWidgetDestroyed_ = _import "gtk_accessible_connect_widget_destroyed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getWidget_ = _import "gtk_accessible_get_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setWidget_ = fn x1 & x2 => (_import "gtk_accessible_set_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun connectWidgetDestroyed self = (GObjectObjectClass.C.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setWidget_ (self & widget)
  end
