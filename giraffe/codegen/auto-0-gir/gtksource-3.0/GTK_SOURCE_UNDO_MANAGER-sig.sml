signature GTK_SOURCE_UNDO_MANAGER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val beginNotUndoableAction : 'a class -> unit
    val canRedo : 'a class -> bool
    val canRedoChanged : 'a class -> unit
    val canUndo : 'a class -> bool
    val canUndoChanged : 'a class -> unit
    val endNotUndoableAction : 'a class -> unit
    val redo : 'a class -> unit
    val undo : 'a class -> unit
    val canRedoChangedSig : (unit -> unit) -> 'a class Signal.t
    val canUndoChangedSig : (unit -> unit) -> 'a class Signal.t
  end
