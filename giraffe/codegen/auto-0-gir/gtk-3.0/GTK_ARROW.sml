signature GTK_ARROW =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type arrow_type_t
    type shadow_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      arrow_type_t
       -> shadow_type_t
       -> base class_t
    val set :
      'a class_t
       -> arrow_type_t
       -> shadow_type_t
       -> unit
    val arrowTypeProp : ('a class_t, arrow_type_t, arrow_type_t) Property.readwrite
    val shadowTypeProp : ('a class_t, shadow_type_t, shadow_type_t) Property.readwrite
  end
