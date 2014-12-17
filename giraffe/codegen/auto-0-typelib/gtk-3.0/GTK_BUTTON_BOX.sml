signature GTK_BUTTON_BOX =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type orientation_t
    type 'a widgetclass_t
    type buttonboxstyle_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class_t
    val getChildNonHomogeneous :
      'a class_t
       -> 'b widgetclass_t
       -> bool
    val getChildSecondary :
      'a class_t
       -> 'b widgetclass_t
       -> bool
    val getLayout : 'a class_t -> buttonboxstyle_t
    val setChildNonHomogeneous :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val setChildSecondary :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val setLayout :
      'a class_t
       -> buttonboxstyle_t
       -> unit
    val layoutStyleProp : ('a class_t, buttonboxstyle_t, buttonboxstyle_t) Property.readwrite
  end
