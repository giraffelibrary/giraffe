signature GTK_ALIGNMENT =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      real
       -> real
       -> real
       -> real
       -> base class_t
    val getPadding :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val set :
      'a class_t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val setPadding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val bottomPaddingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val leftPaddingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rightPaddingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val topPaddingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val xscaleProp : ('a class_t, real, real) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
    val yscaleProp : ('a class_t, real, real) Property.readwrite
  end
