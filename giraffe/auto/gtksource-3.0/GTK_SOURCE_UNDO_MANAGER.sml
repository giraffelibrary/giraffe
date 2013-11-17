signature GTK_SOURCE_UNDO_MANAGER =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val beginNotUndoableAction : 'a class_t -> unit
    val canRedo : 'a class_t -> bool
    val canRedoChanged : 'a class_t -> unit
    val canUndo : 'a class_t -> bool
    val canUndoChanged : 'a class_t -> unit
    val endNotUndoableAction : 'a class_t -> unit
    val redo : 'a class_t -> unit
    val undo : 'a class_t -> unit
    val canRedoChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val canUndoChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
