signature G_LIB_ERROR =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val matches :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
  end
