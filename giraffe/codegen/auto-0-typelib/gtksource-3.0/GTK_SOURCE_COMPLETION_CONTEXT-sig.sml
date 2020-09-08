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
    val activationProp : ('a class, unit -> completion_activation_t, completion_activation_t -> unit, completion_activation_t -> unit) Property.t
    val completionProp : ('a class, unit -> base completion_class option, unit, 'b completion_class option -> unit) Property.t
    val iterProp : ('a class, unit -> Gtk.TextIterRecord.t option, Gtk.TextIterRecord.t option -> unit, Gtk.TextIterRecord.t option -> unit) Property.t
  end
