signature GTK_SOURCE_COMPLETION_WORDS =
  sig
    type 'a class
    type 'a completion_provider_class
    type completion_activation_t
    type t = base class
    val asCompletionProvider : 'a class -> base completion_provider_class
    val getType : unit -> GObject.Type.t
    val new : string option * 'a GdkPixbuf.PixbufClass.class option -> base class
    val register :
      'a class
       -> 'b Gtk.TextBufferClass.class
       -> unit
    val unregister :
      'a class
       -> 'b Gtk.TextBufferClass.class
       -> unit
    val activationProp : ('a class, unit -> completion_activation_t, completion_activation_t -> unit, completion_activation_t -> unit) Property.t
    val iconProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val interactiveDelayProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val minimumWordSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val nameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val priorityProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val proposalsBatchSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val scanBatchSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
