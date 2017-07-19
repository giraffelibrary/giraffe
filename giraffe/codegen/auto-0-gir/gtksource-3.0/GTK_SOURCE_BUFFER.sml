signature GTK_SOURCE_BUFFER =
  sig
    type 'a class
    type 'a mark_class
    type bracket_match_type_t
    type 'a language_class
    type 'a style_scheme_class
    type 'a undo_manager_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a Gtk.TextTagTableClass.class option -> base class
    val newWithLanguage : 'a language_class -> base class
    val backwardIterToSourceMark :
      'a class
       -> Gtk.TextIterRecord.t * string option
       -> bool
    val beginNotUndoableAction : 'a class -> unit
    val canRedo : 'a class -> bool
    val canUndo : 'a class -> bool
    val createSourceMark :
      'a class
       -> string option
           * string
           * Gtk.TextIterRecord.t
       -> base mark_class
    val endNotUndoableAction : 'a class -> unit
    val ensureHighlight :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
    val forwardIterToSourceMark :
      'a class
       -> Gtk.TextIterRecord.t * string option
       -> bool
    val getContextClassesAtIter :
      'a class
       -> Gtk.TextIterRecord.t
       -> string list
    val getHighlightMatchingBrackets : 'a class -> bool
    val getHighlightSyntax : 'a class -> bool
    val getLanguage : 'a class -> base language_class
    val getMaxUndoLevels : 'a class -> LargeInt.int
    val getStyleScheme : 'a class -> base style_scheme_class
    val getUndoManager : 'a class -> base undo_manager_class
    val iterBackwardToContextClassToggle :
      'a class
       -> Gtk.TextIterRecord.t * string
       -> bool
    val iterForwardToContextClassToggle :
      'a class
       -> Gtk.TextIterRecord.t * string
       -> bool
    val iterHasContextClass :
      'a class
       -> Gtk.TextIterRecord.t * string
       -> bool
    val redo : 'a class -> unit
    val removeSourceMarks :
      'a class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * string option
       -> unit
    val setHighlightMatchingBrackets :
      'a class
       -> bool
       -> unit
    val setHighlightSyntax :
      'a class
       -> bool
       -> unit
    val setLanguage :
      'a class
       -> 'b language_class option
       -> unit
    val setMaxUndoLevels :
      'a class
       -> LargeInt.int
       -> unit
    val setStyleScheme :
      'a class
       -> 'b style_scheme_class option
       -> unit
    val setUndoManager :
      'a class
       -> 'b undo_manager_class option
       -> unit
    val undo : 'a class -> unit
    val bracketMatchedSig : (Gtk.TextIterRecord.t * bracket_match_type_t -> unit) -> 'a class Signal.signal
    val highlightUpdatedSig : (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t -> unit) -> 'a class Signal.signal
    val redoSig : (unit -> unit) -> 'a class Signal.signal
    val sourceMarkUpdatedSig : (base Gtk.TextMarkClass.class -> unit) -> 'a class Signal.signal
    val undoSig : (unit -> unit) -> 'a class Signal.signal
    val canRedoProp : ('a class, bool) Property.readonly
    val canUndoProp : ('a class, bool) Property.readonly
    val highlightMatchingBracketsProp : ('a class, bool, bool) Property.readwrite
    val highlightSyntaxProp : ('a class, bool, bool) Property.readwrite
    val languageProp : ('a class, base language_class option, 'b language_class option) Property.readwrite
    val maxUndoLevelsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val styleSchemeProp : ('a class, base style_scheme_class option, 'b style_scheme_class option) Property.readwrite
    val undoManagerProp : ('a class, base undo_manager_class option, 'b undo_manager_class option) Property.readwrite
  end
