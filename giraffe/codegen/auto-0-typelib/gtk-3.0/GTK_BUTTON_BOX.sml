signature GTK_BUTTON_BOX =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type orientation_t
    type 'a widget_class_t
    type button_box_style_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class_t
    val getChildNonHomogeneous :
      'a class_t
       -> 'b widget_class_t
       -> bool
    val getChildSecondary :
      'a class_t
       -> 'b widget_class_t
       -> bool
    val getLayout : 'a class_t -> button_box_style_t
    val setChildNonHomogeneous :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> unit
    val setChildSecondary :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> unit
    val setLayout :
      'a class_t
       -> button_box_style_t
       -> unit
    val layoutStyleProp : ('a class_t, button_box_style_t, button_box_style_t) Property.readwrite
  end
