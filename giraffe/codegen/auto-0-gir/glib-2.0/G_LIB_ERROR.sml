signature G_LIB_ERROR =
  sig
    type record_t
    type quark_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val matches :
      record_t
       -> quark_t
       -> LargeInt.int
       -> bool
  end
