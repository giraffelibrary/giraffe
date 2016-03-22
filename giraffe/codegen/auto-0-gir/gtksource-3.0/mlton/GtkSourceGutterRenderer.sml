structure GtkSourceGutterRenderer :>
  GTK_SOURCE_GUTTER_RENDERER
    where type 'a class = 'a GtkSourceGutterRendererClass.class
    where type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    where type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t =
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
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
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
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
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
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
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
    val end_ = _import "gtk_source_gutter_renderer_end" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_alignment" :
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Float.C.ref_
               * FFI.Float.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAlignmentMode_ = _import "gtk_source_gutter_renderer_get_alignment_mode" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> GtkSourceGutterRendererAlignmentMode.C.val_;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_get_background" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_padding" :
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSize_ = _import "gtk_source_gutter_renderer_get_size" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> FFI.Int.C.val_;
    val getView_ = _import "gtk_source_gutter_renderer_get_view" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> GtkTextViewClass.C.notnull GtkTextViewClass.C.p;
    val getVisible_ = _import "gtk_source_gutter_renderer_get_visible" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> FFI.Bool.C.val_;
    val getWindowType_ = _import "gtk_source_gutter_renderer_get_window_type" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> GtkTextWindowType.C.val_;
    val queryActivatable_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_query_activatable" :
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
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
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
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
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * GtkTooltipClass.C.notnull GtkTooltipClass.C.p
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
    val queueDraw_ = _import "gtk_source_gutter_renderer_queue_draw" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> unit;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_alignment" :
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlignmentMode_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_alignment_mode" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p * GtkSourceGutterRendererAlignmentMode.C.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_background" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_padding" :
              GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_size" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_visible" : GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceGutterRendererClass.class
    type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self iter area event =
      (
        GtkSourceGutterRendererClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
        GtkSourceGutterRendererClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
        GtkSourceGutterRendererClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
    fun end' self = (GtkSourceGutterRendererClass.C.withPtr ---> I) end_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkSourceGutterRendererClass.C.withPtr
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
    fun getAlignmentMode self = (GtkSourceGutterRendererClass.C.withPtr ---> GtkSourceGutterRendererAlignmentMode.C.fromVal) getAlignmentMode_ self
    fun getBackground self =
      let
        val color & retVal = (GtkSourceGutterRendererClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME color else NONE
      end
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GtkSourceGutterRendererClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPadding_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (xpad, ypad)
      end
    fun getSize self = (GtkSourceGutterRendererClass.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getView self = (GtkSourceGutterRendererClass.C.withPtr ---> GtkTextViewClass.C.fromPtr false) getView_ self
    fun getVisible self = (GtkSourceGutterRendererClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWindowType self = (GtkSourceGutterRendererClass.C.withPtr ---> GtkTextWindowType.C.fromVal) getWindowType_ self
    fun queryActivatable self iter area event =
      (
        GtkSourceGutterRendererClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
        GtkSourceGutterRendererClass.C.withPtr
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
        GtkSourceGutterRendererClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GtkTooltipClass.C.withPtr
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
    fun queueDraw self = (GtkSourceGutterRendererClass.C.withPtr ---> I) queueDraw_ self
    fun setAlignment self xalign yalign =
      (
        GtkSourceGutterRendererClass.C.withPtr
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
    fun setAlignmentMode self mode = (GtkSourceGutterRendererClass.C.withPtr &&&> GtkSourceGutterRendererAlignmentMode.C.withVal ---> I) setAlignmentMode_ (self & mode)
    fun setBackground self color = (GtkSourceGutterRendererClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setBackground_ (self & color)
    fun setPadding self xpad ypad =
      (
        GtkSourceGutterRendererClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    fun setSize self size = (GtkSourceGutterRendererClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
    fun setVisible self visible = (GtkSourceGutterRendererClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
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
