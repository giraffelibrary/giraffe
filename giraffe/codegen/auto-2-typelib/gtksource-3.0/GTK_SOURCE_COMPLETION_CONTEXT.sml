signature GTK_SOURCE_COMPLETION_CONTEXT =
  sig
    type 'a class_t
    type 'a completionclass_t
    type completionactivation_t
    val getType : unit -> GObject.Type.t
    val getActivation : 'a class_t -> completionactivation_t
    val getIter : 'a class_t -> Gtk.TextIterRecord.t
    val cancelledSig : (unit -> unit) -> 'a class_t Signal.signal
    val activationProp : ('a class_t, completionactivation_t, completionactivation_t) Property.readwrite
    val completionProp : ('a class_t, base completionclass_t option, 'b completionclass_t option) Property.readwrite
    val iterProp : ('a class_t, Gtk.TextIterRecord.t option, Gtk.TextIterRecord.t option) Property.readwrite
  end
