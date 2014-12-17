signature VTE_TERMINAL =
  sig
    type 'a class_t
    type ptyflags_t
    type writeflags_t
    type cursorblinkmode_t
    type cursorshape_t
    type erasebinding_t
    type 'a ptyclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base Gtk.BuildableClass.t
    val asScrollable : 'a class_t -> base Gtk.ScrollableClass.t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val copyClipboard : 'a class_t -> unit
    val copyPrimary : 'a class_t -> unit
    val feedChild :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val getAllowBold : 'a class_t -> bool
    val getAudibleBell : 'a class_t -> bool
    val getCharHeight : 'a class_t -> LargeInt.int
    val getCharWidth : 'a class_t -> LargeInt.int
    val getCjkAmbiguousWidth : 'a class_t -> LargeInt.int
    val getColumnCount : 'a class_t -> LargeInt.int
    val getCurrentDirectoryUri : 'a class_t -> string
    val getCurrentFileUri : 'a class_t -> string
    val getCursorBlinkMode : 'a class_t -> cursorblinkmode_t
    val getCursorPosition : 'a class_t -> LargeInt.int * LargeInt.int
    val getCursorShape : 'a class_t -> cursorshape_t
    val getEncoding : 'a class_t -> string
    val getFont : 'a class_t -> Pango.FontDescriptionRecord.t
    val getFontScale : 'a class_t -> real
    val getGeometryHints :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> Gdk.GeometryRecord.t
    val getHasSelection : 'a class_t -> bool
    val getIconTitle : 'a class_t -> string
    val getInputEnabled : 'a class_t -> bool
    val getMouseAutohide : 'a class_t -> bool
    val getPty : 'a class_t -> base ptyclass_t
    val getRewrapOnResize : 'a class_t -> bool
    val getRowCount : 'a class_t -> LargeInt.int
    val getWindowTitle : 'a class_t -> string
    val matchAddGregex :
      'a class_t
       -> GLib.RegexRecord.t
       -> GLib.RegexMatchFlags.t
       -> LargeInt.int
    val matchCheck :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> string * LargeInt.int
    val matchCheckEvent :
      'a class_t
       -> 'b Gdk.Event.t
       -> string * LargeInt.int
    val matchRemove :
      'a class_t
       -> LargeInt.int
       -> unit
    val matchRemoveAll : 'a class_t -> unit
    val matchSetCursorName :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val matchSetCursorType :
      'a class_t
       -> LargeInt.int
       -> Gdk.CursorType.t
       -> unit
    val pasteClipboard : 'a class_t -> unit
    val pastePrimary : 'a class_t -> unit
    val ptyNewSync :
      'a class_t
       -> ptyflags_t
       -> 'b Gio.CancellableClass.t option
       -> base ptyclass_t
    val reset :
      'a class_t
       -> bool
       -> bool
       -> unit
    val searchFindNext : 'a class_t -> bool
    val searchFindPrevious : 'a class_t -> bool
    val searchGetGregex : 'a class_t -> GLib.RegexRecord.t
    val searchGetWrapAround : 'a class_t -> bool
    val searchSetGregex :
      'a class_t
       -> GLib.RegexRecord.t option
       -> GLib.RegexMatchFlags.t
       -> unit
    val searchSetWrapAround :
      'a class_t
       -> bool
       -> unit
    val selectAll : 'a class_t -> unit
    val setAllowBold :
      'a class_t
       -> bool
       -> unit
    val setAudibleBell :
      'a class_t
       -> bool
       -> unit
    val setBackspaceBinding :
      'a class_t
       -> erasebinding_t
       -> unit
    val setCjkAmbiguousWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setColorBackground :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorBold :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorCursor :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorForeground :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorHighlight :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorHighlightForeground :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColors :
      'a class_t
       -> GdkRgbaRecord.t option
       -> GdkRgbaRecord.t option
       -> unit
    val setCursorBlinkMode :
      'a class_t
       -> cursorblinkmode_t
       -> unit
    val setCursorShape :
      'a class_t
       -> cursorshape_t
       -> unit
    val setDefaultColors : 'a class_t -> unit
    val setDeleteBinding :
      'a class_t
       -> erasebinding_t
       -> unit
    val setEncoding :
      'a class_t
       -> string option
       -> bool
    val setFont :
      'a class_t
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val setFontScale :
      'a class_t
       -> real
       -> unit
    val setGeometryHintsForWindow :
      'a class_t
       -> 'b Gtk.WindowClass.t
       -> unit
    val setInputEnabled :
      'a class_t
       -> bool
       -> unit
    val setMouseAutohide :
      'a class_t
       -> bool
       -> unit
    val setPty :
      'a class_t
       -> 'b ptyclass_t option
       -> unit
    val setRewrapOnResize :
      'a class_t
       -> bool
       -> unit
    val setScrollOnKeystroke :
      'a class_t
       -> bool
       -> unit
    val setScrollOnOutput :
      'a class_t
       -> bool
       -> unit
    val setScrollbackLines :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val spawnSync :
      'a class_t
       -> ptyflags_t
       -> string option
       -> string list
       -> string list option
       -> GLib.SpawnFlags.t
       -> GLib.SpawnChildSetupFunc.t option
       -> 'a Gio.CancellableClass.t option
       -> GLib.Pid.t
    val unselectAll : 'a class_t -> unit
    val watchChild :
      'a class_t
       -> LargeInt.int
       -> unit
    val writeContentsSync :
      'a class_t
       -> 'b Gio.OutputStreamClass.t
       -> writeflags_t
       -> 'c Gio.CancellableClass.t option
       -> bool
    val bellSig : (unit -> unit) -> 'a class_t Signal.signal
    val charSizeChangedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val childExitedSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val commitSig :
      (string
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val contentsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val currentDirectoryUriChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val currentFileUriChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val cursorMovedSig : (unit -> unit) -> 'a class_t Signal.signal
    val decreaseFontSizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val deiconifyWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val encodingChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val eofSig : (unit -> unit) -> 'a class_t Signal.signal
    val iconTitleChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val iconifyWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val increaseFontSizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val lowerWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val maximizeWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveWindowSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pasteClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val raiseWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val refreshWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val resizeWindowSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val restoreWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textDeletedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textInsertedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textModifiedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textScrolledSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val windowTitleChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val allowBoldProp : ('a class_t, bool, bool) Property.readwrite
    val audibleBellProp : ('a class_t, bool, bool) Property.readwrite
    val backspaceBindingProp : ('a class_t, erasebinding_t, erasebinding_t) Property.readwrite
    val cjkAmbiguousWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val currentDirectoryUriProp : ('a class_t, string option) Property.readonly
    val currentFileUriProp : ('a class_t, string option) Property.readonly
    val cursorBlinkModeProp : ('a class_t, cursorblinkmode_t, cursorblinkmode_t) Property.readwrite
    val cursorShapeProp : ('a class_t, cursorshape_t, cursorshape_t) Property.readwrite
    val deleteBindingProp : ('a class_t, erasebinding_t, erasebinding_t) Property.readwrite
    val encodingProp : ('a class_t, string option, string option) Property.readwrite
    val fontDescProp : ('a class_t, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val fontScaleProp : ('a class_t, real, real) Property.readwrite
    val iconTitleProp : ('a class_t, string option) Property.readonly
    val inputEnabledProp : ('a class_t, bool, bool) Property.readwrite
    val pointerAutohideProp : ('a class_t, bool, bool) Property.readwrite
    val ptyProp : ('a class_t, base ptyclass_t option, 'b ptyclass_t option) Property.readwrite
    val rewrapOnResizeProp : ('a class_t, bool, bool) Property.readwrite
    val scrollOnKeystrokeProp : ('a class_t, bool, bool) Property.readwrite
    val scrollOnOutputProp : ('a class_t, bool, bool) Property.readwrite
    val scrollbackLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val windowTitleProp : ('a class_t, string option) Property.readonly
  end
