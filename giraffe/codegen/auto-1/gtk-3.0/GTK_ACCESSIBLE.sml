signature GTK_ACCESSIBLE =
  sig
    type 'a class_t
    type 'a widgetclass_t
    val getType : unit -> GObject.Type.t
    val connectWidgetDestroyed : 'a class_t -> unit
    val getWidget : 'a class_t -> base widgetclass_t
    val setWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
  end
