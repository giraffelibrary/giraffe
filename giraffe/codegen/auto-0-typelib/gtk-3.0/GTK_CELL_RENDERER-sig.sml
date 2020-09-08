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
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
       -> bool
    val getAlignedArea :
      'a class
       -> 'b widget_class
           * cell_renderer_state_t
           * Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
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
    val getSize :
      'a class
       -> 'b widget_class * Gdk.RectangleRecord.t option
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getState :
      'a class
       -> 'b widget_class option * cell_renderer_state_t
       -> state_flags_t
    val getVisible : 'a class -> bool
    val isActivatable : 'a class -> bool
    val render :
      'a class
       -> Cairo.ContextRecord.t
           * 'b widget_class
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
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
       -> 'b Gdk.Event.union option
           * 'c widget_class
           * string
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
       -> base cell_editable_class option
    val stopEditing :
      'a class
       -> bool
       -> unit
    val editingCanceledSig : (unit -> unit) -> 'a class Signal.t
    val editingStartedSig : (base cell_editable_class * string -> unit) -> 'a class Signal.t
    val cellBackgroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val cellBackgroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val cellBackgroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val cellBackgroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val editingProp : ('a class, unit -> bool, unit, unit) Property.t
    val heightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val isExpandedProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val isExpanderProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val modeProp : ('a class, unit -> cell_renderer_mode_t, cell_renderer_mode_t -> unit, cell_renderer_mode_t -> unit) Property.t
    val sensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val widthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val xalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val xpadProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val yalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val ypadProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
