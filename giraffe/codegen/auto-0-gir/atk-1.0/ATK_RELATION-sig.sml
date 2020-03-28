signature ATK_RELATION =
  sig
    type 'a class
    type object_class_c_array_n_t
    type 'a object_class
    type relation_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : object_class_c_array_n_t * relation_type_t -> base class
    val addTarget :
      'a class
       -> 'b object_class
       -> unit
    val getRelationType : 'a class -> relation_type_t
    val removeTarget :
      'a class
       -> 'b object_class
       -> bool
    val relationTypeProp :
      {
        get : 'a class -> relation_type_t,
        set :
          relation_type_t
           -> 'a class
           -> unit,
        new : relation_type_t -> 'a class Property.t
      }
    val targetProp :
      {
        get : 'a class -> GObject.ValueArrayRecord.t option,
        set :
          GObject.ValueArrayRecord.t option
           -> 'a class
           -> unit,
        new : GObject.ValueArrayRecord.t option -> 'a class Property.t
      }
  end
