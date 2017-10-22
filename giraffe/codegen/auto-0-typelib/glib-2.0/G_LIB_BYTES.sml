signature G_LIB_BYTES =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : Word8Vector.vector option -> t
    val compare :
      t
       -> t
       -> LargeInt.int
    val equal :
      t
       -> t
       -> bool
    val getData : t -> Word8Vector.vector option
    val getSize : t -> LargeInt.int
    val hash : t -> LargeInt.int
    val newFromBytes :
      t
       -> LargeInt.int * LargeInt.int
       -> t
    val unrefToData : t -> Word8Vector.vector
  end
