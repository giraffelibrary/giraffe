signature VTE_TERMINAL =
  sig
    type 'a class
    type pty_flags_t
    type regex_t
    type write_flags_t
    type cursor_blink_mode_t
    type cursor_shape_t
    type erase_binding_t
    type 'a pty_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val asScrollable : 'a class -> base Gtk.ScrollableClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val copyClipboard : 'a class -> unit
    val copyPrimary : 'a class -> unit
    val feed :
      'a class
       -> GUInt8CArrayN.t option
       -> unit
    val feedChild :
      'a class
       -> string option * int
       -> unit
    val feedChildBinary :
      'a class
       -> GUInt8CArrayN.t option
       -> unit
    val getAllowBold : 'a class -> bool
    val getAudibleBell : 'a class -> bool
    val getCharHeight : 'a class -> LargeInt.int
    val getCharWidth : 'a class -> LargeInt.int
    val getCjkAmbiguousWidth : 'a class -> LargeInt.int
    val getColumnCount : 'a class -> LargeInt.int
    val getCurrentDirectoryUri : 'a class -> string
    val getCurrentFileUri : 'a class -> string
    val getCursorBlinkMode : 'a class -> cursor_blink_mode_t
    val getCursorPosition : 'a class -> LargeInt.int * LargeInt.int
    val getCursorShape : 'a class -> cursor_shape_t
    val getEncoding : 'a class -> string
    val getFont : 'a class -> Pango.FontDescriptionRecord.t
    val getFontScale : 'a class -> real
    val getGeometryHints :
      'a class
       -> LargeInt.int * LargeInt.int
       -> Gdk.GeometryRecord.t
    val getHasSelection : 'a class -> bool
    val getIconTitle : 'a class -> string
    val getInputEnabled : 'a class -> bool
    val getMouseAutohide : 'a class -> bool
    val getPty : 'a class -> base pty_class
    val getRewrapOnResize : 'a class -> bool
    val getRowCount : 'a class -> LargeInt.int
    val getWindowTitle : 'a class -> string
    val getWordCharExceptions : 'a class -> string
    val matchAddGregex :
      'a class
       -> GLib.RegexRecord.t * GLib.RegexMatchFlags.t
       -> LargeInt.int
    val matchAddRegex :
      'a class
       -> regex_t * LargeInt.int
       -> LargeInt.int
    val matchCheck :
      'a class
       -> LargeInt.int * LargeInt.int
       -> string * LargeInt.int
    val matchCheckEvent :
      'a class
       -> 'b Gdk.Event.union
       -> string * LargeInt.int
    val matchRemove :
      'a class
       -> LargeInt.int
       -> unit
    val matchRemoveAll : 'a class -> unit
    val matchSetCursor :
      'a class
       -> LargeInt.int * 'b Gdk.CursorClass.class option
       -> unit
    val matchSetCursorName :
      'a class
       -> LargeInt.int * string
       -> unit
    val matchSetCursorType :
      'a class
       -> LargeInt.int * Gdk.CursorType.t
       -> unit
    val pasteClipboard : 'a class -> unit
    val pastePrimary : 'a class -> unit
    val ptyNewSync :
      'a class
       -> pty_flags_t * 'b Gio.CancellableClass.class option
       -> base pty_class
    val reset :
      'a class
       -> bool * bool
       -> unit
    val searchFindNext : 'a class -> bool
    val searchFindPrevious : 'a class -> bool
    val searchGetGregex : 'a class -> GLib.RegexRecord.t
    val searchGetRegex : 'a class -> regex_t
    val searchGetWrapAround : 'a class -> bool
    val searchSetGregex :
      'a class
       -> GLib.RegexRecord.t option * GLib.RegexMatchFlags.t
       -> unit
    val searchSetRegex :
      'a class
       -> regex_t option * LargeInt.int
       -> unit
    val searchSetWrapAround :
      'a class
       -> bool
       -> unit
    val selectAll : 'a class -> unit
    val setAllowBold :
      'a class
       -> bool
       -> unit
    val setAudibleBell :
      'a class
       -> bool
       -> unit
    val setBackspaceBinding :
      'a class
       -> erase_binding_t
       -> unit
    val setCjkAmbiguousWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setColorBackground :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorBold :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorCursor :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorCursorForeground :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorForeground :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorHighlight :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorHighlightForeground :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColors :
      'a class
       -> Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t option
           * GdkRgbaRecordCArrayN.t option
       -> unit
    val setCursorBlinkMode :
      'a class
       -> cursor_blink_mode_t
       -> unit
    val setCursorShape :
      'a class
       -> cursor_shape_t
       -> unit
    val setDefaultColors : 'a class -> unit
    val setDeleteBinding :
      'a class
       -> erase_binding_t
       -> unit
    val setEncoding :
      'a class
       -> string option
       -> unit
    val setFont :
      'a class
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val setFontScale :
      'a class
       -> real
       -> unit
    val setGeometryHintsForWindow :
      'a class
       -> 'b Gtk.WindowClass.class
       -> unit
    val setInputEnabled :
      'a class
       -> bool
       -> unit
    val setMouseAutohide :
      'a class
       -> bool
       -> unit
    val setPty :
      'a class
       -> 'b pty_class option
       -> unit
    val setRewrapOnResize :
      'a class
       -> bool
       -> unit
    val setScrollOnKeystroke :
      'a class
       -> bool
       -> unit
    val setScrollOnOutput :
      'a class
       -> bool
       -> unit
    val setScrollSpeed :
      'a class
       -> LargeInt.int
       -> unit
    val setScrollbackLines :
      'a class
       -> LargeInt.int
       -> unit
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setWordCharExceptions :
      'a class
       -> string
       -> unit
    val unselectAll : 'a class -> unit
    val watchChild :
      'a class
       -> GLib.Pid.t
       -> unit
    val writeContentsSync :
      'a class
       -> 'b Gio.OutputStreamClass.class
           * write_flags_t
           * 'c Gio.CancellableClass.class option
       -> unit
    val bellSig : (unit -> unit) -> 'a class Signal.t
    val charSizeChangedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val childExitedSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val commitSig : (string * LargeInt.int -> unit) -> 'a class Signal.t
    val contentsChangedSig : (unit -> unit) -> 'a class Signal.t
    val copyClipboardSig : (unit -> unit) -> 'a class Signal.t
    val currentDirectoryUriChangedSig : (unit -> unit) -> 'a class Signal.t
    val currentFileUriChangedSig : (unit -> unit) -> 'a class Signal.t
    val cursorMovedSig : (unit -> unit) -> 'a class Signal.t
    val decreaseFontSizeSig : (unit -> unit) -> 'a class Signal.t
    val deiconifyWindowSig : (unit -> unit) -> 'a class Signal.t
    val encodingChangedSig : (unit -> unit) -> 'a class Signal.t
    val eofSig : (unit -> unit) -> 'a class Signal.t
    val iconTitleChangedSig : (unit -> unit) -> 'a class Signal.t
    val iconifyWindowSig : (unit -> unit) -> 'a class Signal.t
    val increaseFontSizeSig : (unit -> unit) -> 'a class Signal.t
    val lowerWindowSig : (unit -> unit) -> 'a class Signal.t
    val maximizeWindowSig : (unit -> unit) -> 'a class Signal.t
    val moveWindowSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val notificationReceivedSig : (string * string option -> unit) -> 'a class Signal.t
    val pasteClipboardSig : (unit -> unit) -> 'a class Signal.t
    val raiseWindowSig : (unit -> unit) -> 'a class Signal.t
    val refreshWindowSig : (unit -> unit) -> 'a class Signal.t
    val resizeWindowSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val restoreWindowSig : (unit -> unit) -> 'a class Signal.t
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val textDeletedSig : (unit -> unit) -> 'a class Signal.t
    val textInsertedSig : (unit -> unit) -> 'a class Signal.t
    val textModifiedSig : (unit -> unit) -> 'a class Signal.t
    val textScrolledSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val windowTitleChangedSig : (unit -> unit) -> 'a class Signal.t
    val allowBoldProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val audibleBellProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backspaceBindingProp : ('a class, unit -> erase_binding_t, erase_binding_t -> unit, erase_binding_t -> unit) Property.t
    val cjkAmbiguousWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val currentDirectoryUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val currentFileUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val cursorBlinkModeProp : ('a class, unit -> cursor_blink_mode_t, cursor_blink_mode_t -> unit, cursor_blink_mode_t -> unit) Property.t
    val cursorShapeProp : ('a class, unit -> cursor_shape_t, cursor_shape_t -> unit, cursor_shape_t -> unit) Property.t
    val deleteBindingProp : ('a class, unit -> erase_binding_t, erase_binding_t -> unit, erase_binding_t -> unit) Property.t
    val encodingProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val fontScaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val iconTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val inputEnabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pointerAutohideProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val ptyProp : ('a class, unit -> base pty_class option, 'b pty_class option -> unit, 'b pty_class option -> unit) Property.t
    val rewrapOnResizeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnKeystrokeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnOutputProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollSpeedProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val scrollbackLinesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val windowTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val wordCharExceptionsProp : ('a class, unit -> string option, unit, unit) Property.t
  end
