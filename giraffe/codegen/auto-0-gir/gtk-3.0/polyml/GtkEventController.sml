structure GtkEventController :>
  GTK_EVENT_CONTROLLER
    where type 'a class = 'a GtkEventControllerClass.class
    where type propagation_phase_t = GtkPropagationPhase.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_event_controller_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getPropagationPhase_ = call (getSymbol "gtk_event_controller_get_propagation_phase") (GtkEventControllerClass.PolyML.cPtr --> GtkPropagationPhase.PolyML.cVal)
      val getWidget_ = call (getSymbol "gtk_event_controller_get_widget") (GtkEventControllerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val handleEvent_ = call (getSymbol "gtk_event_controller_handle_event") (GtkEventControllerClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
      val reset_ = call (getSymbol "gtk_event_controller_reset") (GtkEventControllerClass.PolyML.cPtr --> cVoid)
      val setPropagationPhase_ = call (getSymbol "gtk_event_controller_set_propagation_phase") (GtkEventControllerClass.PolyML.cPtr &&> GtkPropagationPhase.PolyML.cVal --> cVoid)
    end
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
