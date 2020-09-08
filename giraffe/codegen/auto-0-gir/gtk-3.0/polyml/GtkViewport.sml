structure GtkViewport :>
  GTK_VIEWPORT
    where type 'a class = 'a GtkViewportClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_viewport_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_viewport_new") (GtkAdjustmentClass.PolyML.cOptPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getBinWindow_ = call (getSymbol "gtk_viewport_get_bin_window") (GtkViewportClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getHadjustment_ = call (getSymbol "gtk_viewport_get_hadjustment") (GtkViewportClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getShadowType_ = call (getSymbol "gtk_viewport_get_shadow_type") (GtkViewportClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getVadjustment_ = call (getSymbol "gtk_viewport_get_vadjustment") (GtkViewportClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getViewWindow_ = call (getSymbol "gtk_viewport_get_view_window") (GtkViewportClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val setHadjustment_ = call (getSymbol "gtk_viewport_set_hadjustment") (GtkViewportClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setShadowType_ = call (getSymbol "gtk_viewport_set_shadow_type") (GtkViewportClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> cVoid)
      val setVadjustment_ = call (getSymbol "gtk_viewport_set_vadjustment") (GtkViewportClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkViewportClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hadjustment, vadjustment) = (GtkAdjustmentClass.FFI.withOptPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> GtkViewportClass.FFI.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkViewportClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getHadjustment self = (GtkViewportClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getShadowType self = (GtkViewportClass.FFI.withPtr false ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getVadjustment self = (GtkViewportClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun getViewWindow self = (GtkViewportClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getViewWindow_ self
    fun setHadjustment self adjustment = (GtkViewportClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & adjustment)
    fun setShadowType self type' = (GtkViewportClass.FFI.withPtr false &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self adjustment = (GtkViewportClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & adjustment)
    local
      open ValueAccessor
    in
      val shadowTypeProp =
        {
          name = "shadow-type",
          gtype = fn () => C.gtype GtkShadowType.t (),
          get = fn x => fn () => C.get GtkShadowType.t x,
          set = fn x => C.set GtkShadowType.t x,
          init = fn x => C.set GtkShadowType.t x
        }
    end
  end
