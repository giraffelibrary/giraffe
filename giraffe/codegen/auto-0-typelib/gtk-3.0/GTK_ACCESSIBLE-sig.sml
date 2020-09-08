signature GTK_ACCESSIBLE =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val connectWidgetDestroyed : 'a class -> unit
    val getWidget : 'a class -> base widget_class option
    val setWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val widgetProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
  end
