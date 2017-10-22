signature GTK_SOURCE_COMPLETION_CONTEXT =
  sig
    type 'a class
    type completion_activation_t
    type 'a completion_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getActivation : 'a class -> completion_activation_t
    val getIter : 'a class -> Gtk.TextIterRecord.t option
    val cancelledSig : (unit -> unit) -> 'a class Signal.t
    val activationProp : ('a class, completion_activation_t, completion_activation_t) Property.readwrite
    val completionProp : ('a class, base completion_class option, 'b completion_class option) Property.readwrite
    val iterProp : ('a class, Gtk.TextIterRecord.t option, Gtk.TextIterRecord.t option) Property.readwrite
  end
