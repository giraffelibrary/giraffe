signature GTK_ASPECT_FRAME =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * real
       * real
       * real
       * bool
       -> base class
    val set :
      'a class
       -> real
           * real
           * real
           * bool
       -> unit
    val obeyChildProp : ('a class, bool, bool) Property.readwrite
    val ratioProp : ('a class, real, real) Property.readwrite
    val xalignProp : ('a class, real, real) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
  end
