structure GdkScreen :>
  GDK_SCREEN
    where type 'a class_t = 'a GdkScreenClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t
    where type rectanglerecord_t = GdkRectangleRecord.t
    where type 'a windowclass_t = 'a GdkWindowClass.t
    where type 'a visualclass_t = 'a GdkVisualClass.t =
  struct
    val getType_ = _import "gdk_screen_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "gdk_screen_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val height_ = _import "gdk_screen_height" : unit -> FFI.Int.C.val_;
    val heightMm_ = _import "gdk_screen_height_mm" : unit -> FFI.Int.C.val_;
    val width_ = _import "gdk_screen_width" : unit -> FFI.Int.C.val_;
    val widthMm_ = _import "gdk_screen_width_mm" : unit -> FFI.Int.C.val_;
    val getActiveWindow_ = _import "gdk_screen_get_active_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDisplay_ = _import "gdk_screen_get_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFontOptions_ = _import "gdk_screen_get_font_options" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoFontOptionsRecord.C.notnull CairoFontOptionsRecord.C.p;
    val getHeight_ = _import "gdk_screen_get_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getHeightMm_ = _import "gdk_screen_get_height_mm" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getMonitorAtPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_screen_get_monitor_at_point" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorAtWindow_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_at_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val getMonitorGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_screen_get_monitor_geometry" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorHeightMm_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_height_mm" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val getMonitorPlugName_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_plug_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getMonitorWidthMm_ = fn x1 & x2 => (_import "gdk_screen_get_monitor_width_mm" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val getNMonitors_ = _import "gdk_screen_get_n_monitors" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getNumber_ = _import "gdk_screen_get_number" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getPrimaryMonitor_ = _import "gdk_screen_get_primary_monitor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getResolution_ = _import "gdk_screen_get_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getRgbaVisual_ = _import "gdk_screen_get_rgba_visual" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getRootWindow_ = _import "gdk_screen_get_root_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSetting_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gdk_screen_get_setting" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSystemVisual_ = _import "gdk_screen_get_system_visual" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getWidth_ = _import "gdk_screen_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getWidthMm_ = _import "gdk_screen_get_width_mm" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val isComposited_ = _import "gdk_screen_is_composited" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val makeDisplayName_ = _import "gdk_screen_make_display_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val setFontOptions_ = fn x1 & x2 => (_import "gdk_screen_set_font_options" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit CairoFontOptionsRecord.C.p -> unit;) (x1, x2)
    val setResolution_ = fn x1 & x2 => (_import "gdk_screen_set_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GdkScreenClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type rectanglerecord_t = GdkRectangleRecord.t
    type 'a windowclass_t = 'a GdkWindowClass.t
    type 'a visualclass_t = 'a GdkVisualClass.t
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
    fun getMonitorPlugName self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr true) getMonitorPlugName_ (self & monitorNum)
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
         &&&> FFI.String.C.withConstPtr
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
    fun makeDisplayName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) makeDisplayName_ self
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
