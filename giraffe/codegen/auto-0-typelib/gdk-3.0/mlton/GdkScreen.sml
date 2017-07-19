structure GdkScreen :>
  GDK_SCREEN
    where type 'a class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a visual_class = 'a GdkVisualClass.class =
  struct
    val getType_ = _import "gdk_screen_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "gdk_screen_get_default" : unit -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;
    val height_ = _import "gdk_screen_height" : unit -> GInt32.FFI.val_;
    val heightMm_ = _import "gdk_screen_height_mm" : unit -> GInt32.FFI.val_;
    val width_ = _import "gdk_screen_width" : unit -> GInt32.FFI.val_;
    val widthMm_ = _import "gdk_screen_width_mm" : unit -> GInt32.FFI.val_;
    val getActiveWindow_ = _import "gdk_screen_get_active_window" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getDisplay_ = _import "gdk_screen_get_display" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getFontOptions_ = _import "gdk_screen_get_font_options" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> CairoFontOptionsRecord.FFI.notnull CairoFontOptionsRecord.FFI.p;
    val getHeight_ = _import "gdk_screen_get_height" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getHeightMm_ = _import "gdk_screen_get_height_mm" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getMonitorAtPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_screen_get_monitor_at_point" :
              GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorAtWindow_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_at_window" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getMonitorGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_screen_get_monitor_geometry" :
              GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p
               * GInt32.FFI.val_
               * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorHeightMm_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_height_mm" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val getMonitorPlugName_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_plug_name" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getMonitorWidthMm_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_width_mm" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val getNMonitors_ = _import "gdk_screen_get_n_monitors" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getNumber_ = _import "gdk_screen_get_number" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getPrimaryMonitor_ = _import "gdk_screen_get_primary_monitor" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getResolution_ = _import "gdk_screen_get_resolution" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GDouble.FFI.val_;
    val getRgbaVisual_ = _import "gdk_screen_get_rgba_visual" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GdkVisualClass.FFI.notnull GdkVisualClass.FFI.p;
    val getRootWindow_ = _import "gdk_screen_get_root_window" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getSetting_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gdk_screen_get_setting" :
              GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSystemVisual_ = _import "gdk_screen_get_system_visual" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GdkVisualClass.FFI.notnull GdkVisualClass.FFI.p;
    val getWidth_ = _import "gdk_screen_get_width" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val getWidthMm_ = _import "gdk_screen_get_width_mm" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GInt32.FFI.val_;
    val isComposited_ = _import "gdk_screen_is_composited" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GBool.FFI.val_;
    val makeDisplayName_ = _import "gdk_screen_make_display_name" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setFontOptions_ = fn x1 & x2 => (_import "gdk_screen_set_font_options" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * unit CairoFontOptionsRecord.FFI.p -> unit;) (x1, x2)
    val setResolution_ = fn x1 & x2 => (_import "gdk_screen_set_resolution" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type 'a visual_class = 'a GdkVisualClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkScreenClass.FFI.fromPtr false) getDefault_ ()
    fun height () = (I ---> GInt32.FFI.fromVal) height_ ()
    fun heightMm () = (I ---> GInt32.FFI.fromVal) heightMm_ ()
    fun width () = (I ---> GInt32.FFI.fromVal) width_ ()
    fun widthMm () = (I ---> GInt32.FFI.fromVal) widthMm_ ()
    fun getActiveWindow self = (GdkScreenClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr true) getActiveWindow_ self
    fun getDisplay self = (GdkScreenClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getFontOptions self = (GdkScreenClass.FFI.withPtr ---> CairoFontOptionsRecord.FFI.fromPtr false) getFontOptions_ self
    fun getHeight self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getHeightMm self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeightMm_ self
    fun getMonitorAtPoint self (x, y) =
      (
        GdkScreenClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getMonitorAtPoint_
        (
          self
           & x
           & y
        )
    fun getMonitorAtWindow self window = (GdkScreenClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMonitorAtWindow_ (self & window)
    fun getMonitorGeometry self monitorNum =
      let
        val dest & () =
          (
            GdkScreenClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> CairoRectangleIntRecord.FFI.withNewPtr
             ---> CairoRectangleIntRecord.FFI.fromPtr true && I
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
    fun getMonitorHeightMm self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getMonitorHeightMm_ (self & monitorNum)
    fun getMonitorPlugName self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) getMonitorPlugName_ (self & monitorNum)
    fun getMonitorWidthMm self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getMonitorWidthMm_ (self & monitorNum)
    fun getNMonitors self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNMonitors_ self
    fun getNumber self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNumber_ self
    fun getPrimaryMonitor self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getPrimaryMonitor_ self
    fun getResolution self = (GdkScreenClass.FFI.withPtr ---> GDouble.FFI.fromVal) getResolution_ self
    fun getRgbaVisual self = (GdkScreenClass.FFI.withPtr ---> GdkVisualClass.FFI.fromPtr false) getRgbaVisual_ self
    fun getRootWindow self = (GdkScreenClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getRootWindow_ self
    fun getSetting self (name, value) =
      (
        GdkScreenClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        getSetting_
        (
          self
           & name
           & value
        )
    fun getSystemVisual self = (GdkScreenClass.FFI.withPtr ---> GdkVisualClass.FFI.fromPtr false) getSystemVisual_ self
    fun getWidth self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWidthMm self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidthMm_ self
    fun isComposited self = (GdkScreenClass.FFI.withPtr ---> GBool.FFI.fromVal) isComposited_ self
    fun makeDisplayName self = (GdkScreenClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) makeDisplayName_ self
    fun setFontOptions self options = (GdkScreenClass.FFI.withPtr &&&> CairoFontOptionsRecord.FFI.withOptPtr ---> I) setFontOptions_ (self & options)
    fun setResolution self dpi = (GdkScreenClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setResolution_ (self & dpi)
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
