signature PANGO_ATTR_LIST =
  sig
    type record_t
    type attributerecord_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val change :
      record_t
       -> attributerecord_t
       -> unit
    val copy : record_t -> record_t
    val insert :
      record_t
       -> attributerecord_t
       -> unit
    val insertBefore :
      record_t
       -> attributerecord_t
       -> unit
    val splice :
      record_t
       -> record_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
  end
