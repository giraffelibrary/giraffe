signature GTK_EVENT_CONTROLLER =
  sig
    type 'a class
    type propagation_phase_t
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getPropagationPhase : 'a class -> propagation_phase_t
    val getWidget : 'a class -> base widget_class
    val handleEvent :
      'a class
       -> 'b Gdk.Event.union
       -> bool
    val reset : 'a class -> unit
    val setPropagationPhase :
      'a class
       -> propagation_phase_t
       -> unit
    val propagationPhaseProp : ('a class, unit -> propagation_phase_t, propagation_phase_t -> unit, propagation_phase_t -> unit) Property.t
    val widgetProp : ('a class, unit -> base widget_class option, unit, 'b widget_class option -> unit) Property.t
  end
