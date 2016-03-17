signature GTK_ACCESSIBLE =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val connectWidgetDestroyed : 'a class -> unit
    val getWidget : 'a class -> base widget_class
    val setWidget :
      'a class
       -> 'b widget_class
       -> unit
  end
