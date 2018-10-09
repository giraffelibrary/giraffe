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
       -> string list
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
    val canRedoProp : {get : 'a class -> bool}
    val canUndoProp : {get : 'a class -> bool}
    val highlightMatchingBracketsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val highlightSyntaxProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val implicitTrailingNewlineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val languageProp :
      {
        get : 'a class -> base language_class option,
        set :
          'b language_class option
           -> 'a class
           -> unit,
        new : 'b language_class option -> 'a class Property.t
      }
    val maxUndoLevelsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val styleSchemeProp :
      {
        get : 'a class -> base style_scheme_class option,
        set :
          'b style_scheme_class option
           -> 'a class
           -> unit,
        new : 'b style_scheme_class option -> 'a class Property.t
      }
    val undoManagerProp :
      {
        get : 'a class -> base undo_manager_class option,
        set :
          'b undo_manager_class option
           -> 'a class
           -> unit,
        new : 'b undo_manager_class option -> 'a class Property.t
      }
  end
