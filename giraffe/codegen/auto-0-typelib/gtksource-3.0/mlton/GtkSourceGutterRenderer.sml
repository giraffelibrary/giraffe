structure GtkSourceGutterRenderer :>
  GTK_SOURCE_GUTTER_RENDERER
    where type 'a class = 'a GtkSourceGutterRendererClass.class
    where type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    where type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_get_type" : unit -> GObjectType.FFI.val_;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_activate" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkEvent.FFI.notnull GdkEvent.FFI.p
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
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
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
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkSourceGutterRendererState.FFI.val_
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
    val end_ = _import "gtk_source_gutter_renderer_end" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_alignment" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAlignmentMode_ = _import "gtk_source_gutter_renderer_get_alignment_mode" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> GtkSourceGutterRendererAlignmentMode.FFI.val_;
    val getBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_get_background" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_get_padding" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSize_ = _import "gtk_source_gutter_renderer_get_size" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> GInt32.FFI.val_;
    val getView_ = _import "gtk_source_gutter_renderer_get_view" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> GtkTextViewClass.FFI.notnull GtkTextViewClass.FFI.p;
    val getVisible_ = _import "gtk_source_gutter_renderer_get_visible" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> GBool.FFI.val_;
    val getWindowType_ = _import "gtk_source_gutter_renderer_get_window_type" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> GtkTextWindowType.FFI.val_;
    val queryActivatable_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_gutter_renderer_query_activatable" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkEvent.FFI.notnull GdkEvent.FFI.p
               -> GBool.FFI.val_;
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
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkSourceGutterRendererState.FFI.val_
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
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val queueDraw_ = _import "gtk_source_gutter_renderer_queue_draw" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> unit;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_alignment" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlignmentMode_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_alignment_mode" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p * GtkSourceGutterRendererAlignmentMode.FFI.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_background" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_renderer_set_padding" :
              GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_size" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_source_gutter_renderer_set_visible" : GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceGutterRendererClass.class
    type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate
      self
      (
        iter,
        area,
        event
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         ---> I
      )
        activate_
        (
          self
           & iter
           & area
           & event
        )
    fun begin
      self
      (
        cr,
        backgroundArea,
        cellArea,
        start,
        end'
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
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
    fun draw
      self
      (
        cr,
        backgroundArea,
        cellArea,
        start,
        end',
        state
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkSourceGutterRendererState.FFI.withVal
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
    fun end' self = (GtkSourceGutterRendererClass.FFI.withPtr ---> I) end_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkSourceGutterRendererClass.FFI.withPtr
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getAlignmentMode self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GtkSourceGutterRendererAlignmentMode.FFI.fromVal) getAlignmentMode_ self
    fun getBackground self =
      let
        val color & retVal = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME color else NONE
      end
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GtkSourceGutterRendererClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPadding_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (xpad, ypad)
      end
    fun getSize self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun getView self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GtkTextViewClass.FFI.fromPtr false) getView_ self
    fun getVisible self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun getWindowType self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GtkTextWindowType.FFI.fromVal) getWindowType_ self
    fun queryActivatable
      self
      (
        iter,
        area,
        event
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        queryActivatable_
        (
          self
           & iter
           & area
           & event
        )
    fun queryData
      self
      (
        start,
        end',
        state
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkSourceGutterRendererState.FFI.withVal
         ---> I
      )
        queryData_
        (
          self
           & start
           & end'
           & state
        )
    fun queryTooltip
      self
      (
        iter,
        area,
        x,
        y,
        tooltip
      ) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkTooltipClass.FFI.withPtr
         ---> GBool.FFI.fromVal
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
    fun queueDraw self = (GtkSourceGutterRendererClass.FFI.withPtr ---> I) queueDraw_ self
    fun setAlignment self (xalign, yalign) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setAlignmentMode self mode = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GtkSourceGutterRendererAlignmentMode.FFI.withVal ---> I) setAlignmentMode_ (self & mode)
    fun setBackground self color = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setBackground_ (self & color)
    fun setPadding self (xpad, ypad) =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    fun setSize self size = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSize_ (self & size)
    fun setVisible self visible = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f =
        signal "activate"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 GdkRectangleRecord.t
             &&&> get 0w3 GdkEvent.t
             ---> ret_void
          )
          (
            fn
              iter
               & area
               & event =>
                f
                  (
                    iter,
                    area,
                    event
                  )
          )
      fun queryActivatableSig f =
        signal "query-activatable"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 GdkRectangleRecord.t
             &&&> get 0w3 GdkEvent.t
             ---> ret boolean
          )
          (
            fn
              iter
               & area
               & event =>
                f
                  (
                    iter,
                    area,
                    event
                  )
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
                f
                  (
                    start,
                    end',
                    state
                  )
          )
      fun queryTooltipSig f =
        signal "query-tooltip"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 GdkRectangleRecord.t
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
                f
                  (
                    iter,
                    area,
                    x,
                    y,
                    tooltip
                  )
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
