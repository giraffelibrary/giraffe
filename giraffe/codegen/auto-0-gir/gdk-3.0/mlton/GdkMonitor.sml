structure GdkMonitor :>
  GDK_MONITOR
    where type 'a class = 'a GdkMonitorClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type subpixel_layout_t = GdkSubpixelLayout.t
    where type rectangle_t = GdkRectangleRecord.t =
  struct
    val getType_ = _import "gdk_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val getDisplay_ = _import "gdk_monitor_get_display" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p;
    val getGeometry_ = fn x1 & x2 => (_import "gdk_monitor_get_geometry" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getHeightMm_ = _import "gdk_monitor_get_height_mm" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GInt.FFI.val_;
    val getManufacturer_ = _import "gdk_monitor_get_manufacturer" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getModel_ = _import "gdk_monitor_get_model" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getRefreshRate_ = _import "gdk_monitor_get_refresh_rate" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GInt.FFI.val_;
    val getScaleFactor_ = _import "gdk_monitor_get_scale_factor" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GInt.FFI.val_;
    val getSubpixelLayout_ = _import "gdk_monitor_get_subpixel_layout" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GdkSubpixelLayout.FFI.val_;
    val getWidthMm_ = _import "gdk_monitor_get_width_mm" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GInt.FFI.val_;
    val getWorkarea_ = fn x1 & x2 => (_import "gdk_monitor_get_workarea" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val isPrimary_ = _import "gdk_monitor_is_primary" : GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GdkMonitorClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type subpixel_layout_t = GdkSubpixelLayout.t
    type rectangle_t = GdkRectangleRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDisplay self = (GdkMonitorClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self before GdkMonitorClass.FFI.touchPtr self
    fun getGeometry self =
      let
        val geometry & () = (GdkMonitorClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getGeometry_ (self & ())
      in
        geometry
      end
    fun getHeightMm self = (GdkMonitorClass.FFI.withPtr false ---> GInt.FFI.fromVal) getHeightMm_ self
    fun getManufacturer self = (GdkMonitorClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getManufacturer_ self before GdkMonitorClass.FFI.touchPtr self
    fun getModel self = (GdkMonitorClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getModel_ self before GdkMonitorClass.FFI.touchPtr self
    fun getRefreshRate self = (GdkMonitorClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRefreshRate_ self
    fun getScaleFactor self = (GdkMonitorClass.FFI.withPtr false ---> GInt.FFI.fromVal) getScaleFactor_ self
    fun getSubpixelLayout self = (GdkMonitorClass.FFI.withPtr false ---> GdkSubpixelLayout.FFI.fromVal) getSubpixelLayout_ self
    fun getWidthMm self = (GdkMonitorClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidthMm_ self
    fun getWorkarea self =
      let
        val workarea & () = (GdkMonitorClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getWorkarea_ (self & ())
      in
        workarea
      end
    fun isPrimary self = (GdkMonitorClass.FFI.withPtr false ---> GBool.FFI.fromVal) isPrimary_ self
    local
      open ClosureMarshal Signal
    in
      fun invalidateSig f = signal "invalidate" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val displayProp =
        {
          name = "display",
          gtype = fn () => C.gtype GdkDisplayClass.tOpt (),
          get = fn x => fn () => C.get GdkDisplayClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDisplayClass.tOpt x
        }
      val geometryProp =
        {
          name = "geometry",
          gtype = fn () => C.gtype GdkRectangleRecord.tOpt (),
          get = fn x => fn () => C.get GdkRectangleRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val heightMmProp =
        {
          name = "height-mm",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val manufacturerProp =
        {
          name = "manufacturer",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val modelProp =
        {
          name = "model",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val refreshRateProp =
        {
          name = "refresh-rate",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val scaleFactorProp =
        {
          name = "scale-factor",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val subpixelLayoutProp =
        {
          name = "subpixel-layout",
          gtype = fn () => C.gtype GdkSubpixelLayout.t (),
          get = fn x => fn () => C.get GdkSubpixelLayout.t x,
          set = ignore,
          init = ignore
        }
      val widthMmProp =
        {
          name = "width-mm",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val workareaProp =
        {
          name = "workarea",
          gtype = fn () => C.gtype GdkRectangleRecord.tOpt (),
          get = fn x => fn () => C.get GdkRectangleRecord.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
