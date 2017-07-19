signature G_LIB_ERROR =
  sig
    type t
    type quark_t
    val getType : unit -> GObject.Type.t
    val matches :
      t
       -> quark_t * LargeInt.int
       -> bool
  end
