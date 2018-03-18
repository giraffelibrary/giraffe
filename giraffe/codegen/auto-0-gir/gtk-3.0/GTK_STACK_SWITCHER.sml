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
    val getStack : 'a class -> base stack_class option
    val setStack :
      'a class
       -> 'b stack_class option
       -> unit
    val iconSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val stackProp :
      {
        get : 'a class -> base stack_class option,
        set :
          'b stack_class option
           -> 'a class
           -> unit,
        new : 'b stack_class option -> 'a class Property.t
      }
  end
