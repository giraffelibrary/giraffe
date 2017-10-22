signature GTK_ACTION_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getCenterWidget : 'a class -> base widget_class
    val packEnd :
      'a class
       -> 'b widget_class
       -> unit
    val packStart :
      'a class
       -> 'b widget_class
       -> unit
    val setCenterWidget :
      'a class
       -> 'b widget_class option
       -> unit
  end
