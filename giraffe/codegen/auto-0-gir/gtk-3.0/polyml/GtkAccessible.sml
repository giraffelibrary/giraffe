structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val connectWidgetDestroyed_ = call (getSymbol "gtk_accessible_connect_widget_destroyed") (GtkAccessibleClass.PolyML.cPtr --> cVoid)
      val getWidget_ = call (getSymbol "gtk_accessible_get_widget") (GtkAccessibleClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val setWidget_ = call (getSymbol "gtk_accessible_set_widget") (GtkAccessibleClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun connectWidgetDestroyed self = (GtkAccessibleClass.FFI.withPtr false ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GtkAccessibleClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getWidget_ self before GtkAccessibleClass.FFI.touchPtr self
    fun setWidget self widget = (GtkAccessibleClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setWidget_ (self & widget)
    local
      open ValueAccessor
    in
      val widgetProp =
        {
          name = "widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
    end
  end
