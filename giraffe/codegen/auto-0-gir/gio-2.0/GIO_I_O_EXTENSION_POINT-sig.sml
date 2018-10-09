signature GIO_I_O_EXTENSION_POINT =
  sig
    type t
    type i_o_extension_t
    val getExtensionByName :
      t
       -> string
       -> i_o_extension_t
    val getRequiredType : t -> GObject.Type.t
    val setRequiredType :
      t
       -> GObject.Type.t
       -> unit
    val implement :
      string
       * GObject.Type.t
       * string
       * LargeInt.int
       -> i_o_extension_t
    val lookup : string -> t
    val register : string -> t
  end
