structure GtkViewport :>
  GTK_VIEWPORT
    where type 'a class = 'a GtkViewportClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type shadow_type_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_viewport_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_viewport_new" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_viewport_get_bin_window" : GtkViewportClass.C.notnull GtkViewportClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getShadowType_ = _import "gtk_viewport_get_shadow_type" : GtkViewportClass.C.notnull GtkViewportClass.C.p -> GtkShadowType.C.val_;
    val getViewWindow_ = _import "gtk_viewport_get_view_window" : GtkViewportClass.C.notnull GtkViewportClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val setShadowType_ = fn x1 & x2 => (_import "gtk_viewport_set_shadow_type" : GtkViewportClass.C.notnull GtkViewportClass.C.p * GtkShadowType.C.val_ -> unit;) (x1, x2)
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
