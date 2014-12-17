signature G_OBJECT_PARAM_SPEC_FLOAT =
  sig
    type 'a class_t
    type type_t
    type t = base class_t
    val getType : unit -> type_t
  end
