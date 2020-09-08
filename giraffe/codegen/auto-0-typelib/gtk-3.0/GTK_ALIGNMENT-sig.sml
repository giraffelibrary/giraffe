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
       * real
       * real
       * real
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
           * real
           * real
           * real
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val bottomPaddingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val leftPaddingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val rightPaddingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val topPaddingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val xalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val xscaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val yalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val yscaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
  end
