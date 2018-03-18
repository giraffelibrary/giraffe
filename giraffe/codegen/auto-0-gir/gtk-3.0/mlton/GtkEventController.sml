structure GtkEventController :>
  GTK_EVENT_CONTROLLER
    where type 'a class = 'a GtkEventControllerClass.class
    where type propagation_phase_t = GtkPropagationPhase.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_event_controller_get_type" : unit -> GObjectType.FFI.val_;
    val getPropagationPhase_ = _import "gtk_event_controller_get_propagation_phase" : GtkEventControllerClass.FFI.notnull GtkEventControllerClass.FFI.p -> GtkPropagationPhase.FFI.val_;
    val getWidget_ = _import "gtk_event_controller_get_widget" : GtkEventControllerClass.FFI.notnull GtkEventControllerClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val handleEvent_ = fn x1 & x2 => (_import "gtk_event_controller_handle_event" : GtkEventControllerClass.FFI.notnull GtkEventControllerClass.FFI.p * GdkEvent.FFI.notnull GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val reset_ = _import "gtk_event_controller_reset" : GtkEventControllerClass.FFI.notnull GtkEventControllerClass.FFI.p -> unit;
    val setPropagationPhase_ = fn x1 & x2 => (_import "gtk_event_controller_set_propagation_phase" : GtkEventControllerClass.FFI.notnull GtkEventControllerClass.FFI.p * GtkPropagationPhase.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEventControllerClass.class
    type propagation_phase_t = GtkPropagationPhase.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getPropagationPhase self = (GtkEventControllerClass.FFI.withPtr ---> GtkPropagationPhase.FFI.fromVal) getPropagationPhase_ self
    fun getWidget self = (GtkEventControllerClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun handleEvent self event = (GtkEventControllerClass.FFI.withPtr &&&> GdkEvent.FFI.withPtr ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    fun reset self = (GtkEventControllerClass.FFI.withPtr ---> I) reset_ self
    fun setPropagationPhase self phase = (GtkEventControllerClass.FFI.withPtr &&&> GtkPropagationPhase.FFI.withVal ---> I) setPropagationPhase_ (self & phase)
    local
      open Property
    in
      val propagationPhaseProp =
        {
          get = fn x => get "propagation-phase" GtkPropagationPhase.t x,
          set = fn x => set "propagation-phase" GtkPropagationPhase.t x,
          new = fn x => new "propagation-phase" GtkPropagationPhase.t x
        }
      val widgetProp =
        {
          get = fn x => get "widget" GtkWidgetClass.tOpt x,
          new = fn x => new "widget" GtkWidgetClass.tOpt x
        }
    end
  end
