signature GTK_MISC =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val getAlignment : 'a class -> real * real
    val getPadding : 'a class -> LargeInt.int * LargeInt.int
    val setAlignment :
      'a class
       -> real * real
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val xalignProp : ('a class, real, real) Property.readwrite
    val xpadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
    val ypadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
