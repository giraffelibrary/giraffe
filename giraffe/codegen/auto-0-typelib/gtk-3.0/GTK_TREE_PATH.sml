signature GTK_TREE_PATH =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val newFirst : unit -> record_t
    val newFromString : string -> record_t
    val appendIndex :
      record_t
       -> LargeInt.int
       -> unit
    val compare :
      record_t
       -> record_t
       -> LargeInt.int
    val copy : record_t -> record_t
    val down : record_t -> unit
    val getDepth : record_t -> LargeInt.int
    val isAncestor :
      record_t
       -> record_t
       -> bool
    val isDescendant :
      record_t
       -> record_t
       -> bool
    val next : record_t -> unit
    val prependIndex :
      record_t
       -> LargeInt.int
       -> unit
    val prev : record_t -> bool
    val toString : record_t -> string
    val up : record_t -> bool
  end
