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
      val getType_ = call (load_sym libgtk "gtk_viewport_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_viewport_new") (GtkAdjustmentClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getBinWindow_ = call (load_sym libgtk "gtk_viewport_get_bin_window") (GtkViewportClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getShadowType_ = call (load_sym libgtk "gtk_viewport_get_shadow_type") (GtkViewportClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getViewWindow_ = call (load_sym libgtk "gtk_viewport_get_view_window") (GtkViewportClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val setShadowType_ = call (load_sym libgtk "gtk_viewport_set_shadow_type") (GtkViewportClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkViewportClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GtkAdjustmentClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> GtkViewportClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkViewportClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getShadowType self = (GtkViewportClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getViewWindow self = (GtkViewportClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getViewWindow_ self
    fun setShadowType self type' = (GtkViewportClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    local
      open Property
    in
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
    end
  end
