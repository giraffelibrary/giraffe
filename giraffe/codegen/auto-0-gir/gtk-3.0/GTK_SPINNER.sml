signature GTK_SPINNER =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val activeProp : ('a class_t, bool, bool) Property.readwrite
  end
