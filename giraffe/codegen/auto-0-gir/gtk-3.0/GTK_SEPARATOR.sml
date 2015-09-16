signature GTK_SEPARATOR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type orientation_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class_t
  end
