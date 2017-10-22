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
    val activationProp : ('a class, completion_activation_t, completion_activation_t) Property.readwrite
    val iconProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val interactiveDelayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val minimumWordSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val priorityProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val proposalsBatchSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val scanBatchSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
