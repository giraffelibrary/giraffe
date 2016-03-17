structure GtkCellRenderer :>
  GTK_CELL_RENDERER
    where type 'a class = 'a GtkCellRendererClass.class
    where type requisition_t = GtkRequisitionRecord.t
    where type size_request_mode_t = GtkSizeRequestMode.t
    where type state_flags_t = GtkStateFlags.t
    where type cell_renderer_state_t = GtkCellRendererState.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type cell_renderer_mode_t = GtkCellRendererMode.t =
  struct
    val getType_ = _import "gtk_cell_renderer_get_type" : unit -> GObjectType.C.val_;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_gtk_cell_renderer_activate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GtkCellRendererState.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getAlignedArea_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_renderer_get_aligned_area" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkCellRendererState.C.val_
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_get_alignment" :
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
    val getFixedSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_get_fixed_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_get_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_renderer_get_preferred_height" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPreferredHeightForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_renderer_get_preferred_height_for_width" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getPreferredSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_renderer_get_preferred_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p
               * GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPreferredWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_renderer_get_preferred_width" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPreferredWidthForHeight_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_renderer_get_preferred_width_for_height" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getRequestMode_ = _import "gtk_cell_renderer_get_request_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSizeRequestMode.C.val_;
    val getSensitive_ = _import "gtk_cell_renderer_get_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_get_state" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkCellRendererState.C.val_
               -> GtkStateFlags.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getVisible_ = _import "gtk_cell_renderer_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isActivatable_ = _import "gtk_cell_renderer_is_activatable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val render_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_renderer_render" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GtkCellRendererState.C.val_
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
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_set_alignment" :
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
    val setFixedSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_set_fixed_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_set_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val startEditing_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_gtk_cell_renderer_start_editing" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GtkCellRendererState.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val stopEditing_ = fn x1 & x2 => (_import "gtk_cell_renderer_stop_editing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellRendererClass.class
    type requisition_t = GtkRequisitionRecord.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type state_flags_t = GtkStateFlags.t
    type cell_renderer_state_t = GtkCellRendererState.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type cell_renderer_mode_t = GtkCellRendererMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
             &&&> GdkRectangleRecord.C.withPtr
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getFixedSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
    fun getPreferredHeight self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & widget
               & FFI.Int.null
               & FFI.Int.null
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & widget
               & width
               & FFI.Int.null
               & FFI.Int.null
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & widget
               & FFI.Int.null
               & FFI.Int.null
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & widget
               & height
               & FFI.Int.null
               & FFI.Int.null
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
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun startEditing self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
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
