signature GTK_SOURCE_COMPLETION_WORDS =
  sig
    type 'a class_t
    type 'a completionproviderclass_t
    val asCompletionProvider : 'a class_t -> base completionproviderclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string option
       -> 'a GdkPixbuf.PixbufClass.t option
       -> base class_t
    val register :
      'a class_t
       -> 'b Gtk.TextBufferClass.t
       -> unit
    val unregister :
      'a class_t
       -> 'b Gtk.TextBufferClass.t
       -> unit
    val iconProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val interactiveDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val minimumWordSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val priorityProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val proposalsBatchSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val scanBatchSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
