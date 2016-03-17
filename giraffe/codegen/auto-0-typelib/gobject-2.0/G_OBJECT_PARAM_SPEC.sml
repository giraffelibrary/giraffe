signature G_OBJECT_PARAM_SPEC =
  sig
    type 'a class
    type type_t
    type t = base class
    val getType : unit -> type_t
    val getBlurb : 'a class -> string
    val getName : 'a class -> string
    val getNick : 'a class -> string
    val getRedirectTarget : 'a class -> base class
  end
