signature G_LIB_ERROR =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val matches :
      t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
  end
