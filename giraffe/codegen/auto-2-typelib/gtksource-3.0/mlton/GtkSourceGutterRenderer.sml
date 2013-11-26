structure GtkSourceGutterRenderer :>
  GTK_SOURCE_GUTTER_RENDERER
    where type 'a class_t = 'a GtkSourceGutterRendererClass.t
    where type gutterrendererstate_t = GtkSourceGutterRendererState.t
    where type gutterrendereralignmentmode_t = GtkSourceGutterRendererAlignmentMode.t =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_get_type" : unit -> GObjectType.C.val_;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_activate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val begin_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_source_gutter_renderer_begin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val draw_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_source_gutter_renderer_draw" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkSourceGutterRendererState.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val end_ = _import "gtk_source_gutter_renderer_end" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.C.ref_
               * FFI.Float.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAlignmentMode_ = _import "gtk_source_gutter_renderer_get_alignment_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSourceGutterRendererAlignmentMode.C.val_;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_get_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSize_ = _import "gtk_source_gutter_renderer_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getView_ = _import "gtk_source_gutter_renderer_get_view" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getVisible_ = _import "gtk_source_gutter_renderer_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getWindowType_ = _import "gtk_source_gutter_renderer_get_window_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTextWindowType.C.val_;
    val queryActivatable_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_query_activatable" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val queryData_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_query_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkSourceGutterRendererState.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val queryTooltip_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_source_gutter_renderer_query_tooltip" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val queueDraw_ = _import "gtk_source_gutter_renderer_queue_draw" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlignmentMode_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_alignment_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSourceGutterRendererAlignmentMode.C.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkSourceGutterRendererClass.t
    type gutterrendererstate_t = GtkSourceGutterRendererState.t
    type gutterrendereralignmentmode_t = GtkSourceGutterRendererAlignmentMode.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self iter area event =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GdkEvent.C.withPtr
         ---> I
      )
        activate_
        (
          self
           & iter
           & area
           & event
        )
    fun begin self cr backgroundArea cellArea start end' =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        begin_
        (
          self
           & cr
           & backgroundArea
           & cellArea
           & start
           & end'
        )
    fun draw self cr backgroundArea cellArea start end' state =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkSourceGutterRendererState.C.withVal
         ---> I
      )
        draw_
        (
          self
           & cr
           & backgroundArea
           & cellArea
           & start
           & end'
           & state
        )
    fun end' self = (GObjectObjectClass.C.withPtr ---> I) end_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Float.C.withRefVal
             &&&> FFI.Float.C.withRefVal
             ---> FFI.Float.C.fromVal
                   && FFI.Float.C.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & FFI.Float.null
               & FFI.Float.null
            )
      in
        (xalign, yalign)
      end
    fun getAlignmentMode self = (GObjectObjectClass.C.withPtr ---> GtkSourceGutterRendererAlignmentMode.C.fromVal) getAlignmentMode_ self
    fun getBackground self =
      let
        val color & retVal = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME color else NONE
      end
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPadding_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (xpad, ypad)
      end
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ self
    fun getView self = (GObjectObjectClass.C.withPtr ---> GtkTextViewClass.C.fromPtr false) getView_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWindowType self = (GObjectObjectClass.C.withPtr ---> GtkTextWindowType.C.fromVal) getWindowType_ self
    fun queryActivatable self iter area event =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GdkEvent.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        queryActivatable_
        (
          self
           & iter
           & area
           & event
        )
    fun queryData self start end' state =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkSourceGutterRendererState.C.withVal
         ---> I
      )
        queryData_
        (
          self
           & start
           & end'
           & state
        )
    fun queryTooltip self iter area x y tooltip =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        queryTooltip_
        (
          self
           & iter
           & area
           & x
           & y
           & tooltip
        )
    fun queueDraw self = (GObjectObjectClass.C.withPtr ---> I) queueDraw_ self
    fun setAlignment self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setAlignmentMode self mode = (GObjectObjectClass.C.withPtr &&&> GtkSourceGutterRendererAlignmentMode.C.withVal ---> I) setAlignmentMode_ (self & mode)
    fun setBackground self color = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setBackground_ (self & color)
    fun setPadding self xpad ypad =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    fun setSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSize_ (self & size)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f =
        signal "activate"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 CairoRectangleIntRecord.t
             &&&> get 0w3 GdkEvent.t
             ---> ret_void
          )
          (
            fn
              iter
               & area
               & event =>
                f iter area event
          )
      fun queryActivatableSig f =
        signal "query-activatable"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 CairoRectangleIntRecord.t
             &&&> get 0w3 GdkEvent.t
             ---> ret boolean
          )
          (
            fn
              iter
               & area
               & event =>
                f iter area event
          )
      fun queryDataSig f =
        signal "query-data"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 GtkTextIterRecord.t
             &&&> get 0w3 GtkSourceGutterRendererState.t
             ---> ret_void
          )
          (
            fn
              start
               & end'
               & state =>
                f start end' state
          )
      fun queryTooltipSig f =
        signal "query-tooltip"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 CairoRectangleIntRecord.t
             &&&> get 0w3 int
             &&&> get 0w4 int
             &&&> get 0w5 GtkTooltipClass.t
             ---> ret boolean
          )
          (
            fn
              iter
               & area
               & x
               & y
               & tooltip =>
                f iter area x y tooltip
          )
      fun queueDrawSig f = signal "queue-draw" (void ---> ret_void) f
    end
    local
      open Property
    in
      val alignmentModeProp =
        {
          get = fn x => get "alignment-mode" GtkSourceGutterRendererAlignmentMode.t x,
          set = fn x => set "alignment-mode" GtkSourceGutterRendererAlignmentMode.t x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val sizeProp =
        {
          get = fn x => get "size" int x,
          set = fn x => set "size" int x
        }
      val viewProp = {get = fn x => get "view" GtkTextViewClass.tOpt x}
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
      val windowTypeProp = {get = fn x => get "window-type" GtkTextWindowType.t x}
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x
        }
    end
  end
