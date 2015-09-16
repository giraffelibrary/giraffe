signature GTK_SOURCE_COMPLETION_CONTEXT =
  sig
    type 'a class_t
    type completion_activation_t
    type 'a completion_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getActivation : 'a class_t -> completion_activation_t
    val getIter : 'a class_t -> Gtk.TextIterRecord.t
    val cancelledSig : (unit -> unit) -> 'a class_t Signal.signal
    val activationProp : ('a class_t, completion_activation_t, completion_activation_t) Property.readwrite
    val completionProp : ('a class_t, base completion_class_t option, 'b completion_class_t option) Property.readwrite
    val iterProp : ('a class_t, Gtk.TextIterRecord.t option, Gtk.TextIterRecord.t option) Property.readwrite
  end
