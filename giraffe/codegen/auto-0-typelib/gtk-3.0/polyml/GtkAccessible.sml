structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accessible_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val connectWidgetDestroyed_ = call (load_sym libgtk "gtk_accessible_connect_widget_destroyed") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getWidget_ = call (load_sym libgtk "gtk_accessible_get_widget") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setWidget_ = call (load_sym libgtk "gtk_accessible_set_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun connectWidgetDestroyed self = (GObjectObjectClass.C.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setWidget_ (self & widget)
  end
