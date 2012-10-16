structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class_t = 'a GtkSourceUndoManagerClass.t =
  struct
    val getType_ = _import "gtk_source_undo_manager_get_type" : unit -> GObjectType.C.val_;
    val beginNotUndoableAction_ = _import "gtk_source_undo_manager_begin_not_undoable_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val canRedo_ = _import "gtk_source_undo_manager_can_redo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canRedoChanged_ = _import "gtk_source_undo_manager_can_redo_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val canUndo_ = _import "gtk_source_undo_manager_can_undo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canUndoChanged_ = _import "gtk_source_undo_manager_can_undo_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val endNotUndoableAction_ = _import "gtk_source_undo_manager_end_not_undoable_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val redo_ = _import "gtk_source_undo_manager_redo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val undo_ = _import "gtk_source_undo_manager_undo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkSourceUndoManagerClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun beginNotUndoableAction self = (GObjectObjectClass.C.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canRedo_ self
    fun canRedoChanged self = (GObjectObjectClass.C.withPtr ---> I) canRedoChanged_ self
    fun canUndo self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canUndo_ self
    fun canUndoChanged self = (GObjectObjectClass.C.withPtr ---> I) canUndoChanged_ self
    fun endNotUndoableAction self = (GObjectObjectClass.C.withPtr ---> I) endNotUndoableAction_ self
    fun redo self = (GObjectObjectClass.C.withPtr ---> I) redo_ self
    fun undo self = (GObjectObjectClass.C.withPtr ---> I) undo_ self
    local
      open ClosureMarshal Signal
    in
      fun canRedoChangedSig f = signal "can-redo-changed" (void ---> ret_void) f
      fun canUndoChangedSig f = signal "can-undo-changed" (void ---> ret_void) f
    end
  end
