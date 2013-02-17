signature G_I_REPOSITORY_REGISTERED_TYPE_INFO =
  sig
    type 'a class_t
    val getTypeName : 'a class_t -> string option
    val getTypeInit : 'a class_t -> string option
    val getGType : 'a class_t -> GObject.Type.t
  end
