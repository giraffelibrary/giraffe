signature GTK_MENU_BAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type pack_direction_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getChildPackDirection : 'a class_t -> pack_direction_t
    val getPackDirection : 'a class_t -> pack_direction_t
    val setChildPackDirection :
      'a class_t
       -> pack_direction_t
       -> unit
    val setPackDirection :
      'a class_t
       -> pack_direction_t
       -> unit
    val childPackDirectionProp : ('a class_t, pack_direction_t, pack_direction_t) Property.readwrite
    val packDirectionProp : ('a class_t, pack_direction_t, pack_direction_t) Property.readwrite
  end
