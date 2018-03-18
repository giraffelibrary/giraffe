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
    val cellBackgroundProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val cellBackgroundGdkProp :
      {
        get : 'a class -> Gdk.ColorRecord.t option,
        set :
          Gdk.ColorRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.ColorRecord.t option -> 'a class Property.t
      }
    val cellBackgroundRgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val cellBackgroundSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val editingProp : {get : 'a class -> bool}
    val heightProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val isExpandedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val isExpanderProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val modeProp :
      {
        get : 'a class -> cell_renderer_mode_t,
        set :
          cell_renderer_mode_t
           -> 'a class
           -> unit,
        new : cell_renderer_mode_t -> 'a class Property.t
      }
    val sensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val visibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val widthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val xalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val xpadProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val yalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val ypadProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
