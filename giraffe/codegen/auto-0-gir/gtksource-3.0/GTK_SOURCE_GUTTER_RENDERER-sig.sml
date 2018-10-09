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
        * Gdk.RectangleRecord.t
        * base Gdk.Event.union
        -> unit)
       -> 'a class Signal.t
    val queryActivatableSig :
      (Gtk.TextIterRecord.t
        * Gdk.RectangleRecord.t
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
        * Gdk.RectangleRecord.t
        * LargeInt.int
        * LargeInt.int
        * base Gtk.TooltipClass.class
        -> bool)
       -> 'a class Signal.t
    val queueDrawSig : (unit -> unit) -> 'a class Signal.t
    val alignmentModeProp :
      {
        get : 'a class -> gutter_renderer_alignment_mode_t,
        set :
          gutter_renderer_alignment_mode_t
           -> 'a class
           -> unit,
        new : gutter_renderer_alignment_mode_t -> 'a class Property.t
      }
    val backgroundRgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val backgroundSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val sizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val viewProp : {get : 'a class -> base Gtk.TextViewClass.class option}
    val visibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val windowTypeProp : {get : 'a class -> Gtk.TextWindowType.t}
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
