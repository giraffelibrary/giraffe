signature GTK_SOURCE_COMPLETION_PROVIDER =
  sig
    type 'a class_t
    type completion_activation_t
    type 'a completion_context_class_t
    type 'a completion_info_class_t
    type 'a completion_proposal_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activateProposal :
      'a class_t
       -> 'b completion_proposal_class_t
       -> Gtk.TextIterRecord.t
       -> bool
    val getActivation : 'a class_t -> completion_activation_t
    val getIcon : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getInfoWidget :
      'a class_t
       -> 'b completion_proposal_class_t
       -> base Gtk.WidgetClass.t
    val getInteractiveDelay : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getPriority : 'a class_t -> LargeInt.int
    val getStartIter :
      'a class_t
       -> 'b completion_context_class_t
       -> 'c completion_proposal_class_t
       -> Gtk.TextIterRecord.t
       -> bool
    val match :
      'a class_t
       -> 'b completion_context_class_t
       -> bool
    val populate :
      'a class_t
       -> 'b completion_context_class_t
       -> unit
    val updateInfo :
      'a class_t
       -> 'b completion_proposal_class_t
       -> 'c completion_info_class_t
       -> unit
  end
