signature GTK_MENU_BAR =
  sig
    type 'a class_t
    type packdirection_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getChildPackDirection : 'a class_t -> packdirection_t
    val getPackDirection : 'a class_t -> packdirection_t
    val setChildPackDirection :
      'a class_t
       -> packdirection_t
       -> unit
    val setPackDirection :
      'a class_t
       -> packdirection_t
       -> unit
    val childPackDirectionProp : ('a class_t, packdirection_t, packdirection_t) Property.readwrite
    val packDirectionProp : ('a class_t, packdirection_t, packdirection_t) Property.readwrite
  end
