signature GTK_RADIO_TOOL_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val newFromWidget : 'a class option -> base class
    val newWithStockFromWidget : 'a class option * string -> base class
    val groupProp : ('a class, 'b class option) Property.writeonly
  end
