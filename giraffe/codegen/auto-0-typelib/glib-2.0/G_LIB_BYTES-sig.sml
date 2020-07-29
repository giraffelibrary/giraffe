signature G_LIB_BYTES =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : GUInt8CArrayN.t option -> t
    val newTake : GUInt8CArrayN.t option -> t
    val compare :
      t
       -> t
       -> LargeInt.int
    val equal :
      t
       -> t
       -> bool
    val getData : t -> GUInt8CArrayN.t option
    val getSize : t -> LargeInt.int
    val hash : t -> LargeInt.int
    val newFromBytes :
      t
       -> LargeInt.int * LargeInt.int
       -> t
    val unrefToData : t -> GUInt8CArrayN.t
  end
