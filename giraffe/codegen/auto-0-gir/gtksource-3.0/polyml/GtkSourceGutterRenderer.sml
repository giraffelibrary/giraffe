structure GtkSourceGutterRenderer :>
  GTK_SOURCE_GUTTER_RENDERER
    where type 'a class = 'a GtkSourceGutterRendererClass.class
    where type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    where type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val activate_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_activate")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val begin_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_begin")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val draw_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_draw")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkSourceGutterRendererState.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val end_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_end") (GtkSourceGutterRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getAlignment_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_alignment")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GFloat.PolyML.cRef
             &&> GFloat.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getAlignmentMode_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_alignment_mode") (GtkSourceGutterRendererClass.PolyML.cPtr --> GtkSourceGutterRendererAlignmentMode.PolyML.cVal)
      val getBackground_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_background") (GtkSourceGutterRendererClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_padding")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSize_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_size") (GtkSourceGutterRendererClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getView_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_view") (GtkSourceGutterRendererClass.PolyML.cPtr --> GtkTextViewClass.PolyML.cPtr)
      val getVisible_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_visible") (GtkSourceGutterRendererClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWindowType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_get_window_type") (GtkSourceGutterRendererClass.PolyML.cPtr --> GtkTextWindowType.PolyML.cVal)
      val queryActivatable_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_activatable")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val queryData_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_data")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkSourceGutterRendererState.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val queryTooltip_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_query_tooltip")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTooltipClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val queueDraw_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_queue_draw") (GtkSourceGutterRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setAlignment_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_alignment")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setAlignmentMode_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_alignment_mode") (GtkSourceGutterRendererClass.PolyML.cPtr &&> GtkSourceGutterRendererAlignmentMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setBackground_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_background") (GtkSourceGutterRendererClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_padding")
          (
            GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setSize_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_size") (GtkSourceGutterRendererClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setVisible_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_set_visible") (GtkSourceGutterRendererClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceGutterRendererClass.class
    type gutter_renderer_state_t = GtkSourceGutterRendererState.t
    type gutter_renderer_alignment_mode_t = GtkSourceGutterRendererAlignmentMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self iter area event =
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
    fun begin self cr backgroundArea cellArea start end' =
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
    fun draw self cr backgroundArea cellArea start end' state =
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
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPadding_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (xpad, ypad)
      end
    fun getSize self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GInt.FFI.fromVal) getSize_ self
    fun getView self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GtkTextViewClass.FFI.fromPtr false) getView_ self
    fun getVisible self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun getWindowType self = (GtkSourceGutterRendererClass.FFI.withPtr ---> GtkTextWindowType.FFI.fromVal) getWindowType_ self
    fun queryActivatable self iter area event =
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
    fun queryData self start end' state =
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
    fun queryTooltip self iter area x y tooltip =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun setAlignment self xalign yalign =
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
    fun setPadding self xpad ypad =
      (
        GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    fun setSize self size = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSize_ (self & size)
    fun setVisible self visible = (GtkSourceGutterRendererClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
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
