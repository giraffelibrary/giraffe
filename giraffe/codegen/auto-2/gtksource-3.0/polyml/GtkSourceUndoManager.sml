structure GtkSourceUndoManager :>
  GTK_SOURCE_UNDO_MANAGER
    where type 'a class_t = 'a GtkSourceUndoManagerClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_undo_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val beginNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_undo_manager_begin_not_undoable_action") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val canRedo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_redo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canRedoChanged_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_redo_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val canUndo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_undo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canUndoChanged_ = call (load_sym libgtksourceview "gtk_source_undo_manager_can_undo_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val endNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_undo_manager_end_not_undoable_action") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val redo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_redo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val undo_ = call (load_sym libgtksourceview "gtk_source_undo_manager_undo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
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
