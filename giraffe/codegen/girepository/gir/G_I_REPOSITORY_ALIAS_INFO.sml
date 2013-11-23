signature G_I_REPOSITORY_ALIAS_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    val getType : 'a class_t -> base typeinfoclass_t
  end
