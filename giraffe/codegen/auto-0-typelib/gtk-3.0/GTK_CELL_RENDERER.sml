signature GTK_CELL_RENDERER =
  sig
    type 'a class
    type requisition_t
    type size_request_mode_t
    type state_flags_t
    type cell_renderer_state_t
    type 'a widget_class
    type 'a cell_editable_class
    type cell_renderer_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val activate :
      'a class
       -> 'b Gdk.Event.union
           * 'c widget_class
           * string
           * Cairo.RectangleIntRecord.t
           * Cairo.RectangleIntRecord.t
           * cell_renderer_state_t
       -> bool
    val getAlignedArea :
      'a class
       -> 'b widget_class
           * cell_renderer_state_t
           * Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
    val getAlignment : 'a class -> real * real
    val getFixedSize : 'a class -> LargeInt.int * LargeInt.int
    val getPadding : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeight :
      'a class
       -> 'b widget_class
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class
       -> 'b widget_class * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredSize :
      'a class
       -> 'b widget_class
       -> requisition_t * requisition_t
    val getPreferredWidth :
      'a class
       -> 'b widget_class
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class
       -> 'b widget_class * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class -> size_request_mode_t
    val getSensitive : 'a class -> bool
    val getState :
      'a class
       -> 'b widget_class * cell_renderer_state_t
       -> state_flags_t
    val getVisible : 'a class -> bool
    val isActivatable : 'a class -> bool
    val render :
      'a class
       -> Cairo.ContextRecord.t
           * 'b widget_class
           * Cairo.RectangleIntRecord.t
           * Cairo.RectangleIntRecord.t
           * cell_renderer_state_t
       -> unit
    val setAlignment :
      'a class
       -> real * real
       -> unit
    val setFixedSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setSensitive :
      'a class
       -> bool
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val startEditing :
      'a class
       -> 'b Gdk.Event.union
           * 'c widget_class
           * string
           * Cairo.RectangleIntRecord.t
           * Cairo.RectangleIntRecord.t
           * cell_renderer_state_t
       -> base cell_editable_class
    val stopEditing :
      'a class
       -> bool
       -> unit
    val editingCanceledSig : (unit -> unit) -> 'a class Signal.t
    val editingStartedSig : (base cell_editable_class * string -> unit) -> 'a class Signal.t
    val cellBackgroundProp : ('a class, string option) Property.writeonly
    val cellBackgroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val cellBackgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val cellBackgroundSetProp : ('a class, bool, bool) Property.readwrite
    val editingProp : ('a class, bool) Property.readonly
    val heightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val isExpandedProp : ('a class, bool, bool) Property.readwrite
    val isExpanderProp : ('a class, bool, bool) Property.readwrite
    val modeProp : ('a class, cell_renderer_mode_t, cell_renderer_mode_t) Property.readwrite
    val sensitiveProp : ('a class, bool, bool) Property.readwrite
    val visibleProp : ('a class, bool, bool) Property.readwrite
    val widthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class, real, real) Property.readwrite
    val xpadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
    val ypadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
