structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class = 'a GtkSourceUndoManagerClass.class =
  struct
    val getType_ = _import "gtk_source_undo_manager_get_type" : unit -> GObjectType.FFI.val_;
    val beginNotUndoableAction_ = _import "gtk_source_undo_manager_begin_not_undoable_action" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    val canRedo_ = _import "gtk_source_undo_manager_can_redo" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> GBool.FFI.val_;
    val canRedoChanged_ = _import "gtk_source_undo_manager_can_redo_changed" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    val canUndo_ = _import "gtk_source_undo_manager_can_undo" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> GBool.FFI.val_;
    val canUndoChanged_ = _import "gtk_source_undo_manager_can_undo_changed" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    val endNotUndoableAction_ = _import "gtk_source_undo_manager_end_not_undoable_action" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    val redo_ = _import "gtk_source_undo_manager_redo" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    val undo_ = _import "gtk_source_undo_manager_undo" : GtkSourceUndoManagerClass.FFI.notnull GtkSourceUndoManagerClass.FFI.p -> unit;
    type 'a class = 'a GtkSourceUndoManagerClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun beginNotUndoableAction self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GtkSourceUndoManagerClass.FFI.withPtr ---> GBool.FFI.fromVal) canRedo_ self
    fun canRedoChanged self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) canRedoChanged_ self
    fun canUndo self = (GtkSourceUndoManagerClass.FFI.withPtr ---> GBool.FFI.fromVal) canUndo_ self
    fun canUndoChanged self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) canUndoChanged_ self
    fun endNotUndoableAction self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) endNotUndoableAction_ self
    fun redo self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) redo_ self
    fun undo self = (GtkSourceUndoManagerClass.FFI.withPtr ---> I) undo_ self
    local
      open ClosureMarshal Signal
    in
      fun canRedoChangedSig f = signal "can-redo-changed" (void ---> ret_void) f
      fun canUndoChangedSig f = signal "can-undo-changed" (void ---> ret_void) f
    end
  end
