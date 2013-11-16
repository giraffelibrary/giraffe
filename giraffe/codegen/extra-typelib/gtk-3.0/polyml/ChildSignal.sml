structure ChildSignal :>
  CHILD_SIGNAL
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    type 'a widgetclass_t = 'a GtkWidgetClass.t

    fun connect parent object signal f =
      let
        val id = Signal.connect object signal f
      in
        Signal.connect
          parent
          GtkWidget.destroySig
          (fn () => Signal.disconnect object id);
        ()
      end

    fun connectAfter parent object signal f =
      let
        val id = Signal.connect object signal f
      in
        Signal.connectAfter
          parent
          GtkWidget.destroySig
          (fn () => Signal.disconnect object id);
        ()
      end
  end
