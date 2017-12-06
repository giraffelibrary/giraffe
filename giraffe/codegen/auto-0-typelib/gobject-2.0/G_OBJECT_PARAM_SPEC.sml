signature G_OBJECT_PARAM_SPEC =
  sig
    type 'a class
    type t = base class
    val getBlurb : 'a class -> string
    val getName : 'a class -> string
    val getNick : 'a class -> string
    val getRedirectTarget : 'a class -> base class
  end
