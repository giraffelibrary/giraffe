signature G_OBJECT_TYPE_MODULE =
  sig
    type 'a class_t
    type 'a typepluginclass_t
    type type_t
    type t = base class_t
    val asTypePlugin : 'a class_t -> base typepluginclass_t
    val getType : unit -> type_t
    val setName :
      'a class_t
       -> string
       -> unit
    val unuse : 'a class_t -> unit
    val use : 'a class_t -> bool
  end
