signature GTK_SPINNER =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val start : 'a class -> unit
    val stop : 'a class -> unit
    val activeProp : ('a class, bool, bool) Property.readwrite
  end
