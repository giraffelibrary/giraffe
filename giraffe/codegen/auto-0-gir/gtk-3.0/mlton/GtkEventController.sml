structure GtkEventController :>
  GTK_EVENT_CONTROLLER
    where type 'a class = 'a GtkEventControllerClass.class
    where type propagation_phase_t = GtkPropagationPhase.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_event_controller_get_type" : unit -> GObjectType.FFI.val_;
    val getPropagationPhase_ = _import "gtk_event_controller_get_propagation_phase" : GtkEventControllerClass.FFI.non_opt GtkEventControllerClass.FFI.p -> GtkPropagationPhase.FFI.val_;
    val getWidget_ = _import "gtk_event_controller_get_widget" : GtkEventControllerClass.FFI.non_opt GtkEventControllerClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val handleEvent_ = fn x1 & x2 => (_import "gtk_event_controller_handle_event" : GtkEventControllerClass.FFI.non_opt GtkEventControllerClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val reset_ = _import "gtk_event_controller_reset" : GtkEventControllerClass.FFI.non_opt GtkEventControllerClass.FFI.p -> unit;
    val setPropagationPhase_ = fn x1 & x2 => (_import "gtk_event_controller_set_propagation_phase" : GtkEventControllerClass.FFI.non_opt GtkEventControllerClass.FFI.p * GtkPropagationPhase.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEventControllerClass.class
    type propagation_phase_t = GtkPropagationPhase.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getPropagationPhase self = (GtkEventControllerClass.FFI.withPtr false ---> GtkPropagationPhase.FFI.fromVal) getPropagationPhase_ self
    fun getWidget self = (GtkEventControllerClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self before GtkEventControllerClass.FFI.touchPtr self
    fun handleEvent self event = (GtkEventControllerClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    fun reset self = (GtkEventControllerClass.FFI.withPtr false ---> I) reset_ self
    fun setPropagationPhase self phase = (GtkEventControllerClass.FFI.withPtr false &&&> GtkPropagationPhase.FFI.withVal ---> I) setPropagationPhase_ (self & phase)
    local
      open ValueAccessor
    in
      val propagationPhaseProp =
        {
          name = "propagation-phase",
          gtype = fn () => C.gtype GtkPropagationPhase.t (),
          get = fn x => fn () => C.get GtkPropagationPhase.t x,
          set = fn x => C.set GtkPropagationPhase.t x,
          init = fn x => C.set GtkPropagationPhase.t x
        }
      val widgetProp =
        {
          name = "widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
    end
  end
