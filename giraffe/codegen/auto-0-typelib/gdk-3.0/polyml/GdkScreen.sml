structure GdkScreen :>
  GDK_SCREEN
    where type 'a class_t = 'a GdkScreenClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t
    where type 'a window_class_t = 'a GdkWindowClass.t
    where type 'a visual_class_t = 'a GdkVisualClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_screen_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgdk "gdk_screen_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val height_ = call (load_sym libgdk "gdk_screen_height") (FFI.PolyML.VOID --> FFI.Int32.PolyML.VAL)
      val heightMm_ = call (load_sym libgdk "gdk_screen_height_mm") (FFI.PolyML.VOID --> FFI.Int32.PolyML.VAL)
      val width_ = call (load_sym libgdk "gdk_screen_width") (FFI.PolyML.VOID --> FFI.Int32.PolyML.VAL)
      val widthMm_ = call (load_sym libgdk "gdk_screen_width_mm") (FFI.PolyML.VOID --> FFI.Int32.PolyML.VAL)
      val getActiveWindow_ = call (load_sym libgdk "gdk_screen_get_active_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDisplay_ = call (load_sym libgdk "gdk_screen_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFontOptions_ = call (load_sym libgdk "gdk_screen_get_font_options") (GObjectObjectClass.PolyML.PTR --> CairoFontOptionsRecord.PolyML.PTR)
      val getHeight_ = call (load_sym libgdk "gdk_screen_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getHeightMm_ = call (load_sym libgdk "gdk_screen_get_height_mm") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getMonitorAtPoint_ =
        call (load_sym libgdk "gdk_screen_get_monitor_at_point")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val getMonitorAtWindow_ = call (load_sym libgdk "gdk_screen_get_monitor_at_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getMonitorGeometry_ =
        call (load_sym libgdk "gdk_screen_get_monitor_geometry")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getMonitorHeightMm_ = call (load_sym libgdk "gdk_screen_get_monitor_height_mm") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Int32.PolyML.VAL)
      val getMonitorPlugName_ = call (load_sym libgdk "gdk_screen_get_monitor_plug_name") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val getMonitorWidthMm_ = call (load_sym libgdk "gdk_screen_get_monitor_width_mm") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Int32.PolyML.VAL)
      val getNMonitors_ = call (load_sym libgdk "gdk_screen_get_n_monitors") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNumber_ = call (load_sym libgdk "gdk_screen_get_number") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPrimaryMonitor_ = call (load_sym libgdk "gdk_screen_get_primary_monitor") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getResolution_ = call (load_sym libgdk "gdk_screen_get_resolution") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getRgbaVisual_ = call (load_sym libgdk "gdk_screen_get_rgba_visual") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getRootWindow_ = call (load_sym libgdk "gdk_screen_get_root_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSetting_ =
        call (load_sym libgdk "gdk_screen_get_setting")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val getSystemVisual_ = call (load_sym libgdk "gdk_screen_get_system_visual") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgdk "gdk_screen_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getWidthMm_ = call (load_sym libgdk "gdk_screen_get_width_mm") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val isComposited_ = call (load_sym libgdk "gdk_screen_is_composited") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val makeDisplayName_ = call (load_sym libgdk "gdk_screen_make_display_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val setFontOptions_ = call (load_sym libgdk "gdk_screen_set_font_options") (GObjectObjectClass.PolyML.PTR &&> CairoFontOptionsRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setResolution_ = call (load_sym libgdk "gdk_screen_set_resolution") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkScreenClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type 'a window_class_t = 'a GdkWindowClass.t
    type 'a visual_class_t = 'a GdkVisualClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkScreenClass.C.fromPtr false) getDefault_ ()
    fun height () = (I ---> FFI.Int32.C.fromVal) height_ ()
    fun heightMm () = (I ---> FFI.Int32.C.fromVal) heightMm_ ()
    fun width () = (I ---> FFI.Int32.C.fromVal) width_ ()
    fun widthMm () = (I ---> FFI.Int32.C.fromVal) widthMm_ ()
    fun getActiveWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr true) getActiveWindow_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getFontOptions self = (GObjectObjectClass.C.withPtr ---> CairoFontOptionsRecord.C.fromPtr false) getFontOptions_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getHeightMm self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeightMm_ self
    fun getMonitorAtPoint self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getMonitorAtPoint_
        (
          self
           & x
           & y
        )
    fun getMonitorAtWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMonitorAtWindow_ (self & window)
    fun getMonitorGeometry self monitorNum =
      let
        val dest & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun getMonitorHeightMm self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getMonitorHeightMm_ (self & monitorNum)
    fun getMonitorPlugName self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr true) getMonitorPlugName_ (self & monitorNum)
    fun getMonitorWidthMm self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getMonitorWidthMm_ (self & monitorNum)
    fun getNMonitors self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNMonitors_ self
    fun getNumber self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNumber_ self
    fun getPrimaryMonitor self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPrimaryMonitor_ self
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
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getWidthMm self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidthMm_ self
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
