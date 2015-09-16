signature GTK_SOURCE_BUFFER =
  sig
    type 'a class_t
    type 'a mark_class_t
    type bracket_match_type_t
    type 'a language_class_t
    type 'a style_scheme_class_t
    type 'a undo_manager_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a Gtk.TextTagTableClass.t option -> base class_t
    val newWithLanguage : 'a language_class_t -> base class_t
    val backwardIterToSourceMark :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> string option
       -> bool
    val beginNotUndoableAction : 'a class_t -> unit
    val canRedo : 'a class_t -> bool
    val canUndo : 'a class_t -> bool
    val createSourceMark :
      'a class_t
       -> string option
       -> string
       -> Gtk.TextIterRecord.t
       -> base mark_class_t
    val endNotUndoableAction : 'a class_t -> unit
    val ensureHighlight :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Gtk.TextIterRecord.t
       -> unit
    val forwardIterToSourceMark :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> string option
       -> bool
    val getHighlightMatchingBrackets : 'a class_t -> bool
    val getHighlightSyntax : 'a class_t -> bool
    val getLanguage : 'a class_t -> base language_class_t
    val getMaxUndoLevels : 'a class_t -> LargeInt.int
    val getStyleScheme : 'a class_t -> base style_scheme_class_t
    val getUndoManager : 'a class_t -> base undo_manager_class_t
    val iterBackwardToContextClassToggle :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> string
       -> bool
    val iterForwardToContextClassToggle :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> string
       -> bool
    val iterHasContextClass :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> string
       -> bool
    val redo : 'a class_t -> unit
    val removeSourceMarks :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> Gtk.TextIterRecord.t
       -> string option
       -> unit
    val setHighlightMatchingBrackets :
      'a class_t
       -> bool
       -> unit
    val setHighlightSyntax :
      'a class_t
       -> bool
       -> unit
    val setLanguage :
      'a class_t
       -> 'b language_class_t option
       -> unit
    val setMaxUndoLevels :
      'a class_t
       -> LargeInt.int
       -> unit
    val setStyleScheme :
      'a class_t
       -> 'b style_scheme_class_t option
       -> unit
    val setUndoManager :
      'a class_t
       -> 'b undo_manager_class_t option
       -> unit
    val undo : 'a class_t -> unit
    val bracketMatchedSig :
      (Gtk.TextIterRecord.t
        -> bracket_match_type_t
        -> unit)
       -> 'a class_t Signal.signal
    val highlightUpdatedSig :
      (Gtk.TextIterRecord.t
        -> Gtk.TextIterRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val redoSig : (unit -> unit) -> 'a class_t Signal.signal
    val sourceMarkUpdatedSig : (base Gtk.TextMarkClass.t -> unit) -> 'a class_t Signal.signal
    val undoSig : (unit -> unit) -> 'a class_t Signal.signal
    val canRedoProp : ('a class_t, bool) Property.readonly
    val canUndoProp : ('a class_t, bool) Property.readonly
    val highlightMatchingBracketsProp : ('a class_t, bool, bool) Property.readwrite
    val highlightSyntaxProp : ('a class_t, bool, bool) Property.readwrite
    val languageProp : ('a class_t, base language_class_t option, 'b language_class_t option) Property.readwrite
    val maxUndoLevelsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val styleSchemeProp : ('a class_t, base style_scheme_class_t option, 'b style_scheme_class_t option) Property.readwrite
    val undoManagerProp : ('a class_t, base undo_manager_class_t option, 'b undo_manager_class_t option) Property.readwrite
  end
