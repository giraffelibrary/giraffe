signature GTK_SPINNER =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val activeProp : ('a class_t, bool, bool) Property.readwrite
  end
