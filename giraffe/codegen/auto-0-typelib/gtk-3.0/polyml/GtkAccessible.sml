structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accessible_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val connectWidgetDestroyed_ = call (load_sym libgtk "gtk_accessible_connect_widget_destroyed") (GtkAccessibleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getWidget_ = call (load_sym libgtk "gtk_accessible_get_widget") (GtkAccessibleClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setWidget_ = call (load_sym libgtk "gtk_accessible_set_widget") (GtkAccessibleClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun connectWidgetDestroyed self = (GtkAccessibleClass.C.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GtkAccessibleClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setWidget self widget = (GtkAccessibleClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setWidget_ (self & widget)
  end
