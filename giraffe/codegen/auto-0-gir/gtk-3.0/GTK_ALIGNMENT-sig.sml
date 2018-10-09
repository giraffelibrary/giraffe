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
    val bottomPaddingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val leftPaddingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rightPaddingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val topPaddingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val xalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val xscaleProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val yalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val yscaleProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
