structure GtkCellRenderer :>
  GTK_CELL_RENDERER
    where type 'a class_t = 'a GtkCellRendererClass.t
    where type requisitionrecord_t = GtkRequisitionRecord.t
    where type sizerequestmode_t = GtkSizeRequestMode.t
    where type stateflags_t = GtkStateFlags.t
    where type cellrendererstate_t = GtkCellRendererState.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    where type cellrenderermode_t = GtkCellRendererMode.t =
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
               * cstring
               * unit CPointer.t
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkCellRendererState.C.val_
               -> FFI.Bool.val_;
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
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
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
               * FFI.Float.ref_
               * FFI.Float.ref_
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
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
    val getSensitive_ = _import "gtk_cell_renderer_get_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
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
    val getVisible_ = _import "gtk_cell_renderer_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val isActivatable_ = _import "gtk_cell_renderer_is_activatable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
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
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
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
               * FFI.Float.val_
               * FFI.Float.val_
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
               * FFI.Int32.val_
               * FFI.Int32.val_
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
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
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
               * cstring
               * unit CPointer.t
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
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
    val stopEditing_ = fn x1 & x2 => (_import "gtk_cell_renderer_stop_editing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkCellRendererClass.t
    type requisitionrecord_t = GtkRequisitionRecord.t
    type sizerequestmode_t = GtkSizeRequestMode.t
    type stateflags_t = GtkStateFlags.t
    type cellrendererstate_t = GtkCellRendererState.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    type cellrenderermode_t = GtkCellRendererMode.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> FFI.Bool.fromVal
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
             &&&> FFI.Float.withRefVal
             &&&> FFI.Float.withRefVal
             ---> FFI.Float.fromVal
                   && FFI.Float.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & 0.0
               & 0.0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getFixedSize_
            (
              self
               & 0
               & 0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPadding_
            (
              self
               & 0
               & 0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & widget
               & 0
               & 0
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & widget
               & width
               & 0
               & 0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & widget
               & 0
               & 0
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & widget
               & height
               & 0
               & 0
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GObjectObjectClass.C.withPtr ---> GtkSizeRequestMode.C.fromVal) getRequestMode_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getSensitive_ self
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
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisible_ self
    fun isActivatable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isActivatable_ self
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
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setSensitive_ (self & sensitive)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisible_ (self & visible)
    fun startEditing self event widget path backgroundArea cellArea flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
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
    fun stopEditing self canceled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) stopEditing_ (self & canceled)
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
