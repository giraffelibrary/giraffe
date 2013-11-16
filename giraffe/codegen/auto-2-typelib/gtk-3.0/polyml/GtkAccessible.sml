structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class_t = 'a GtkAccessibleClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accessible_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val connectWidgetDestroyed_ = call (load_sym libgtk "gtk_accessible_connect_widget_destroyed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getWidget_ = call (load_sym libgtk "gtk_accessible_get_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setWidget_ = call (load_sym libgtk "gtk_accessible_set_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAccessibleClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun connectWidgetDestroyed self = (GObjectObjectClass.C.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setWidget_ (self & widget)
  end
