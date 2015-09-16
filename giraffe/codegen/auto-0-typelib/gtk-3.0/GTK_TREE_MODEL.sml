signature GTK_TREE_MODEL =
  sig
    type 'a class_t
    type tree_model_flags_t
    type tree_iter_record_t
    type tree_path_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val filterNew :
      'a class_t
       -> tree_path_record_t option
       -> base class_t
    val getFlags : 'a class_t -> tree_model_flags_t
    val getIter :
      'a class_t
       -> tree_path_record_t
       -> tree_iter_record_t option
    val getIterFirst : 'a class_t -> tree_iter_record_t option
    val getIterFromString :
      'a class_t
       -> string
       -> tree_iter_record_t option
    val getNColumns : 'a class_t -> LargeInt.int
    val getPath :
      'a class_t
       -> tree_iter_record_t
       -> tree_path_record_t
    val getStringFromIter :
      'a class_t
       -> tree_iter_record_t
       -> string
    val getValue :
      'a class_t
       -> tree_iter_record_t
       -> LargeInt.int
       -> GObject.ValueRecord.t
    val iterChildren :
      'a class_t
       -> tree_iter_record_t option
       -> tree_iter_record_t option
    val iterHasChild :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val iterNChildren :
      'a class_t
       -> tree_iter_record_t option
       -> LargeInt.int
    val iterNext :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val iterNthChild :
      'a class_t
       -> tree_iter_record_t option
       -> LargeInt.int
       -> tree_iter_record_t option
    val iterParent :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t option
    val iterPrevious :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val refNode :
      'a class_t
       -> tree_iter_record_t
       -> unit
    val rowChanged :
      'a class_t
       -> tree_path_record_t
       -> tree_iter_record_t
       -> unit
    val rowDeleted :
      'a class_t
       -> tree_path_record_t
       -> unit
    val rowHasChildToggled :
      'a class_t
       -> tree_path_record_t
       -> tree_iter_record_t
       -> unit
    val rowInserted :
      'a class_t
       -> tree_path_record_t
       -> tree_iter_record_t
       -> unit
    val sortNewWithModel : 'a class_t -> base class_t
    val unrefNode :
      'a class_t
       -> tree_iter_record_t
       -> unit
    val rowChangedSig :
      (tree_path_record_t
        -> tree_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowDeletedSig : (tree_path_record_t -> unit) -> 'a class_t Signal.signal
    val rowHasChildToggledSig :
      (tree_path_record_t
        -> tree_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowInsertedSig :
      (tree_path_record_t
        -> tree_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
  end
