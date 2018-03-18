signature GTK_ARROW =
  sig
    type 'a class
    type 'a buildable_class
    type arrow_type_t
    type shadow_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : arrow_type_t * shadow_type_t -> base class
    val set :
      'a class
       -> arrow_type_t * shadow_type_t
       -> unit
    val arrowTypeProp :
      {
        get : 'a class -> arrow_type_t,
        set :
          arrow_type_t
           -> 'a class
           -> unit,
        new : arrow_type_t -> 'a class Property.t
      }
    val shadowTypeProp :
      {
        get : 'a class -> shadow_type_t,
        set :
          shadow_type_t
           -> 'a class
           -> unit,
        new : shadow_type_t -> 'a class Property.t
      }
  end
