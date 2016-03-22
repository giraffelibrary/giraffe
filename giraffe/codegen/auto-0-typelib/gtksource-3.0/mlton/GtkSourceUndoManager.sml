structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class = 'a GtkSourceUndoManagerClass.class =
  struct
    val getType_ = _import "gtk_source_undo_manager_get_type" : unit -> GObjectType.C.val_;
    val beginNotUndoableAction_ = _import "gtk_source_undo_manager_begin_not_undoable_action" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    val canRedo_ = _import "gtk_source_undo_manager_can_redo" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> FFI.Bool.C.val_;
    val canRedoChanged_ = _import "gtk_source_undo_manager_can_redo_changed" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    val canUndo_ = _import "gtk_source_undo_manager_can_undo" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> FFI.Bool.C.val_;
    val canUndoChanged_ = _import "gtk_source_undo_manager_can_undo_changed" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    val endNotUndoableAction_ = _import "gtk_source_undo_manager_end_not_undoable_action" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    val redo_ = _import "gtk_source_undo_manager_redo" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    val undo_ = _import "gtk_source_undo_manager_undo" : GtkSourceUndoManagerClass.C.notnull GtkSourceUndoManagerClass.C.p -> unit;
    type 'a class = 'a GtkSourceUndoManagerClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun beginNotUndoableAction self = (GtkSourceUndoManagerClass.C.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GtkSourceUndoManagerClass.C.withPtr ---> FFI.Bool.C.fromVal) canRedo_ self
    fun canRedoChanged self = (GtkSourceUndoManagerClass.C.withPtr ---> I) canRedoChanged_ self
    fun canUndo self = (GtkSourceUndoManagerClass.C.withPtr ---> FFI.Bool.C.fromVal) canUndo_ self
    fun canUndoChanged self = (GtkSourceUndoManagerClass.C.withPtr ---> I) canUndoChanged_ self
    fun endNotUndoableAction self = (GtkSourceUndoManagerClass.C.withPtr ---> I) endNotUndoableAction_ self
    fun redo self = (GtkSourceUndoManagerClass.C.withPtr ---> I) redo_ self
    fun undo self = (GtkSourceUndoManagerClass.C.withPtr ---> I) undo_ self
    local
      open ClosureMarshal Signal
    in
      fun canRedoChangedSig f = signal "can-redo-changed" (void ---> ret_void) f
      fun canUndoChangedSig f = signal "can-undo-changed" (void ---> ret_void) f
    end
  end
