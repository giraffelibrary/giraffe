signature GTK_TREE_PATH =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val newFirst : unit -> t
    val newFromIndices : LargeInt.int vector -> t
    val newFromString : string -> t
    val appendIndex :
      t
       -> LargeInt.int
       -> unit
    val compare :
      t
       -> t
       -> LargeInt.int
    val copy : t -> t
    val down : t -> unit
    val getDepth : t -> LargeInt.int
    val getIndices : t -> LargeInt.int vector
    val isAncestor :
      t
       -> t
       -> bool
    val isDescendant :
      t
       -> t
       -> bool
    val next : t -> unit
    val prependIndex :
      t
       -> LargeInt.int
       -> unit
    val prev : t -> bool
    val toString : t -> string
    val up : t -> bool
  end
