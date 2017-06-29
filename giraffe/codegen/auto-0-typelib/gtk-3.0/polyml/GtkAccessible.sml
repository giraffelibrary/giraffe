structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accessible_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val connectWidgetDestroyed_ = call (getSymbol "gtk_accessible_connect_widget_destroyed") (GtkAccessibleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getWidget_ = call (getSymbol "gtk_accessible_get_widget") (GtkAccessibleClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setWidget_ = call (getSymbol "gtk_accessible_set_widget") (GtkAccessibleClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun connectWidgetDestroyed self = (GtkAccessibleClass.FFI.withPtr ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GtkAccessibleClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun setWidget self widget = (GtkAccessibleClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setWidget_ (self & widget)
  end
