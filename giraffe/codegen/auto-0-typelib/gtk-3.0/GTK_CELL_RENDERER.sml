signature GTK_CELL_RENDERER =
  sig
    type 'a class_t
    type requisitionrecord_t
    type sizerequestmode_t
    type stateflags_t
    type cellrendererstate_t
    type 'a widgetclass_t
    type 'a celleditableclass_t
    type cellrenderermode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> 'b Gdk.Event.t
       -> 'c widgetclass_t
       -> string
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> bool
    val getAlignedArea :
      'a class_t
       -> 'b widgetclass_t
       -> cellrendererstate_t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
    val getAlignment : 'a class_t -> real * real
    val getFixedSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getPadding : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredHeight :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredSize :
      'a class_t
       -> 'b widgetclass_t
       -> requisitionrecord_t * requisitionrecord_t
    val getPreferredWidth :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class_t -> sizerequestmode_t
    val getSensitive : 'a class_t -> bool
    val getState :
      'a class_t
       -> 'b widgetclass_t
       -> cellrendererstate_t
       -> stateflags_t
    val getVisible : 'a class_t -> bool
    val isActivatable : 'a class_t -> bool
    val render :
      'a class_t
       -> Cairo.ContextRecord.t
       -> 'b widgetclass_t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
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
       -> 'c widgetclass_t
       -> string
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> base celleditableclass_t
    val stopEditing :
      'a class_t
       -> bool
       -> unit
    val editingCanceledSig : (unit -> unit) -> 'a class_t Signal.signal
    val editingStartedSig :
      (base celleditableclass_t
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
    val modeProp : ('a class_t, cellrenderermode_t, cellrenderermode_t) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val widthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val xpadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
    val ypadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
