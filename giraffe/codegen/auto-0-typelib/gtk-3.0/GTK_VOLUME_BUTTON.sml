signature GTK_VOLUME_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val useSymbolicProp : ('a class_t, bool, bool) Property.readwrite
  end
