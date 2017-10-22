signature GTK_TREE_MODEL =
  sig
    type 'a class
    type tree_model_flags_t
    type tree_iter_t
    type tree_path_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val filterNew :
      'a class
       -> tree_path_t option
       -> base class
    val getFlags : 'a class -> tree_model_flags_t
    val getIter :
      'a class
       -> tree_path_t
       -> tree_iter_t option
    val getIterFirst : 'a class -> tree_iter_t option
    val getIterFromString :
      'a class
       -> string
       -> tree_iter_t option
    val getNColumns : 'a class -> LargeInt.int
    val getPath :
      'a class
       -> tree_iter_t
       -> tree_path_t
    val getStringFromIter :
      'a class
       -> tree_iter_t
       -> string
    val getValue :
      'a class
       -> tree_iter_t * LargeInt.int
       -> GObject.ValueRecord.t
    val iterChildren :
      'a class
       -> tree_iter_t option
       -> tree_iter_t option
    val iterHasChild :
      'a class
       -> tree_iter_t
       -> bool
    val iterNChildren :
      'a class
       -> tree_iter_t option
       -> LargeInt.int
    val iterNext :
      'a class
       -> tree_iter_t
       -> bool
    val iterNthChild :
      'a class
       -> tree_iter_t option * LargeInt.int
       -> tree_iter_t option
    val iterParent :
      'a class
       -> tree_iter_t
       -> tree_iter_t option
    val iterPrevious :
      'a class
       -> tree_iter_t
       -> bool
    val refNode :
      'a class
       -> tree_iter_t
       -> unit
    val rowChanged :
      'a class
       -> tree_path_t * tree_iter_t
       -> unit
    val rowDeleted :
      'a class
       -> tree_path_t
       -> unit
    val rowHasChildToggled :
      'a class
       -> tree_path_t * tree_iter_t
       -> unit
    val rowInserted :
      'a class
       -> tree_path_t * tree_iter_t
       -> unit
    val rowsReorderedWithLength :
      'a class
       -> tree_path_t
           * tree_iter_t option
           * LargeInt.int vector
       -> unit
    val sortNewWithModel : 'a class -> base class
    val unrefNode :
      'a class
       -> tree_iter_t
       -> unit
    val rowChangedSig : (tree_path_t * tree_iter_t -> unit) -> 'a class Signal.t
    val rowDeletedSig : (tree_path_t -> unit) -> 'a class Signal.t
    val rowHasChildToggledSig : (tree_path_t * tree_iter_t -> unit) -> 'a class Signal.t
    val rowInsertedSig : (tree_path_t * tree_iter_t -> unit) -> 'a class Signal.t
  end
