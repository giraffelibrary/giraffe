signature GTK_TREE_SORTABLE =
  sig
    type 'a class_t
    type sorttype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getSortColumnId : 'a class_t -> (LargeInt.int * sorttype_t) option
    val hasDefaultSortFunc : 'a class_t -> bool
    val setSortColumnId :
      'a class_t
       -> LargeInt.int
       -> sorttype_t
       -> unit
    val sortColumnChanged : 'a class_t -> unit
    val sortColumnChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
