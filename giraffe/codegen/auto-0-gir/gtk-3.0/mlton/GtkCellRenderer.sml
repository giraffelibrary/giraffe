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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.val_
               * GInt.FFI.val_
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
               * GInt.FFI.val_
               * GInt.FFI.val_
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
        GtkCellRendererClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GtkCellRendererState.FFI.withVal
             &&&> GdkRectangleRecord.FFI.withPtr false
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
            GtkCellRendererClass.FFI.withPtr false
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getFixedSize_
            (
              self
               & GInt.null
               & GInt.null
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
            GtkCellRendererClass.FFI.withPtr false
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
    fun getPreferredHeight self widget =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & widget
               & GInt.null
               & GInt.null
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & widget
               & width
               & GInt.null
               & GInt.null
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & widget
               & GInt.null
               & GInt.null
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
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & widget
               & height
               & GInt.null
               & GInt.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GtkCellRendererClass.FFI.withPtr false ---> GtkSizeRequestMode.FFI.fromVal) getRequestMode_ self
    fun getSensitive self = (GtkCellRendererClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSensitive_ self
    fun getSize self (widget, cellArea) =
      let
        val xOffset
         & yOffset
         & width
         & height
         & () =
          (
            GtkCellRendererClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withOptPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & widget
               & cellArea
               & GInt.null
               & GInt.null
               & GInt.null
               & GInt.null
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
        GtkCellRendererClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withOptPtr false
         &&&> GtkCellRendererState.FFI.withVal
         ---> GtkStateFlags.FFI.fromVal
      )
        getState_
        (
          self
           & widget
           & cellState
        )
    fun getVisible self = (GtkCellRendererClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun isActivatable self = (GtkCellRendererClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActivatable_ self
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
        GtkCellRendererClass.FFI.withPtr false
         &&&> CairoContextRecord.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
        GtkCellRendererClass.FFI.withPtr false
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
        GtkCellRendererClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
        GtkCellRendererClass.FFI.withPtr false
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
    fun setSensitive self sensitive = (GtkCellRendererClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setVisible self visible = (GtkCellRendererClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
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
        GtkCellRendererClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withOptPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
       before GtkCellRendererClass.FFI.touchPtr self
       before GdkEvent.FFI.touchOptPtr event
       before GtkWidgetClass.FFI.touchPtr widget
       before Utf8.FFI.touchPtr path
       before GdkRectangleRecord.FFI.touchPtr backgroundArea
       before GdkRectangleRecord.FFI.touchPtr cellArea
    fun stopEditing self canceled = (GtkCellRendererClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) stopEditing_ (self & canceled)
    local
      open ClosureMarshal Signal
    in
      fun editingCanceledSig f = signal "editing-canceled" (void ---> ret_void) f
      fun editingStartedSig f = signal "editing-started" (get 0w1 GtkCellEditableClass.t &&&> get 0w2 string ---> ret_void) (fn editable & path => f (editable, path))
    end
    local
      open ValueAccessor
    in
      val cellBackgroundProp =
        {
          name = "cell-background",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val cellBackgroundGdkProp =
        {
          name = "cell-background-gdk",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val cellBackgroundRgbaProp =
        {
          name = "cell-background-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val cellBackgroundSetProp =
        {
          name = "cell-background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val editingProp =
        {
          name = "editing",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val heightProp =
        {
          name = "height",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val isExpandedProp =
        {
          name = "is-expanded",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val isExpanderProp =
        {
          name = "is-expander",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val modeProp =
        {
          name = "mode",
          gtype = fn () => C.gtype GtkCellRendererMode.t (),
          get = fn x => fn () => C.get GtkCellRendererMode.t x,
          set = fn x => C.set GtkCellRendererMode.t x,
          init = fn x => C.set GtkCellRendererMode.t x
        }
      val sensitiveProp =
        {
          name = "sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val widthProp =
        {
          name = "width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val xalignProp =
        {
          name = "xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val xpadProp =
        {
          name = "xpad",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val yalignProp =
        {
          name = "yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val ypadProp =
        {
          name = "ypad",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
