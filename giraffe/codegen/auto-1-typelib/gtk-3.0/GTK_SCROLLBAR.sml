signature GTK_SCROLLBAR =
  sig
    type 'a class_t
    type orientation_t
    type 'a adjustmentclass_t
    type 'a orientableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      orientation_t
       -> 'a adjustmentclass_t option
       -> base class_t
  end
