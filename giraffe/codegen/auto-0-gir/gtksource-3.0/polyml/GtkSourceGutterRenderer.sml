structure GtkSourceGutterRenderer :>
  GTK_SOURCE_GUTTER_RENDERER
    where type 'a class_t = 'a GtkSourceGutterRendererClass.t
    where type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    where type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val activate_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_activate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val begin_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_begin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val draw_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_draw")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkSourceGutterRendererState.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val end_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_end") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAlignment_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_alignment")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cRef
             &&> FFI.Float.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getAlignmentMode_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_alignment_mode") (GObjectObjectClass.PolyML.cPtr --> GtkSourceGutterRendererAlignmentMode.PolyML.cVal)
      val getBackground_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_background") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_padding")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getSize_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getView_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_view") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getVisible_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWindowType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_window_type") (GObjectObjectClass.PolyML.cPtr --> GtkTextWindowType.PolyML.cVal)
      val queryActivatable_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_activatable")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val queryData_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_data")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkSourceGutterRendererState.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val queryTooltip_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_tooltip")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val queueDraw_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_queue_draw") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAlignment_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_alignment")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAlignmentMode_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_alignment_mode") (GObjectObjectClass.PolyML.cPtr &&> GtkSourceGutterRendererAlignmentMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackground_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_background") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_padding")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setSize_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVisible_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkSourceGutterRendererClass.t
    type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self iter area event =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getView self = (GObjectObjectClass.C.withPtr ---> GtkTextViewClass.C.fromPtr false) getView_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWindowType self = (GObjectObjectClass.C.withPtr ---> GtkTextWindowType.C.fromVal) getWindowType_ self
    fun queryActivatable self iter area event =
      (
        GObjectObjectClass.C.withPtr
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
         &&&> GdkRectangleRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
    fun setSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
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
