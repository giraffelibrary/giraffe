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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activate_ =
        call (getSymbol "gtk_cell_renderer_activate")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getAlignedArea_ =
        call (getSymbol "gtk_cell_renderer_get_aligned_area")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getAlignment_ =
        call (getSymbol "gtk_cell_renderer_get_alignment")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GFloat.PolyML.cRef
             &&> GFloat.PolyML.cRef
             --> cVoid
          )
      val getFixedSize_ =
        call (getSymbol "gtk_cell_renderer_get_fixed_size")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPadding_ =
        call (getSymbol "gtk_cell_renderer_get_padding")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeight_ =
        call (getSymbol "gtk_cell_renderer_get_preferred_height")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeightForWidth_ =
        call (getSymbol "gtk_cell_renderer_get_preferred_height_for_width")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredSize_ =
        call (getSymbol "gtk_cell_renderer_get_preferred_size")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             --> cVoid
          )
      val getPreferredWidth_ =
        call (getSymbol "gtk_cell_renderer_get_preferred_width")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidthForHeight_ =
        call (getSymbol "gtk_cell_renderer_get_preferred_width_for_height")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getRequestMode_ = call (getSymbol "gtk_cell_renderer_get_request_mode") (GtkCellRendererClass.PolyML.cPtr --> GtkSizeRequestMode.PolyML.cVal)
      val getSensitive_ = call (getSymbol "gtk_cell_renderer_get_sensitive") (GtkCellRendererClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSize_ =
        call (getSymbol "gtk_cell_renderer_get_size")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getState_ =
        call (getSymbol "gtk_cell_renderer_get_state")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> GtkStateFlags.PolyML.cVal
          )
      val getVisible_ = call (getSymbol "gtk_cell_renderer_get_visible") (GtkCellRendererClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isActivatable_ = call (getSymbol "gtk_cell_renderer_is_activatable") (GtkCellRendererClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val render_ =
        call (getSymbol "gtk_cell_renderer_render")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> cVoid
          )
      val setAlignment_ =
        call (getSymbol "gtk_cell_renderer_set_alignment")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val setFixedSize_ =
        call (getSymbol "gtk_cell_renderer_set_fixed_size")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setPadding_ =
        call (getSymbol "gtk_cell_renderer_set_padding")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setSensitive_ = call (getSymbol "gtk_cell_renderer_set_sensitive") (GtkCellRendererClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisible_ = call (getSymbol "gtk_cell_renderer_set_visible") (GtkCellRendererClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val startEditing_ =
        call (getSymbol "gtk_cell_renderer_start_editing")
          (
            GtkCellRendererClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cOptPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> GtkCellEditableClass.PolyML.cOptPtr
          )
      val stopEditing_ = call (getSymbol "gtk_cell_renderer_stop_editing") (GtkCellRendererClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun stopEditing self canceled = (GtkCellRendererClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) stopEditing_ (self & canceled)
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
