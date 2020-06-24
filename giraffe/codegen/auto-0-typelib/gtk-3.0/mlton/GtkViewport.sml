structure GtkViewport :>
  GTK_VIEWPORT
    where type 'a class = 'a GtkViewportClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type shadow_type_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_viewport_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_viewport_new" : GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_viewport_get_bin_window" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getHadjustment_ = _import "gtk_viewport_get_hadjustment" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getShadowType_ = _import "gtk_viewport_get_shadow_type" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p -> GtkShadowType.FFI.val_;
    val getVadjustment_ = _import "gtk_viewport_get_vadjustment" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getViewWindow_ = _import "gtk_viewport_get_view_window" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_viewport_set_hadjustment" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setShadowType_ = fn x1 & x2 => (_import "gtk_viewport_set_shadow_type" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p * GtkShadowType.FFI.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_viewport_set_vadjustment" : GtkViewportClass.FFI.non_opt GtkViewportClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkViewportClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hadjustment, vadjustment) = (GtkAdjustmentClass.FFI.withOptPtr &&&> GtkAdjustmentClass.FFI.withOptPtr ---> GtkViewportClass.FFI.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkViewportClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getHadjustment self = (GtkViewportClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getShadowType self = (GtkViewportClass.FFI.withPtr ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getVadjustment self = (GtkViewportClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun getViewWindow self = (GtkViewportClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getViewWindow_ self
    fun setHadjustment self adjustment = (GtkViewportClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withOptPtr ---> I) setHadjustment_ (self & adjustment)
    fun setShadowType self type' = (GtkViewportClass.FFI.withPtr &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self adjustment = (GtkViewportClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withOptPtr ---> I) setVadjustment_ (self & adjustment)
    local
      open Property
    in
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x,
          new = fn x => new "shadow-type" GtkShadowType.t x
        }
    end
  end
