signature GTK_STYLE =
  sig
    type 'a class_t
    type icon_set_record_t
    type 'a widget_class_t
    type text_direction_t
    type icon_source_record_t
    type state_type_t
    type 'a style_context_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val applyDefaultBackground :
      'a class_t
       -> Cairo.ContextRecord.t
       -> 'b Gdk.WindowClass.t
       -> state_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val copy : 'a class_t -> base class_t
    val detach : 'a class_t -> unit
    val hasContext : 'a class_t -> bool
    val lookupColor :
      'a class_t
       -> string
       -> Gdk.ColorRecord.t option
    val lookupIconSet :
      'a class_t
       -> string
       -> icon_set_record_t
    val renderIcon :
      'a class_t
       -> icon_source_record_t
       -> text_direction_t
       -> state_type_t
       -> LargeInt.int
       -> 'b widget_class_t option
       -> string option
       -> base GdkPixbuf.PixbufClass.t
    val setBackground :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> state_type_t
       -> unit
    val realizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val unrealizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val contextProp : ('a class_t, base style_context_class_t option, 'b style_context_class_t option) Property.readwrite
  end
