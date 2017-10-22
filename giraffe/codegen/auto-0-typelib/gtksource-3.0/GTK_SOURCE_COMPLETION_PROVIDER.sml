signature GTK_SOURCE_COMPLETION_PROVIDER =
  sig
    type 'a class
    type completion_activation_t
    type 'a completion_context_class
    type 'a completion_info_class
    type 'a completion_proposal_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activateProposal :
      'a class
       -> 'b completion_proposal_class * Gtk.TextIterRecord.t
       -> bool
    val getActivation : 'a class -> completion_activation_t
    val getGicon : 'a class -> base Gio.IconClass.class option
    val getIcon : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getIconName : 'a class -> string option
    val getInfoWidget :
      'a class
       -> 'b completion_proposal_class
       -> base Gtk.WidgetClass.class option
    val getInteractiveDelay : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getPriority : 'a class -> LargeInt.int
    val getStartIter :
      'a class
       -> 'b completion_context_class * 'c completion_proposal_class
       -> Gtk.TextIterRecord.t option
    val match :
      'a class
       -> 'b completion_context_class
       -> bool
    val populate :
      'a class
       -> 'b completion_context_class
       -> unit
    val updateInfo :
      'a class
       -> 'b completion_proposal_class * 'c completion_info_class
       -> unit
  end
