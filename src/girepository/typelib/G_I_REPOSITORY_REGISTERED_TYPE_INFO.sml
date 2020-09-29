signature G_I_REPOSITORY_REGISTERED_TYPE_INFO =
  sig
    type 'a class
    val getTypeName : 'a class -> string option
    val getTypeInit : 'a class -> string option
    val getGType : 'a class -> GObject.Type.t
  end
