signature GTK_MISC =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val getAlignment : 'a class_t -> real * real
    val getPadding : 'a class_t -> LargeInt.int * LargeInt.int
    val setAlignment :
      'a class_t
       -> real
       -> real
       -> unit
    val setPadding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val xpadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
    val ypadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
