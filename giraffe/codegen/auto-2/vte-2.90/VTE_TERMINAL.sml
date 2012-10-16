signature VTE_TERMINAL =
  sig
    type 'a class_t
    type 'a ptyclass_t
    type terminalerasebinding_t
    type terminalcursorshape_t
    type terminalcursorblinkmode_t
    type terminalwriteflags_t
    type ptyflags_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base Gtk.BuildableClass.t
    val asScrollable : 'a class_t -> base Gtk.ScrollableClass.t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val copyClipboard : 'a class_t -> unit
    val copyPrimary : 'a class_t -> unit
    val feed :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val feedChild :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val feedChildBinary :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val forkCommandFull :
      'a class_t
       -> ptyflags_t
       -> string option
       -> string list
       -> string list option
       -> GLibSpawnFlags.t
       -> Pid.t
    val getAllowBold : 'a class_t -> bool
    val getAudibleBell : 'a class_t -> bool
    val getCharHeight : 'a class_t -> LargeInt.int
    val getCharWidth : 'a class_t -> LargeInt.int
    val getChildExitStatus : 'a class_t -> LargeInt.int
    val getColumnCount : 'a class_t -> LargeInt.int
    val getCursorBlinkMode : 'a class_t -> terminalcursorblinkmode_t
    val getCursorShape : 'a class_t -> terminalcursorshape_t
    val getDefaultEmulation : 'a class_t -> string
    val getEmulation : 'a class_t -> string
    val getEncoding : 'a class_t -> string
    val getFont : 'a class_t -> Pango.FontDescriptionRecord.t
    val getHasSelection : 'a class_t -> bool
    val getIconTitle : 'a class_t -> string
    val getMouseAutohide : 'a class_t -> bool
    val getPtyObject : 'a class_t -> base ptyclass_t
    val getRowCount : 'a class_t -> LargeInt.int
    val getStatusLine : 'a class_t -> string
    val getVisibleBell : 'a class_t -> bool
    val getWindowTitle : 'a class_t -> string
    val imAppendMenuitems :
      'a class_t
       -> 'b Gtk.MenuShellClass.t
       -> unit
    val isWordChar :
      'a class_t
       -> char
       -> bool
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
    val matchClearAll : 'a class_t -> unit
    val matchRemove :
      'a class_t
       -> LargeInt.int
       -> unit
    val matchSetCursor :
      'a class_t
       -> LargeInt.int
       -> 'b Gdk.CursorClass.t option
       -> unit
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
    val ptyNew :
      'a class_t
       -> ptyflags_t
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
       -> unit
    val searchSetWrapAround :
      'a class_t
       -> bool
       -> unit
    val selectAll : 'a class_t -> unit
    val selectNone : 'a class_t -> unit
    val setAllowBold :
      'a class_t
       -> bool
       -> unit
    val setAudibleBell :
      'a class_t
       -> bool
       -> unit
    val setBackgroundImage :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setBackgroundImageFile :
      'a class_t
       -> string
       -> unit
    val setBackgroundSaturation :
      'a class_t
       -> real
       -> unit
    val setBackgroundTintColor :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setBackgroundTransparent :
      'a class_t
       -> bool
       -> unit
    val setBackspaceBinding :
      'a class_t
       -> terminalerasebinding_t
       -> unit
    val setColorBackground :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setColorBackgroundRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorBold :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setColorBoldRgba :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorCursor :
      'a class_t
       -> Gdk.ColorRecord.t option
       -> unit
    val setColorCursorRgba :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorDim :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setColorDimRgba :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorForeground :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setColorForegroundRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorHighlight :
      'a class_t
       -> Gdk.ColorRecord.t option
       -> unit
    val setColorHighlightRgba :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColors :
      'a class_t
       -> GdkColorRecord.t option
       -> GdkColorRecord.t option
       -> unit
    val setCursorBlinkMode :
      'a class_t
       -> terminalcursorblinkmode_t
       -> unit
    val setCursorShape :
      'a class_t
       -> terminalcursorshape_t
       -> unit
    val setDefaultColors : 'a class_t -> unit
    val setDeleteBinding :
      'a class_t
       -> terminalerasebinding_t
       -> unit
    val setEmulation :
      'a class_t
       -> string option
       -> unit
    val setEncoding :
      'a class_t
       -> string option
       -> unit
    val setFont :
      'a class_t
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val setFontFromString :
      'a class_t
       -> string
       -> unit
    val setMouseAutohide :
      'a class_t
       -> bool
       -> unit
    val setOpacity :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPtyObject :
      'a class_t
       -> 'b ptyclass_t option
       -> unit
    val setScrollBackground :
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
    val setVisibleBell :
      'a class_t
       -> bool
       -> unit
    val setWordChars :
      'a class_t
       -> string
       -> unit
    val watchChild :
      'a class_t
       -> LargeInt.int
       -> unit
    val writeContents :
      'a class_t
       -> 'b Gio.OutputStreamClass.t
       -> terminalwriteflags_t
       -> 'c Gio.CancellableClass.t option
       -> bool
    val beepSig : (unit -> unit) -> 'a class_t Signal.signal
    val charSizeChangedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val childExitedSig : (unit -> unit) -> 'a class_t Signal.signal
    val commitSig :
      (string
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val contentsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val cursorMovedSig : (unit -> unit) -> 'a class_t Signal.signal
    val decreaseFontSizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val deiconifyWindowSig : (unit -> unit) -> 'a class_t Signal.signal
    val emulationChangedSig : (unit -> unit) -> 'a class_t Signal.signal
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
    val statusLineChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textDeletedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textInsertedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textModifiedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textScrolledSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val windowTitleChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val allowBoldProp : ('a class_t, bool, bool) Property.readwrite
    val audibleBellProp : ('a class_t, bool, bool) Property.readwrite
    val backgroundImageFileProp : ('a class_t, string option, string option) Property.readwrite
    val backgroundImagePixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val backgroundOpacityProp : ('a class_t, real, real) Property.readwrite
    val backgroundSaturationProp : ('a class_t, real, real) Property.readwrite
    val backgroundTintColorProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundTransparentProp : ('a class_t, bool, bool) Property.readwrite
    val backspaceBindingProp : ('a class_t, terminalerasebinding_t, terminalerasebinding_t) Property.readwrite
    val cursorBlinkModeProp : ('a class_t, terminalcursorblinkmode_t, terminalcursorblinkmode_t) Property.readwrite
    val cursorShapeProp : ('a class_t, terminalcursorshape_t, terminalcursorshape_t) Property.readwrite
    val deleteBindingProp : ('a class_t, terminalerasebinding_t, terminalerasebinding_t) Property.readwrite
    val emulationProp : ('a class_t, string option, string option) Property.readwrite
    val encodingProp : ('a class_t, string option, string option) Property.readwrite
    val fontDescProp : ('a class_t, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val iconTitleProp : ('a class_t, string option) Property.readonly
    val pointerAutohideProp : ('a class_t, bool, bool) Property.readwrite
    val ptyProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val ptyObjectProp : ('a class_t, base ptyclass_t option, 'b ptyclass_t option) Property.readwrite
    val scrollBackgroundProp : ('a class_t, bool, bool) Property.readwrite
    val scrollOnKeystrokeProp : ('a class_t, bool, bool) Property.readwrite
    val scrollOnOutputProp : ('a class_t, bool, bool) Property.readwrite
    val scrollbackLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val visibleBellProp : ('a class_t, bool, bool) Property.readwrite
    val windowTitleProp : ('a class_t, string option) Property.readonly
    val wordCharsProp : ('a class_t, string option, string option) Property.readwrite
  end
