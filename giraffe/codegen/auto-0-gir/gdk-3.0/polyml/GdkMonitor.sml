structure GdkMonitor :>
  GDK_MONITOR
    where type 'a class = 'a GdkMonitorClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type subpixel_layout_t = GdkSubpixelLayout.t
    where type rectangle_t = GdkRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_monitor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_monitor_get_display") (GdkMonitorClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getGeometry_ = call (getSymbol "gdk_monitor_get_geometry") (GdkMonitorClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val getHeightMm_ = call (getSymbol "gdk_monitor_get_height_mm") (GdkMonitorClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getManufacturer_ = call (getSymbol "gdk_monitor_get_manufacturer") (GdkMonitorClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getModel_ = call (getSymbol "gdk_monitor_get_model") (GdkMonitorClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getRefreshRate_ = call (getSymbol "gdk_monitor_get_refresh_rate") (GdkMonitorClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getScaleFactor_ = call (getSymbol "gdk_monitor_get_scale_factor") (GdkMonitorClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSubpixelLayout_ = call (getSymbol "gdk_monitor_get_subpixel_layout") (GdkMonitorClass.PolyML.cPtr --> GdkSubpixelLayout.PolyML.cVal)
      val getWidthMm_ = call (getSymbol "gdk_monitor_get_width_mm") (GdkMonitorClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWorkarea_ = call (getSymbol "gdk_monitor_get_workarea") (GdkMonitorClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val isPrimary_ = call (getSymbol "gdk_monitor_is_primary") (GdkMonitorClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GdkMonitorClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type subpixel_layout_t = GdkSubpixelLayout.t
    type rectangle_t = GdkRectangleRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDisplay self = (GdkMonitorClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getGeometry self =
      let
        val geometry & () = (GdkMonitorClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getGeometry_ (self & ())
      in
        geometry
      end
    fun getHeightMm self = (GdkMonitorClass.FFI.withPtr ---> GInt.FFI.fromVal) getHeightMm_ self
    fun getManufacturer self = (GdkMonitorClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getManufacturer_ self
    fun getModel self = (GdkMonitorClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getModel_ self
    fun getRefreshRate self = (GdkMonitorClass.FFI.withPtr ---> GInt.FFI.fromVal) getRefreshRate_ self
    fun getScaleFactor self = (GdkMonitorClass.FFI.withPtr ---> GInt.FFI.fromVal) getScaleFactor_ self
    fun getSubpixelLayout self = (GdkMonitorClass.FFI.withPtr ---> GdkSubpixelLayout.FFI.fromVal) getSubpixelLayout_ self
    fun getWidthMm self = (GdkMonitorClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidthMm_ self
    fun getWorkarea self =
      let
        val workarea & () = (GdkMonitorClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getWorkarea_ (self & ())
      in
        workarea
      end
    fun isPrimary self = (GdkMonitorClass.FFI.withPtr ---> GBool.FFI.fromVal) isPrimary_ self
    local
      open ClosureMarshal Signal
    in
      fun invalidateSig f = signal "invalidate" (void ---> ret_void) f
    end
    local
      open Property
    in
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          new = fn x => new "display" GdkDisplayClass.tOpt x
        }
      val geometryProp = {get = fn x => get "geometry" GdkRectangleRecord.tOpt x}
      val heightMmProp = {get = fn x => get "height-mm" int x}
      val manufacturerProp = {get = fn x => get "manufacturer" stringOpt x}
      val modelProp = {get = fn x => get "model" stringOpt x}
      val refreshRateProp = {get = fn x => get "refresh-rate" int x}
      val scaleFactorProp = {get = fn x => get "scale-factor" int x}
      val subpixelLayoutProp = {get = fn x => get "subpixel-layout" GdkSubpixelLayout.t x}
      val widthMmProp = {get = fn x => get "width-mm" int x}
      val workareaProp = {get = fn x => get "workarea" GdkRectangleRecord.tOpt x}
    end
  end
