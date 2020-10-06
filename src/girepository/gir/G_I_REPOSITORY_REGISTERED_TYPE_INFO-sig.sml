signature G_I_REPOSITORY_REGISTERED_TYPE_INFO =
  sig
    type 'a class
    val getCType : 'a class -> string option    (* GIR only *)
    val getTypeName : 'a class -> string option
    val getTypeInit : 'a class -> string option
  end
