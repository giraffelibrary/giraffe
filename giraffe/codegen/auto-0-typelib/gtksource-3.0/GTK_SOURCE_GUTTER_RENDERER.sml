signature GTK_SOURCE_GUTTER_RENDERER =
  sig
    type 'a class_t
    type gutter_renderer_state_t
    type gutter_renderer_alignment_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Cairo.RectangleIntRecord.t
       -> 'b Gdk.Event.t
       -> unit
    val begin :
      'a class_t
       -> Cairo.ContextRecord.t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> Gtk.TextIterRecord.t
       -> Gtk.TextIterRecord.t
       -> unit
    val draw :
      'a class_t
       -> Cairo.ContextRecord.t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> Gtk.TextIterRecord.t
       -> Gtk.TextIterRecord.t
       -> gutter_renderer_state_t
       -> unit
    val end' : 'a class_t -> unit
    val getAlignment : 'a class_t -> real * real
    val getAlignmentMode : 'a class_t -> gutter_renderer_alignment_mode_t
    val getBackground : 'a class_t -> Gdk.RgbaRecord.t option
    val getPadding : 'a class_t -> LargeInt.int * LargeInt.int
    val getSize : 'a class_t -> LargeInt.int
    val getView : 'a class_t -> base Gtk.TextViewClass.t
    val getVisible : 'a class_t -> bool
    val getWindowType : 'a class_t -> Gtk.TextWindowType.t
    val queryActivatable :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Cairo.RectangleIntRecord.t
       -> 'b Gdk.Event.t
       -> bool
    val queryData :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Gtk.TextIterRecord.t
       -> gutter_renderer_state_t
       -> unit
    val queryTooltip :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Cairo.RectangleIntRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> 'b Gtk.TooltipClass.t
       -> bool
    val queueDraw : 'a class_t -> unit
    val setAlignment :
      'a class_t
       -> real
       -> real
       -> unit
    val setAlignmentMode :
      'a class_t
       -> gutter_renderer_alignment_mode_t
       -> unit
    val setBackground :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setPadding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val activateSig :
      (Gtk.TextIterRecord.t
        -> Cairo.RectangleIntRecord.t
        -> base Gdk.Event.t
        -> unit)
       -> 'a class_t Signal.signal
    val queryActivatableSig :
      (Gtk.TextIterRecord.t
        -> Cairo.RectangleIntRecord.t
        -> base Gdk.Event.t
        -> bool)
       -> 'a class_t Signal.signal
    val queryDataSig :
      (Gtk.TextIterRecord.t
        -> Gtk.TextIterRecord.t
        -> gutter_renderer_state_t
        -> unit)
       -> 'a class_t Signal.signal
    val queryTooltipSig :
      (Gtk.TextIterRecord.t
        -> Cairo.RectangleIntRecord.t
        -> LargeInt.int
        -> LargeInt.int
        -> base Gtk.TooltipClass.t
        -> bool)
       -> 'a class_t Signal.signal
    val queueDrawSig : (unit -> unit) -> 'a class_t Signal.signal
    val alignmentModeProp : ('a class_t, gutter_renderer_alignment_mode_t, gutter_renderer_alignment_mode_t) Property.readwrite
    val backgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val sizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val viewProp : ('a class_t, base Gtk.TextViewClass.t option) Property.readonly
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val windowTypeProp : ('a class_t, Gtk.TextWindowType.t) Property.readonly
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val xpadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
    val ypadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
