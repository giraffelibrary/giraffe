signature GTK_TARGET_ENTRY =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> record_t
    val copy : record_t -> record_t
  end
