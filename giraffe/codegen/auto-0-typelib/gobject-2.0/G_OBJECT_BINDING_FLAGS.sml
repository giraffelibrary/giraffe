signature G_OBJECT_BINDING_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DEFAULT : t
    val BIDIRECTIONAL : t
    val SYNC_CREATE : t
    val INVERT_BOOLEAN : t
    type ('a, 'b) value_accessor
    val t : (t, t) value_accessor
    type type_t
    val getType : unit -> type_t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
