signature GTK_SOURCE_VIEW =
  sig
    type 'a class_t
    type smarthomeendtype_t
    type drawspacesflags_t
    type 'a completionclass_t
    type 'a markattributesclass_t
    type 'a gutterclass_t
    type 'a bufferclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base Gtk.BuildableClass.t
    val asScrollable : 'a class_t -> base Gtk.ScrollableClass.t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithBuffer : 'a bufferclass_t -> base class_t
    val getAutoIndent : 'a class_t -> bool
    val getCompletion : 'a class_t -> base completionclass_t
    val getDrawSpaces : 'a class_t -> drawspacesflags_t
    val getGutter :
      'a class_t
       -> Gtk.TextWindowType.t
       -> base gutterclass_t
    val getHighlightCurrentLine : 'a class_t -> bool
    val getIndentOnTab : 'a class_t -> bool
    val getIndentWidth : 'a class_t -> LargeInt.int
    val getInsertSpacesInsteadOfTabs : 'a class_t -> bool
    val getRightMarginPosition : 'a class_t -> LargeInt.int
    val getShowLineMarks : 'a class_t -> bool
    val getShowLineNumbers : 'a class_t -> bool
    val getShowRightMargin : 'a class_t -> bool
    val getSmartHomeEnd : 'a class_t -> smarthomeendtype_t
    val getTabWidth : 'a class_t -> LargeInt.int
    val getVisualColumn :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> LargeInt.int
    val setAutoIndent :
      'a class_t
       -> bool
       -> unit
    val setDrawSpaces :
      'a class_t
       -> drawspacesflags_t
       -> unit
    val setHighlightCurrentLine :
      'a class_t
       -> bool
       -> unit
    val setIndentOnTab :
      'a class_t
       -> bool
       -> unit
    val setIndentWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setInsertSpacesInsteadOfTabs :
      'a class_t
       -> bool
       -> unit
    val setMarkAttributes :
      'a class_t
       -> string
       -> 'b markattributesclass_t
       -> LargeInt.int
       -> unit
    val setRightMarginPosition :
      'a class_t
       -> LargeInt.int
       -> unit
    val setShowLineMarks :
      'a class_t
       -> bool
       -> unit
    val setShowLineNumbers :
      'a class_t
       -> bool
       -> unit
    val setShowRightMargin :
      'a class_t
       -> bool
       -> unit
    val setSmartHomeEnd :
      'a class_t
       -> smarthomeendtype_t
       -> unit
    val setTabWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val lineMarkActivatedSig :
      (Gtk.TextIterRecord.t
        -> base Gdk.Event.t
        -> unit)
       -> 'a class_t Signal.signal
    val moveLinesSig :
      (bool
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val moveWordsSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val redoSig : (unit -> unit) -> 'a class_t Signal.signal
    val showCompletionSig : (unit -> unit) -> 'a class_t Signal.signal
    val smartHomeEndSig :
      (Gtk.TextIterRecord.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val undoSig : (unit -> unit) -> 'a class_t Signal.signal
    val autoIndentProp : ('a class_t, bool, bool) Property.readwrite
    val completionProp : ('a class_t, base completionclass_t option) Property.readonly
    val drawSpacesProp : ('a class_t, drawspacesflags_t, drawspacesflags_t) Property.readwrite
    val highlightCurrentLineProp : ('a class_t, bool, bool) Property.readwrite
    val indentOnTabProp : ('a class_t, bool, bool) Property.readwrite
    val indentWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val insertSpacesInsteadOfTabsProp : ('a class_t, bool, bool) Property.readwrite
    val rightMarginPositionProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val showLineMarksProp : ('a class_t, bool, bool) Property.readwrite
    val showLineNumbersProp : ('a class_t, bool, bool) Property.readwrite
    val showRightMarginProp : ('a class_t, bool, bool) Property.readwrite
    val smartHomeEndProp : ('a class_t, smarthomeendtype_t, smarthomeendtype_t) Property.readwrite
    val tabWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
