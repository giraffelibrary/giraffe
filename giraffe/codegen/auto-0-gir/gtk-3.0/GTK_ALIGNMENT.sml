signature GTK_ALIGNMENT =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      real
       -> real
       -> real
       -> real
       -> base class
    val getPadding :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val set :
      'a class
       -> real
       -> real
       -> real
       -> real
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val bottomPaddingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val leftPaddingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val rightPaddingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val topPaddingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class, real, real) Property.readwrite
    val xscaleProp : ('a class, real, real) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
    val yscaleProp : ('a class, real, real) Property.readwrite
  end
