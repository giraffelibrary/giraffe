signature GTK_STACK_SWITCHER =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a stack_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getStack : 'a class -> base stack_class
    val setStack :
      'a class
       -> 'b stack_class option
       -> unit
    val iconSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val stackProp : ('a class, base stack_class option, 'b stack_class option) Property.readwrite
  end
