signature GIO_I_O_EXTENSION_POINT =
  sig
    type t
    type i_o_extension_t
    val getExtensionByName :
      t
       -> string
       -> i_o_extension_t
    val lookup : string -> t
    val register : string -> t
  end
