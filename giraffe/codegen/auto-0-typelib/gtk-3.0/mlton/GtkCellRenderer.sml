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
    val getType_ = _import "gtk_cell_renderer_get_type" : unit -> GObjectType.FFI.val_;
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               -> GBool.FFI.val_;
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkCellRendererState.FFI.val_
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p
               * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getRequestMode_ = _import "gtk_cell_renderer_get_request_mode" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> GtkSizeRequestMode.FFI.val_;
    val getSensitive_ = _import "gtk_cell_renderer_get_sensitive" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> GBool.FFI.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_cell_renderer_get_size" :
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.opt GdkRectangleRecord.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
    val getState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_renderer_get_state" :
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p
               * GtkCellRendererState.FFI.val_
               -> GtkStateFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getVisible_ = _import "gtk_cell_renderer_get_visible" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> GBool.FFI.val_;
    val isActivatable_ = _import "gtk_cell_renderer_is_activatable" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> GBool.FFI.val_;
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_sensitive" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_cell_renderer_set_visible" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
              GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GdkEvent.FFI.opt GdkEvent.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               -> GtkCellEditableClass.FFI.opt GtkCellEditableClass.FFI.p;
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
    val stopEditing_ = fn x1 & x2 => (_import "gtk_cell_renderer_stop_editing" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellRendererClass.class
    type requisition_t = GtkRequisitionRecord.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type state_flags_t = GtkStateFlags.t
    type cell_renderer_state_t = GtkCellRendererState.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type cell_renderer_mode_t = GtkCellRendererMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate
      self
      (
        event,
        widget,
        path,
        backgroundArea,
        cellArea,
        flags
      ) =
      (
        GtkCellRendererClass.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         ---> GBool.FFI.fromVal
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
    fun getAlignedArea
      self
      (
        widget,
        flags,
        cellArea
      ) =
      let
        val alignedArea & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GtkCellRendererState.FFI.withVal
             &&&> GdkRectangleRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
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
            GtkCellRendererClass.FFI.withPtr
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
    fun getFixedSize self =
      let
        val width
         & height
         & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getFixedSize_
            (
              self
               & GInt32.null
               & GInt32.null
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
            GtkCellRendererClass.FFI.withPtr
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
    fun getPreferredHeight self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & widget
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredHeightForWidth self (widget, width) =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & widget
               & width
               & GInt32.null
               & GInt32.null
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
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GtkRequisitionRecord.FFI.withNewPtr
             &&&> GtkRequisitionRecord.FFI.withNewPtr
             ---> GtkRequisitionRecord.FFI.fromPtr true
                   && GtkRequisitionRecord.FFI.fromPtr true
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
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & widget
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredWidthForHeight self (widget, height) =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & widget
               & height
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GtkCellRendererClass.FFI.withPtr ---> GtkSizeRequestMode.FFI.fromVal) getRequestMode_ self
    fun getSensitive self = (GtkCellRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) getSensitive_ self
    fun getSize self (widget, cellArea) =
      let
        val xOffset
         & yOffset
         & width
         & height
         & () =
          (
            GtkCellRendererClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withOptPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & widget
               & cellArea
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          xOffset,
          yOffset,
          width,
          height
        )
      end
    fun getState self (widget, cellState) =
      (
        GtkCellRendererClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GtkCellRendererState.FFI.withVal
         ---> GtkStateFlags.FFI.fromVal
      )
        getState_
        (
          self
           & widget
           & cellState
        )
    fun getVisible self = (GtkCellRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun isActivatable self = (GtkCellRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) isActivatable_ self
    fun render
      self
      (
        cr,
        widget,
        backgroundArea,
        cellArea,
        flags
      ) =
      (
        GtkCellRendererClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
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
    fun setAlignment self (xalign, yalign) =
      (
        GtkCellRendererClass.FFI.withPtr
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
    fun setFixedSize self (width, height) =
      (
        GtkCellRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFixedSize_
        (
          self
           & width
           & height
        )
    fun setPadding self (xpad, ypad) =
      (
        GtkCellRendererClass.FFI.withPtr
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
    fun setSensitive self sensitive = (GtkCellRendererClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setVisible self visible = (GtkCellRendererClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun startEditing
      self
      (
        event,
        widget,
        path,
        backgroundArea,
        cellArea,
        flags
      ) =
      (
        GtkCellRendererClass.FFI.withPtr
         &&&> GdkEvent.FFI.withOptPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         ---> GtkCellEditableClass.FFI.fromOptPtr false
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
    fun stopEditing self canceled = (GtkCellRendererClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) stopEditing_ (self & canceled)
    local
      open ClosureMarshal Signal
    in
      fun editingCanceledSig f = signal "editing-canceled" (void ---> ret_void) f
      fun editingStartedSig f = signal "editing-started" (get 0w1 GtkCellEditableClass.t &&&> get 0w2 string ---> ret_void) (fn editable & path => f (editable, path))
    end
    local
      open Property
    in
      val cellBackgroundProp =
        {
          set = fn x => set "cell-background" stringOpt x,
          new = fn x => new "cell-background" stringOpt x
        }
      val cellBackgroundGdkProp =
        {
          get = fn x => get "cell-background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "cell-background-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "cell-background-gdk" GdkColorRecord.tOpt x
        }
      val cellBackgroundRgbaProp =
        {
          get = fn x => get "cell-background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "cell-background-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "cell-background-rgba" GdkRgbaRecord.tOpt x
        }
      val cellBackgroundSetProp =
        {
          get = fn x => get "cell-background-set" boolean x,
          set = fn x => set "cell-background-set" boolean x,
          new = fn x => new "cell-background-set" boolean x
        }
      val editingProp = {get = fn x => get "editing" boolean x}
      val heightProp =
        {
          get = fn x => get "height" int x,
          set = fn x => set "height" int x,
          new = fn x => new "height" int x
        }
      val isExpandedProp =
        {
          get = fn x => get "is-expanded" boolean x,
          set = fn x => set "is-expanded" boolean x,
          new = fn x => new "is-expanded" boolean x
        }
      val isExpanderProp =
        {
          get = fn x => get "is-expander" boolean x,
          set = fn x => set "is-expander" boolean x,
          new = fn x => new "is-expander" boolean x
        }
      val modeProp =
        {
          get = fn x => get "mode" GtkCellRendererMode.t x,
          set = fn x => set "mode" GtkCellRendererMode.t x,
          new = fn x => new "mode" GtkCellRendererMode.t x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x,
          new = fn x => new "sensitive" boolean x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x,
          new = fn x => new "visible" boolean x
        }
      val widthProp =
        {
          get = fn x => get "width" int x,
          set = fn x => set "width" int x,
          new = fn x => new "width" int x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x,
          new = fn x => new "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" uint x,
          set = fn x => set "xpad" uint x,
          new = fn x => new "xpad" uint x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x,
          new = fn x => new "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" uint x,
          set = fn x => set "ypad" uint x,
          new = fn x => new "ypad" uint x
        }
    end
  end
