signature PANGO_ATTR_LIST =
  sig
    type t
    type attribute_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val change :
      t
       -> attribute_t
       -> unit
    val copy : t -> t
    val insert :
      t
       -> attribute_t
       -> unit
    val insertBefore :
      t
       -> attribute_t
       -> unit
    val splice :
      t
       -> t
           * LargeInt.int
           * LargeInt.int
       -> unit
  end
