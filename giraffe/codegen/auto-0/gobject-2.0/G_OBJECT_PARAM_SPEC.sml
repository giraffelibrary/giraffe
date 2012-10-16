signature G_OBJECT_PARAM_SPEC =
  sig
    type 'a class_t
    type type_t
    val getType : unit -> type_t
    val getBlurb : 'a class_t -> string
    val getName : 'a class_t -> string
    val getNick : 'a class_t -> string
    val getQdata :
      'a class_t
       -> LargeInt.int
       -> unit
    val getRedirectTarget : 'a class_t -> base class_t
    val setQdata :
      'a class_t
       -> LargeInt.int
       -> unit
    val stealQdata :
      'a class_t
       -> LargeInt.int
       -> unit
  end
