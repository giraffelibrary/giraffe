signature GTK_ARROW =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type arrowtype_t
    type shadowtype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      arrowtype_t
       -> shadowtype_t
       -> base class_t
    val set :
      'a class_t
       -> arrowtype_t
       -> shadowtype_t
       -> unit
    val arrowTypeProp : ('a class_t, arrowtype_t, arrowtype_t) Property.readwrite
    val shadowTypeProp : ('a class_t, shadowtype_t, shadowtype_t) Property.readwrite
  end
