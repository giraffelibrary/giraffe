signature GTK_SOURCE_BUFFER =
  sig
    type 'a class
    type change_case_type_t
    type 'a mark_class
    type sort_flags_t
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
    val changeCase :
      'a class
       -> change_case_type_t
           * Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
       -> unit
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
       -> Utf8CPtrArray.t
    val getHighlightMatchingBrackets : 'a class -> bool
    val getHighlightSyntax : 'a class -> bool
    val getImplicitTrailingNewline : 'a class -> bool
    val getLanguage : 'a class -> base language_class option
    val getMaxUndoLevels : 'a class -> LargeInt.int
    val getStyleScheme : 'a class -> base style_scheme_class option
    val getUndoManager : 'a class -> base undo_manager_class option
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
    val joinLines :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
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
    val setImplicitTrailingNewline :
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
    val sortLines :
      'a class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * sort_flags_t
           * LargeInt.int
       -> unit
    val undo : 'a class -> unit
    val bracketMatchedSig : (Gtk.TextIterRecord.t * bracket_match_type_t -> unit) -> 'a class Signal.t
    val highlightUpdatedSig : (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t -> unit) -> 'a class Signal.t
    val redoSig : (unit -> unit) -> 'a class Signal.t
    val sourceMarkUpdatedSig : (base Gtk.TextMarkClass.class -> unit) -> 'a class Signal.t
    val undoSig : (unit -> unit) -> 'a class Signal.t
    val canRedoProp : ('a class, unit -> bool, unit, unit) Property.t
    val canUndoProp : ('a class, unit -> bool, unit, unit) Property.t
    val highlightMatchingBracketsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val highlightSyntaxProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val implicitTrailingNewlineProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val languageProp : ('a class, unit -> base language_class option, 'b language_class option -> unit, 'b language_class option -> unit) Property.t
    val maxUndoLevelsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val styleSchemeProp : ('a class, unit -> base style_scheme_class option, 'b style_scheme_class option -> unit, 'b style_scheme_class option -> unit) Property.t
    val undoManagerProp : ('a class, unit -> base undo_manager_class option, 'b undo_manager_class option -> unit, 'b undo_manager_class option -> unit) Property.t
  end
