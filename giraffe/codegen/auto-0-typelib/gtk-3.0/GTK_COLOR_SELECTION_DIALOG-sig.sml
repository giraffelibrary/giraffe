signature GTK_COLOR_SELECTION_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getColorSelection : 'a class -> base widget_class
    val cancelButtonProp : {get : 'a class -> base widget_class option}
    val colorSelectionProp : {get : 'a class -> base widget_class option}
    val helpButtonProp : {get : 'a class -> base widget_class option}
    val okButtonProp : {get : 'a class -> base widget_class option}
  end
