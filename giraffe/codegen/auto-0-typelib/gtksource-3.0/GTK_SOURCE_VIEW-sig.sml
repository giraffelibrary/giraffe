signature GTK_SOURCE_VIEW =
  sig
    type 'a class
    type 'a buffer_class
    type 'a gutter_class
    type 'a mark_attributes_class
    type change_case_type_t
    type background_pattern_type_t
    type 'a completion_class
    type draw_spaces_flags_t
    type smart_home_end_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val asScrollable : 'a class -> base Gtk.ScrollableClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithBuffer : 'a buffer_class -> base class
    val getAutoIndent : 'a class -> bool
    val getBackgroundPattern : 'a class -> background_pattern_type_t
    val getCompletion : 'a class -> base completion_class
    val getDrawSpaces : 'a class -> draw_spaces_flags_t
    val getGutter :
      'a class
       -> Gtk.TextWindowType.t
       -> base gutter_class
    val getHighlightCurrentLine : 'a class -> bool
    val getIndentOnTab : 'a class -> bool
    val getIndentWidth : 'a class -> LargeInt.int
    val getInsertSpacesInsteadOfTabs : 'a class -> bool
    val getRightMarginPosition : 'a class -> LargeInt.int
    val getShowLineMarks : 'a class -> bool
    val getShowLineNumbers : 'a class -> bool
    val getShowRightMargin : 'a class -> bool
    val getSmartBackspace : 'a class -> bool
    val getSmartHomeEnd : 'a class -> smart_home_end_type_t
    val getTabWidth : 'a class -> LargeInt.int
    val getVisualColumn :
      'a class
       -> Gtk.TextIterRecord.t
       -> LargeInt.int
    val indentLines :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
    val setAutoIndent :
      'a class
       -> bool
       -> unit
    val setBackgroundPattern :
      'a class
       -> background_pattern_type_t
       -> unit
    val setDrawSpaces :
      'a class
       -> draw_spaces_flags_t
       -> unit
    val setHighlightCurrentLine :
      'a class
       -> bool
       -> unit
    val setIndentOnTab :
      'a class
       -> bool
       -> unit
    val setIndentWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setInsertSpacesInsteadOfTabs :
      'a class
       -> bool
       -> unit
    val setMarkAttributes :
      'a class
       -> string
           * 'b mark_attributes_class
           * LargeInt.int
       -> unit
    val setRightMarginPosition :
      'a class
       -> LargeInt.int
       -> unit
    val setShowLineMarks :
      'a class
       -> bool
       -> unit
    val setShowLineNumbers :
      'a class
       -> bool
       -> unit
    val setShowRightMargin :
      'a class
       -> bool
       -> unit
    val setSmartBackspace :
      'a class
       -> bool
       -> unit
    val setSmartHomeEnd :
      'a class
       -> smart_home_end_type_t
       -> unit
    val setTabWidth :
      'a class
       -> LargeInt.int
       -> unit
    val unindentLines :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
    val changeCaseSig : (change_case_type_t -> unit) -> 'a class Signal.t
    val changeNumberSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val joinLinesSig : (unit -> unit) -> 'a class Signal.t
    val lineMarkActivatedSig : (Gtk.TextIterRecord.t * base Gdk.Event.union -> unit) -> 'a class Signal.t
    val moveLinesSig : (bool * LargeInt.int -> unit) -> 'a class Signal.t
    val moveToMatchingBracketSig : (bool -> unit) -> 'a class Signal.t
    val moveWordsSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val redoSig : (unit -> unit) -> 'a class Signal.t
    val showCompletionSig : (unit -> unit) -> 'a class Signal.t
    val smartHomeEndSig : (Gtk.TextIterRecord.t * LargeInt.int -> unit) -> 'a class Signal.t
    val undoSig : (unit -> unit) -> 'a class Signal.t
    val autoIndentProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val backgroundPatternProp :
      {
        get : 'a class -> background_pattern_type_t,
        set :
          background_pattern_type_t
           -> 'a class
           -> unit,
        new : background_pattern_type_t -> 'a class Property.t
      }
    val completionProp : {get : 'a class -> base completion_class option}
    val drawSpacesProp :
      {
        get : 'a class -> draw_spaces_flags_t,
        set :
          draw_spaces_flags_t
           -> 'a class
           -> unit,
        new : draw_spaces_flags_t -> 'a class Property.t
      }
    val highlightCurrentLineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val indentOnTabProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val indentWidthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val insertSpacesInsteadOfTabsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val rightMarginPositionProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val showLineMarksProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showLineNumbersProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showRightMarginProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val smartBackspaceProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val smartHomeEndProp :
      {
        get : 'a class -> smart_home_end_type_t,
        set :
          smart_home_end_type_t
           -> 'a class
           -> unit,
        new : smart_home_end_type_t -> 'a class Property.t
      }
    val tabWidthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
