signature GTK_TREE_SORTABLE =
  sig
    type 'a class
    type sort_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getSortColumnId : 'a class -> (LargeInt.int * sort_type_t) option
    val hasDefaultSortFunc : 'a class -> bool
    val setSortColumnId :
      'a class
       -> LargeInt.int * sort_type_t
       -> unit
    val sortColumnChanged : 'a class -> unit
    val sortColumnChangedSig : (unit -> unit) -> 'a class Signal.signal
  end
