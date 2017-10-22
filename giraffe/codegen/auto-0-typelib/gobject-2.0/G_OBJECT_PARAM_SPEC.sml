signature G_OBJECT_PARAM_SPEC =
  sig
    type 'a class
    type value_t
    type t = base class
    val getBlurb : 'a class -> string
    val getDefaultValue : 'a class -> value_t
    val getName : 'a class -> string
    val getNameQuark : 'a class -> LargeInt.int
    val getNick : 'a class -> string
    val getRedirectTarget : 'a class -> base class
  end
