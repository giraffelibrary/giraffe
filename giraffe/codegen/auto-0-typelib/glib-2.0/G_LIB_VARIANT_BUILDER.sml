signature G_LIB_VARIANT_BUILDER =
  sig
    type t
    type variant_t
    type variant_type_t
    val getType : unit -> GObject.Type.t
    val new : variant_type_t -> t
    val addValue :
      t
       -> variant_t
       -> unit
    val close : t -> unit
    val end' : t -> variant_t
    val open' :
      t
       -> variant_type_t
       -> unit
  end
