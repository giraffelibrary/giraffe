structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class = 'a GtkSourceUndoManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_undo_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val beginNotUndoableAction_ = call (getSymbol "gtk_source_undo_manager_begin_not_undoable_action") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val canRedo_ = call (getSymbol "gtk_source_undo_manager_can_redo") (GtkSourceUndoManagerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canRedoChanged_ = call (getSymbol "gtk_source_undo_manager_can_redo_changed") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val canUndo_ = call (getSymbol "gtk_source_undo_manager_can_undo") (GtkSourceUndoManagerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canUndoChanged_ = call (getSymbol "gtk_source_undo_manager_can_undo_changed") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val endNotUndoableAction_ = call (getSymbol "gtk_source_undo_manager_end_not_undoable_action") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val redo_ = call (getSymbol "gtk_source_undo_manager_redo") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val undo_ = call (getSymbol "gtk_source_undo_manager_undo") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
