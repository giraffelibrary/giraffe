structure GtkViewport :>
  GTK_VIEWPORT
    where type 'a class_t = 'a GtkViewportClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a scrollable_class_t = 'a GtkScrollableClass.t
    where type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_viewport_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_viewport_new") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBinWindow_ = call (load_sym libgtk "gtk_viewport_get_bin_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getShadowType_ = call (load_sym libgtk "gtk_viewport_get_shadow_type") (GObjectObjectClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getViewWindow_ = call (load_sym libgtk "gtk_viewport_get_view_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setShadowType_ = call (load_sym libgtk "gtk_viewport_set_shadow_type") (GObjectObjectClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkViewportClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a scrollable_class_t = 'a GtkScrollableClass.t
    type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    type shadow_type_t = GtkShadowType.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkViewportClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getShadowType self = (GObjectObjectClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getViewWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getViewWindow_ self
    fun setShadowType self type' = (GObjectObjectClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
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
