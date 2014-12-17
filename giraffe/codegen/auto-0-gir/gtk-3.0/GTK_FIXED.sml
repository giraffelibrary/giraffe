signature GTK_FIXED =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val move :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val put :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
  end
