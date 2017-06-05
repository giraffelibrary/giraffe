signature G_OBJECT_BINDING_FLAGS =
  sig
    include FLAGS
    val DEFAULT : t
    val BIDIRECTIONAL : t
    val SYNC_CREATE : t
    val INVERT_BOOLEAN : t
    type ('a, 'b) value_accessor
    val t : (t, t) value_accessor
    type type_t
    val getType : unit -> type_t
  end
