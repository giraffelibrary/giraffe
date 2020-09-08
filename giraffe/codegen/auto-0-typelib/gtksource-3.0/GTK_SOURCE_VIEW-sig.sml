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
    val autoIndentProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backgroundPatternProp : ('a class, unit -> background_pattern_type_t, background_pattern_type_t -> unit, background_pattern_type_t -> unit) Property.t
    val completionProp : ('a class, unit -> base completion_class option, unit, unit) Property.t
    val drawSpacesProp : ('a class, unit -> draw_spaces_flags_t, draw_spaces_flags_t -> unit, draw_spaces_flags_t -> unit) Property.t
    val highlightCurrentLineProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val indentOnTabProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val indentWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val insertSpacesInsteadOfTabsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val rightMarginPositionProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val showLineMarksProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showLineNumbersProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showRightMarginProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val smartBackspaceProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val smartHomeEndProp : ('a class, unit -> smart_home_end_type_t, smart_home_end_type_t -> unit, smart_home_end_type_t -> unit) Property.t
    val tabWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
