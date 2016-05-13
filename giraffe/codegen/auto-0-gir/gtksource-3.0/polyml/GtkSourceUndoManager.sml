structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class = 'a GtkSourceUndoManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_undo_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val beginNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_undo_manager_begin_not_undoable_action") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val canRedo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_redo") (GtkSourceUndoManagerClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canRedoChanged_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_redo_changed") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val canUndo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_undo") (GtkSourceUndoManagerClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canUndoChanged_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_undo_changed") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val endNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_undo_manager_end_not_undoable_action") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val redo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_redo") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val undo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_undo") (GtkSourceUndoManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
