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
    val activationProp :
      {
        get : 'a class -> completion_activation_t,
        set :
          completion_activation_t
           -> 'a class
           -> unit,
        new : completion_activation_t -> 'a class Property.t
      }
    val completionProp :
      {
        get : 'a class -> base completion_class option,
        new : 'b completion_class option -> 'a class Property.t
      }
    val iterProp :
      {
        get : 'a class -> Gtk.TextIterRecord.t option,
        set :
          Gtk.TextIterRecord.t option
           -> 'a class
           -> unit,
        new : Gtk.TextIterRecord.t option -> 'a class Property.t
      }
  end
