signature GTK_ASPECT_FRAME =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      string option
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
    val obeyChildProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val ratioProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val xalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val yalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
  end
