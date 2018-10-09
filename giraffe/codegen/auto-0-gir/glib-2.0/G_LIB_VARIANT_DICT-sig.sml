signature G_LIB_VARIANT_DICT =
  sig
    type t
    type variant_t
    type variant_type_t
    val getType : unit -> GObject.Type.t
    val new : variant_t option -> t
    val clear : t -> unit
    val contains :
      t
       -> string
       -> bool
    val end' : t -> variant_t
    val insertValue :
      t
       -> string * variant_t
       -> unit
    val lookupValue :
      t
       -> string * variant_type_t option
       -> variant_t
    val remove :
      t
       -> string
       -> bool
  end
