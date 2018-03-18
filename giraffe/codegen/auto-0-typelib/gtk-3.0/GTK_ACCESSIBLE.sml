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
    val widgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
  end
