signature GDK_RGBA =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val equal :
      record_t
       -> record_t
       -> bool
    val hash : record_t -> LargeInt.int
    val parse :
      record_t
       -> string
       -> bool
    val toString : record_t -> string
  end
