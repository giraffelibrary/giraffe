signature GTK_SOURCE_GUTTER_RENDERER =
  sig
    type 'a class
    type gutter_renderer_state_t
    type gutter_renderer_alignment_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val activate :
      'a class
       -> Gtk.TextIterRecord.t
           * Gdk.RectangleRecord.t
           * 'b Gdk.Event.union
       -> unit
    val begin :
      'a class
       -> Cairo.ContextRecord.t
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
           * Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
       -> unit
    val draw :
      'a class
       -> Cairo.ContextRecord.t
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
           * Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * gutter_renderer_state_t
       -> unit
    val end' : 'a class -> unit
    val getAlignment : 'a class -> real * real
    val getAlignmentMode : 'a class -> gutter_renderer_alignment_mode_t
    val getBackground : 'a class -> Gdk.RgbaRecord.t option
    val getPadding : 'a class -> LargeInt.int * LargeInt.int
    val getSize : 'a class -> LargeInt.int
    val getView : 'a class -> base Gtk.TextViewClass.class
    val getVisible : 'a class -> bool
    val getWindowType : 'a class -> Gtk.TextWindowType.t
    val queryActivatable :
      'a class
       -> Gtk.TextIterRecord.t
           * Gdk.RectangleRecord.t
           * 'b Gdk.Event.union
       -> bool
    val queryData :
      'a class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * gutter_renderer_state_t
       -> unit
    val queryTooltip :
      'a class
       -> Gtk.TextIterRecord.t
           * Gdk.RectangleRecord.t
           * LargeInt.int
           * LargeInt.int
           * 'b Gtk.TooltipClass.class
       -> bool
    val queueDraw : 'a class -> unit
    val setAlignment :
      'a class
       -> real * real
       -> unit
    val setAlignmentMode :
      'a class
       -> gutter_renderer_alignment_mode_t
       -> unit
    val setBackground :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setSize :
      'a class
       -> LargeInt.int
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val activateSig :
      (Gtk.TextIterRecord.t
        * Cairo.RectangleIntRecord.t
        * base Gdk.Event.union
        -> unit)
       -> 'a class Signal.t
    val queryActivatableSig :
      (Gtk.TextIterRecord.t
        * Cairo.RectangleIntRecord.t
        * base Gdk.Event.union
        -> bool)
       -> 'a class Signal.t
    val queryDataSig :
      (Gtk.TextIterRecord.t
        * Gtk.TextIterRecord.t
        * gutter_renderer_state_t
        -> unit)
       -> 'a class Signal.t
    val queryTooltipSig :
      (Gtk.TextIterRecord.t
        * Cairo.RectangleIntRecord.t
        * LargeInt.int
        * LargeInt.int
        * base Gtk.TooltipClass.class
        -> bool)
       -> 'a class Signal.t
    val queueDrawSig : (unit -> unit) -> 'a class Signal.t
    val alignmentModeProp : ('a class, gutter_renderer_alignment_mode_t, gutter_renderer_alignment_mode_t) Property.readwrite
    val backgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class, bool, bool) Property.readwrite
    val sizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val viewProp : ('a class, base Gtk.TextViewClass.class option) Property.readonly
    val visibleProp : ('a class, bool, bool) Property.readwrite
    val windowTypeProp : ('a class, Gtk.TextWindowType.t) Property.readonly
    val xalignProp : ('a class, real, real) Property.readwrite
    val xpadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
    val ypadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
