signature GTK_BUTTON_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type orientation_t
    type 'a widget_class
    type button_box_style_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class
    val getChildNonHomogeneous :
      'a class
       -> 'b widget_class
       -> bool
    val getChildSecondary :
      'a class
       -> 'b widget_class
       -> bool
    val getLayout : 'a class -> button_box_style_t
    val setChildNonHomogeneous :
      'a class
       -> 'b widget_class
       -> bool
       -> unit
    val setChildSecondary :
      'a class
       -> 'b widget_class
       -> bool
       -> unit
    val setLayout :
      'a class
       -> button_box_style_t
       -> unit
    val layoutStyleProp : ('a class, button_box_style_t, button_box_style_t) Property.readwrite
  end
