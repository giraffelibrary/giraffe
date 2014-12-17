signature G_OBJECT_PARAM_SPEC =
  sig
    type 'a class_t
    type type_t
    type t = base class_t
    val getType : unit -> type_t
    val getBlurb : 'a class_t -> string
    val getName : 'a class_t -> string
    val getNick : 'a class_t -> string
    val getRedirectTarget : 'a class_t -> base class_t
  end
