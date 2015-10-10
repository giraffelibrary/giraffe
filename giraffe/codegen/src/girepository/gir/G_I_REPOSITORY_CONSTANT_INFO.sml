signature G_I_REPOSITORY_CONSTANT_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type argument_t
    val getType : 'a class_t -> base typeinfoclass_t
    val getValue : 'a class_t -> argument_t
  end
