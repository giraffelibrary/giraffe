signature GTK_CHECK_MENU_ITEM =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val getActive : 'a class -> bool
    val getDrawAsRadio : 'a class -> bool
    val getInconsistent : 'a class -> bool
    val setActive :
      'a class
       -> bool
       -> unit
    val setDrawAsRadio :
      'a class
       -> bool
       -> unit
    val setInconsistent :
      'a class
       -> bool
       -> unit
    val toggled : 'a class -> unit
    val toggledSig : (unit -> unit) -> 'a class Signal.signal
    val activeProp : ('a class, bool, bool) Property.readwrite
    val drawAsRadioProp : ('a class, bool, bool) Property.readwrite
    val inconsistentProp : ('a class, bool, bool) Property.readwrite
  end
