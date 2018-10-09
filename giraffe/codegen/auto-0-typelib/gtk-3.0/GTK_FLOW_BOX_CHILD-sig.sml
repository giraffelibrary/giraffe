signature GTK_FLOW_BOX_CHILD =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changed : 'a class -> unit
    val getIndex : 'a class -> LargeInt.int
    val isSelected : 'a class -> bool
    val activateSig : (unit -> unit) -> 'a class Signal.t
  end
