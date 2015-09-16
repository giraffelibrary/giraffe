signature GTK_ACCESSIBLE =
  sig
    type 'a class_t
    type 'a widget_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val connectWidgetDestroyed : 'a class_t -> unit
    val getWidget : 'a class_t -> base widget_class_t
    val setWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
  end
