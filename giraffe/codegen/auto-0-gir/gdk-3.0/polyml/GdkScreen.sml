structure GdkScreen :>
  GDK_SCREEN
    where type 'a class_t = 'a GdkScreenClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t
    where type rectangle_record_t = GdkRectangleRecord.t
    where type 'a window_class_t = 'a GdkWindowClass.t
    where type 'a visual_class_t = 'a GdkVisualClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_screen_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgdk "gdk_screen_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val height_ = call (load_sym libgdk "gdk_screen_height") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val heightMm_ = call (load_sym libgdk "gdk_screen_height_mm") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val width_ = call (load_sym libgdk "gdk_screen_width") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val widthMm_ = call (load_sym libgdk "gdk_screen_width_mm") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val getActiveWindow_ = call (load_sym libgdk "gdk_screen_get_active_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDisplay_ = call (load_sym libgdk "gdk_screen_get_display") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFontOptions_ = call (load_sym libgdk "gdk_screen_get_font_options") (GObjectObjectClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cPtr)
      val getHeight_ = call (load_sym libgdk "gdk_screen_get_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getHeightMm_ = call (load_sym libgdk "gdk_screen_get_height_mm") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getMonitorAtPoint_ =
        call (load_sym libgdk "gdk_screen_get_monitor_at_point")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val getMonitorAtWindow_ = call (load_sym libgdk "gdk_screen_get_monitor_at_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getMonitorGeometry_ =
        call (load_sym libgdk "gdk_screen_get_monitor_geometry")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GdkRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getMonitorHeightMm_ = call (load_sym libgdk "gdk_screen_get_monitor_height_mm") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val getMonitorPlugName_ = call (load_sym libgdk "gdk_screen_get_monitor_plug_name") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getMonitorWidthMm_ = call (load_sym libgdk "gdk_screen_get_monitor_width_mm") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val getNMonitors_ = call (load_sym libgdk "gdk_screen_get_n_monitors") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getNumber_ = call (load_sym libgdk "gdk_screen_get_number") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPrimaryMonitor_ = call (load_sym libgdk "gdk_screen_get_primary_monitor") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getResolution_ = call (load_sym libgdk "gdk_screen_get_resolution") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getRgbaVisual_ = call (load_sym libgdk "gdk_screen_get_rgba_visual") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getRootWindow_ = call (load_sym libgdk "gdk_screen_get_root_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSetting_ =
        call (load_sym libgdk "gdk_screen_get_setting")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getSystemVisual_ = call (load_sym libgdk "gdk_screen_get_system_visual") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgdk "gdk_screen_get_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getWidthMm_ = call (load_sym libgdk "gdk_screen_get_width_mm") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val isComposited_ = call (load_sym libgdk "gdk_screen_is_composited") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val makeDisplayName_ = call (load_sym libgdk "gdk_screen_make_display_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setFontOptions_ = call (load_sym libgdk "gdk_screen_set_font_options") (GObjectObjectClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setResolution_ = call (load_sym libgdk "gdk_screen_set_resolution") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GdkScreenClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type rectangle_record_t = GdkRectangleRecord.t
    type 'a window_class_t = 'a GdkWindowClass.t
    type 'a visual_class_t = 'a GdkVisualClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkScreenClass.C.fromPtr false) getDefault_ ()
    fun height () = (I ---> FFI.Int.C.fromVal) height_ ()
    fun heightMm () = (I ---> FFI.Int.C.fromVal) heightMm_ ()
    fun width () = (I ---> FFI.Int.C.fromVal) width_ ()
    fun widthMm () = (I ---> FFI.Int.C.fromVal) widthMm_ ()
    fun getActiveWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr true) getActiveWindow_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getFontOptions self = (GObjectObjectClass.C.withPtr ---> CairoFontOptionsRecord.C.fromPtr false) getFontOptions_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getHeightMm self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeightMm_ self
    fun getMonitorAtPoint self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        getMonitorAtPoint_
        (
          self
           & x
           & y
        )
    fun getMonitorAtWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMonitorAtWindow_ (self & window)
    fun getMonitorGeometry self monitorNum =
      let
        val dest & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
          )
            getMonitorGeometry_
            (
              self
               & monitorNum
               & ()
            )
      in
        dest
      end
    fun getMonitorHeightMm self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) getMonitorHeightMm_ (self & monitorNum)
    fun getMonitorPlugName self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) getMonitorPlugName_ (self & monitorNum)
    fun getMonitorWidthMm self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) getMonitorWidthMm_ (self & monitorNum)
    fun getNMonitors self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNMonitors_ self
    fun getNumber self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNumber_ self
    fun getPrimaryMonitor self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getPrimaryMonitor_ self
    fun getResolution self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getResolution_ self
    fun getRgbaVisual self = (GObjectObjectClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getRgbaVisual_ self
    fun getRootWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getRootWindow_ self
    fun getSetting self name value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        getSetting_
        (
          self
           & name
           & value
        )
    fun getSystemVisual self = (GObjectObjectClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getSystemVisual_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun getWidthMm self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthMm_ self
    fun isComposited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isComposited_ self
    fun makeDisplayName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) makeDisplayName_ self
    fun setFontOptions self options = (GObjectObjectClass.C.withPtr &&&> CairoFontOptionsRecord.C.withOptPtr ---> I) setFontOptions_ (self & options)
    fun setResolution self dpi = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setResolution_ (self & dpi)
    local
      open ClosureMarshal Signal
    in
      fun compositedChangedSig f = signal "composited-changed" (void ---> ret_void) f
      fun monitorsChangedSig f = signal "monitors-changed" (void ---> ret_void) f
      fun sizeChangedSig f = signal "size-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val resolutionProp =
        {
          get = fn x => get "resolution" double x,
          set = fn x => set "resolution" double x
        }
    end
  end
