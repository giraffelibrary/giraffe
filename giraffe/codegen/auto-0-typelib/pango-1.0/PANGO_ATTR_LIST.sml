signature PANGO_ATTR_LIST =
  sig
    type record_t
    type attribute_record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val change :
      record_t
       -> attribute_record_t
       -> unit
    val copy : record_t -> record_t
    val insert :
      record_t
       -> attribute_record_t
       -> unit
    val insertBefore :
      record_t
       -> attribute_record_t
       -> unit
    val splice :
      record_t
       -> record_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
  end
