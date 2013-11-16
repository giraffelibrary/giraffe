signature G_OBJECT_PARAM_SPEC_POINTER =
  sig
    type 'a class_t
    type type_t
    val getType : unit -> type_t
  end
