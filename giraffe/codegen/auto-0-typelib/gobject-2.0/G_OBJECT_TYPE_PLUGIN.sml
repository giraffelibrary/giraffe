signature G_OBJECT_TYPE_PLUGIN =
  sig
    type 'a class
    type type_t
    type t = base class
    val getType : unit -> type_t
    val unuse : 'a class -> unit
    val use : 'a class -> unit
  end
