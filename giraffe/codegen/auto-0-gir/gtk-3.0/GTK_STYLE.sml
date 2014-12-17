signature GTK_STYLE =
  sig
    type 'a class_t
    type iconsetrecord_t
    type 'a widgetclass_t
    type textdirection_t
    type iconsourcerecord_t
    type statetype_t
    type 'a stylecontextclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val applyDefaultBackground :
      'a class_t
       -> Cairo.ContextRecord.t
       -> 'b Gdk.WindowClass.t
       -> statetype_t
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
       -> iconsetrecord_t
    val renderIcon :
      'a class_t
       -> iconsourcerecord_t
       -> textdirection_t
       -> statetype_t
       -> LargeInt.int
       -> 'b widgetclass_t option
       -> string option
       -> base GdkPixbuf.PixbufClass.t
    val setBackground :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> statetype_t
       -> unit
    val realizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val unrealizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val contextProp : ('a class_t, base stylecontextclass_t option, 'b stylecontextclass_t option) Property.readwrite
  end
