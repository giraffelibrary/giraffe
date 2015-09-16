signature GTK_CELL_RENDERER =
  sig
    type 'a class_t
    type requisition_record_t
    type size_request_mode_t
    type state_flags_t
    type cell_renderer_state_t
    type 'a widget_class_t
    type 'a cell_editable_class_t
    type cell_renderer_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> 'b Gdk.Event.t
       -> 'c widget_class_t
       -> string
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> bool
    val getAlignedArea :
      'a class_t
       -> 'b widget_class_t
       -> cell_renderer_state_t
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
    val getAlignment : 'a class_t -> real * real
    val getFixedSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getPadding : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredHeight :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredSize :
      'a class_t
       -> 'b widget_class_t
       -> requisition_record_t * requisition_record_t
    val getPreferredWidth :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class_t -> size_request_mode_t
    val getSensitive : 'a class_t -> bool
    val getState :
      'a class_t
       -> 'b widget_class_t
       -> cell_renderer_state_t
       -> state_flags_t
    val getVisible : 'a class_t -> bool
    val isActivatable : 'a class_t -> bool
    val render :
      'a class_t
       -> Cairo.ContextRecord.t
       -> 'b widget_class_t
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> unit
    val setAlignment :
      'a class_t
       -> real
       -> real
       -> unit
    val setFixedSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setPadding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setSensitive :
      'a class_t
       -> bool
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val startEditing :
      'a class_t
       -> 'b Gdk.Event.t
       -> 'c widget_class_t
       -> string
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> base cell_editable_class_t
    val stopEditing :
      'a class_t
       -> bool
       -> unit
    val editingCanceledSig : (unit -> unit) -> 'a class_t Signal.signal
    val editingStartedSig :
      (base cell_editable_class_t
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val cellBackgroundProp : ('a class_t, string option) Property.writeonly
    val cellBackgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val cellBackgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val cellBackgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val editingProp : ('a class_t, bool) Property.readonly
    val heightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val isExpandedProp : ('a class_t, bool, bool) Property.readwrite
    val isExpanderProp : ('a class_t, bool, bool) Property.readwrite
    val modeProp : ('a class_t, cell_renderer_mode_t, cell_renderer_mode_t) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val widthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val xpadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
    val ypadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
