signature GTK_SOURCE_COMPLETION_PROVIDER =
  sig
    type 'a class_t
    type completionactivation_t
    type 'a completioncontextclass_t
    type 'a completioninfoclass_t
    type 'a completionproposalclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activateProposal :
      'a class_t
       -> 'b completionproposalclass_t
       -> Gtk.TextIterRecord.t
       -> bool
    val getActivation : 'a class_t -> completionactivation_t
    val getIcon : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getInfoWidget :
      'a class_t
       -> 'b completionproposalclass_t
       -> base Gtk.WidgetClass.t
    val getInteractiveDelay : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getPriority : 'a class_t -> LargeInt.int
    val getStartIter :
      'a class_t
       -> 'b completioncontextclass_t
       -> 'c completionproposalclass_t
       -> Gtk.TextIterRecord.t
       -> bool
    val match :
      'a class_t
       -> 'b completioncontextclass_t
       -> bool
    val populate :
      'a class_t
       -> 'b completioncontextclass_t
       -> unit
    val updateInfo :
      'a class_t
       -> 'b completionproposalclass_t
       -> 'c completioninfoclass_t
       -> unit
  end
