signature GDK_COLOR =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val equal :
      record_t
       -> record_t
       -> bool
    val hash : record_t -> LargeInt.int
    val toString : record_t -> string
    val parse : string -> record_t option
  end
