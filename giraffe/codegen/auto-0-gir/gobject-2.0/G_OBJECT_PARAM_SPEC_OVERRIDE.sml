signature G_OBJECT_PARAM_SPEC_OVERRIDE =
  sig
    type 'a class
    type type_t
    type t = base class
    val getType : unit -> type_t
  end
