signature GTK_FIXED =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val move :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val put :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
  end
