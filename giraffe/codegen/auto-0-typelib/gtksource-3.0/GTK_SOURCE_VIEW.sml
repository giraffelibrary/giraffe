signature GTK_SOURCE_VIEW =
  sig
    type 'a class
    type 'a buffer_class
    type 'a gutter_class
    type 'a mark_attributes_class
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
    val getSmartHomeEnd : 'a class -> smart_home_end_type_t
    val getTabWidth : 'a class -> LargeInt.int
    val getVisualColumn :
      'a class
       -> Gtk.TextIterRecord.t
       -> LargeInt.int
    val setAutoIndent :
      'a class
       -> bool
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
    val setSmartHomeEnd :
      'a class
       -> smart_home_end_type_t
       -> unit
    val setTabWidth :
      'a class
       -> LargeInt.int
       -> unit
    val lineMarkActivatedSig : (Gtk.TextIterRecord.t * base Gdk.Event.union -> unit) -> 'a class Signal.t
    val moveLinesSig : (bool * LargeInt.int -> unit) -> 'a class Signal.t
    val moveWordsSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val redoSig : (unit -> unit) -> 'a class Signal.t
    val showCompletionSig : (unit -> unit) -> 'a class Signal.t
    val smartHomeEndSig : (Gtk.TextIterRecord.t * LargeInt.int -> unit) -> 'a class Signal.t
    val undoSig : (unit -> unit) -> 'a class Signal.t
    val autoIndentProp : ('a class, bool, bool) Property.readwrite
    val completionProp : ('a class, base completion_class option) Property.readonly
    val drawSpacesProp : ('a class, draw_spaces_flags_t, draw_spaces_flags_t) Property.readwrite
    val highlightCurrentLineProp : ('a class, bool, bool) Property.readwrite
    val indentOnTabProp : ('a class, bool, bool) Property.readwrite
    val indentWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val insertSpacesInsteadOfTabsProp : ('a class, bool, bool) Property.readwrite
    val rightMarginPositionProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val showLineMarksProp : ('a class, bool, bool) Property.readwrite
    val showLineNumbersProp : ('a class, bool, bool) Property.readwrite
    val showRightMarginProp : ('a class, bool, bool) Property.readwrite
    val smartHomeEndProp : ('a class, smart_home_end_type_t, smart_home_end_type_t) Property.readwrite
    val tabWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
