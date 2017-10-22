signature GTK_CONTAINER_CELL_ACCESSIBLE =
  sig
    type 'a class
    type 'a cell_accessible_class
    type t = base class
    val asAction : 'a class -> base Atk.ActionClass.class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addChild :
      'a class
       -> 'b cell_accessible_class
       -> unit
    val removeChild :
      'a class
       -> 'b cell_accessible_class
       -> unit
  end
