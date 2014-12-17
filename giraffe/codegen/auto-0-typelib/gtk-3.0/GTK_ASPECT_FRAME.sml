signature GTK_ASPECT_FRAME =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> real
       -> real
       -> real
       -> bool
       -> base class_t
    val set :
      'a class_t
       -> real
       -> real
       -> real
       -> bool
       -> unit
    val obeyChildProp : ('a class_t, bool, bool) Property.readwrite
    val ratioProp : ('a class_t, real, real) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
  end
