signature GTK_MENU_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type pack_direction_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getChildPackDirection : 'a class -> pack_direction_t
    val getPackDirection : 'a class -> pack_direction_t
    val setChildPackDirection :
      'a class
       -> pack_direction_t
       -> unit
    val setPackDirection :
      'a class
       -> pack_direction_t
       -> unit
    val childPackDirectionProp : ('a class, pack_direction_t, pack_direction_t) Property.readwrite
    val packDirectionProp : ('a class, pack_direction_t, pack_direction_t) Property.readwrite
  end
