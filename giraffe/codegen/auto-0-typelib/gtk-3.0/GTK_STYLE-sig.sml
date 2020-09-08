signature GTK_STYLE =
  sig
    type 'a class
    type icon_set_t
    type 'a widget_class
    type text_direction_t
    type icon_source_t
    type state_type_t
    type 'a style_context_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val applyDefaultBackground :
      'a class
       -> Cairo.ContextRecord.t
           * 'b Gdk.WindowClass.class
           * state_type_t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val copy : 'a class -> base class
    val detach : 'a class -> unit
    val getStyleProperty :
      'a class
       -> GObject.Type.t * string
       -> GObject.ValueRecord.t
    val hasContext : 'a class -> bool
    val lookupColor :
      'a class
       -> string
       -> Gdk.ColorRecord.t option
    val lookupIconSet :
      'a class
       -> string
       -> icon_set_t
    val renderIcon :
      'a class
       -> icon_source_t
           * text_direction_t
           * state_type_t
           * LargeInt.int
           * 'b widget_class option
           * string option
       -> base GdkPixbuf.PixbufClass.class
    val setBackground :
      'a class
       -> 'b Gdk.WindowClass.class * state_type_t
       -> unit
    val realizeSig : (unit -> unit) -> 'a class Signal.t
    val unrealizeSig : (unit -> unit) -> 'a class Signal.t
    val contextProp : ('a class, unit -> base style_context_class option, unit, 'b style_context_class option -> unit) Property.t
  end
