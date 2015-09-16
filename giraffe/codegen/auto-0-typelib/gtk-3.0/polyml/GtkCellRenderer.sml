structure GtkCellRenderer :>
  GTK_CELL_RENDERER
    where type 'a class_t = 'a GtkCellRendererClass.t
    where type requisition_record_t = GtkRequisitionRecord.t
    where type size_request_mode_t = GtkSizeRequestMode.t
    where type state_flags_t = GtkStateFlags.t
    where type cell_renderer_state_t = GtkCellRendererState.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    where type cell_renderer_mode_t = GtkCellRendererMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val activate_ =
        call (load_sym libgtk "gtk_cell_renderer_activate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkEvent.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> GtkCellRendererState.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val getAlignedArea_ =
        call (load_sym libgtk "gtk_cell_renderer_get_aligned_area")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkCellRendererState.PolyML.VAL
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getAlignment_ =
        call (load_sym libgtk "gtk_cell_renderer_get_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.REF
             &&> FFI.Float.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getFixedSize_ =
        call (load_sym libgtk "gtk_cell_renderer_get_fixed_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_cell_renderer_get_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredHeight_ =
        call (load_sym libgtk "gtk_cell_renderer_get_preferred_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredHeightForWidth_ =
        call (load_sym libgtk "gtk_cell_renderer_get_preferred_height_for_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredSize_ =
        call (load_sym libgtk "gtk_cell_renderer_get_preferred_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkRequisitionRecord.PolyML.PTR
             &&> GtkRequisitionRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPreferredWidth_ =
        call (load_sym libgtk "gtk_cell_renderer_get_preferred_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredWidthForHeight_ =
        call (load_sym libgtk "gtk_cell_renderer_get_preferred_width_for_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getRequestMode_ = call (load_sym libgtk "gtk_cell_renderer_get_request_mode") (GObjectObjectClass.PolyML.PTR --> GtkSizeRequestMode.PolyML.VAL)
      val getSensitive_ = call (load_sym libgtk "gtk_cell_renderer_get_sensitive") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getState_ =
        call (load_sym libgtk "gtk_cell_renderer_get_state")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkCellRendererState.PolyML.VAL
             --> GtkStateFlags.PolyML.VAL
          )
      val getVisible_ = call (load_sym libgtk "gtk_cell_renderer_get_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isActivatable_ = call (load_sym libgtk "gtk_cell_renderer_is_activatable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val render_ =
        call (load_sym libgtk "gtk_cell_renderer_render")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> GtkCellRendererState.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setAlignment_ =
        call (load_sym libgtk "gtk_cell_renderer_set_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setFixedSize_ =
        call (load_sym libgtk "gtk_cell_renderer_set_fixed_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setPadding_ =
        call (load_sym libgtk "gtk_cell_renderer_set_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setSensitive_ = call (load_sym libgtk "gtk_cell_renderer_set_sensitive") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setVisible_ = call (load_sym libgtk "gtk_cell_renderer_set_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val startEditing_ =
        call (load_sym libgtk "gtk_cell_renderer_start_editing")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkEvent.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> GtkCellRendererState.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val stopEditing_ = call (load_sym libgtk "gtk_cell_renderer_stop_editing") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellRendererClass.t
    type requisition_record_t = GtkRequisitionRecord.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type state_flags_t = GtkStateFlags.t
    type cell_renderer_state_t = GtkCellRendererState.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    type cell_renderer_mode_t = GtkCellRendererMode.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        activate_
        (
          self
           & event
           & widget
           & path
           & backgroundArea
           & cellArea
           & flags
        )
    fun getAlignedArea self widget flags cellArea =
      let
        val alignedArea & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GtkCellRendererState.C.withVal
             &&&> CairoRectangleIntRecord.C.withPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
          )
            getAlignedArea_
            (
              self
               & widget
               & flags
               & cellArea
               & ()
            )
      in
        alignedArea
      end
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
    fun getFixedSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getFixedSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
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
    fun getPreferredHeight self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & widget
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredHeightForWidth self widget width =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & widget
               & width
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredSize self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GtkRequisitionRecord.C.withNewPtr
             &&&> GtkRequisitionRecord.C.withNewPtr
             ---> GtkRequisitionRecord.C.fromPtr true
                   && GtkRequisitionRecord.C.fromPtr true
                   && I
          )
            getPreferredSize_
            (
              self
               & widget
               & ()
               & ()
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredWidth self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & widget
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredWidthForHeight self widget height =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & widget
               & height
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GObjectObjectClass.C.withPtr ---> GtkSizeRequestMode.C.fromVal) getRequestMode_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getState self widget cellState =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> GtkStateFlags.C.fromVal
      )
        getState_
        (
          self
           & widget
           & cellState
        )
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun isActivatable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActivatable_ self
    fun render self cr widget backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> I
      )
        render_
        (
          self
           & cr
           & widget
           & backgroundArea
           & cellArea
           & flags
        )
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
    fun setFixedSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setFixedSize_
        (
          self
           & width
           & height
        )
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
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun startEditing self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> GtkCellEditableClass.C.fromPtr false
      )
        startEditing_
        (
          self
           & event
           & widget
           & path
           & backgroundArea
           & cellArea
           & flags
        )
    fun stopEditing self canceled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) stopEditing_ (self & canceled)
    local
      open ClosureMarshal Signal
    in
      fun editingCanceledSig f = signal "editing-canceled" (void ---> ret_void) f
      fun editingStartedSig f = signal "editing-started" (get 0w1 GtkCellEditableClass.t &&&> get 0w2 string ---> ret_void) (fn editable & path => f editable path)
    end
    local
      open Property
    in
      val cellBackgroundProp = {set = fn x => set "cell-background" stringOpt x}
      val cellBackgroundGdkProp =
        {
          get = fn x => get "cell-background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "cell-background-gdk" GdkColorRecord.tOpt x
        }
      val cellBackgroundRgbaProp =
        {
          get = fn x => get "cell-background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "cell-background-rgba" GdkRgbaRecord.tOpt x
        }
      val cellBackgroundSetProp =
        {
          get = fn x => get "cell-background-set" boolean x,
          set = fn x => set "cell-background-set" boolean x
        }
      val editingProp = {get = fn x => get "editing" boolean x}
      val heightProp =
        {
          get = fn x => get "height" int x,
          set = fn x => set "height" int x
        }
      val isExpandedProp =
        {
          get = fn x => get "is-expanded" boolean x,
          set = fn x => set "is-expanded" boolean x
        }
      val isExpanderProp =
        {
          get = fn x => get "is-expander" boolean x,
          set = fn x => set "is-expander" boolean x
        }
      val modeProp =
        {
          get = fn x => get "mode" GtkCellRendererMode.t x,
          set = fn x => set "mode" GtkCellRendererMode.t x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
      val widthProp =
        {
          get = fn x => get "width" int x,
          set = fn x => set "width" int x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" uint x,
          set = fn x => set "xpad" uint x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" uint x,
          set = fn x => set "ypad" uint x
        }
    end
  end
