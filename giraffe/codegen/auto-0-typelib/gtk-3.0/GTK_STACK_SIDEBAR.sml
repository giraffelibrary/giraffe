signature GTK_STACK_SIDEBAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a stack_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getStack : 'a class -> base stack_class option
    val setStack :
      'a class
       -> 'b stack_class
       -> unit
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
