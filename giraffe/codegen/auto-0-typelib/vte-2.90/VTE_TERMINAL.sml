signature VTE_TERMINAL =
  sig
    type 'a class
    type pty_flags_t
    type terminal_write_flags_t
    type terminal_cursor_blink_mode_t
    type terminal_cursor_shape_t
    type terminal_erase_binding_t
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
       -> Word8Vector.vector
       -> unit
    val feedChild :
      'a class
       -> string * LargeInt.int
       -> unit
    val feedChildBinary :
      'a class
       -> string * LargeInt.int
       -> unit
    val getAllowBold : 'a class -> bool
    val getAudibleBell : 'a class -> bool
    val getCharHeight : 'a class -> LargeInt.int
    val getCharWidth : 'a class -> LargeInt.int
    val getChildExitStatus : 'a class -> LargeInt.int
    val getColumnCount : 'a class -> LargeInt.int
    val getCurrentDirectoryUri : 'a class -> string
    val getCurrentFileUri : 'a class -> string
    val getCursorBlinkMode : 'a class -> terminal_cursor_blink_mode_t
    val getCursorPosition : 'a class -> LargeInt.int * LargeInt.int
    val getCursorShape : 'a class -> terminal_cursor_shape_t
    val getDefaultEmulation : 'a class -> string
    val getEmulation : 'a class -> string
    val getEncoding : 'a class -> string
    val getFont : 'a class -> Pango.FontDescriptionRecord.t
    val getHasSelection : 'a class -> bool
    val getIconTitle : 'a class -> string
    val getMouseAutohide : 'a class -> bool
    val getPtyObject : 'a class -> base pty_class
    val getRewrapOnResize : 'a class -> bool
    val getRowCount : 'a class -> LargeInt.int
    val getStatusLine : 'a class -> string
    val getVisibleBell : 'a class -> bool
    val getWindowTitle : 'a class -> string
    val isWordChar :
      'a class
       -> char
       -> bool
    val matchAddGregex :
      'a class
       -> GLib.RegexRecord.t * GLib.RegexMatchFlags.t
       -> LargeInt.int
    val matchCheck :
      'a class
       -> LargeInt.int * LargeInt.int
       -> string * LargeInt.int
    val matchClearAll : 'a class -> unit
    val matchRemove :
      'a class
       -> LargeInt.int
       -> unit
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
    val ptyNew :
      'a class
       -> pty_flags_t
       -> base pty_class
    val reset :
      'a class
       -> bool * bool
       -> unit
    val searchFindNext : 'a class -> bool
    val searchFindPrevious : 'a class -> bool
    val searchGetGregex : 'a class -> GLib.RegexRecord.t
    val searchGetWrapAround : 'a class -> bool
    val searchSetGregex :
      'a class
       -> GLib.RegexRecord.t option
       -> unit
    val searchSetWrapAround :
      'a class
       -> bool
       -> unit
    val selectAll : 'a class -> unit
    val selectNone : 'a class -> unit
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
       -> terminal_erase_binding_t
       -> unit
    val setColorBackground :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setColorBackgroundRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorBold :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setColorBoldRgba :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorCursor :
      'a class
       -> Gdk.ColorRecord.t option
       -> unit
    val setColorCursorRgba :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorDim :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setColorDimRgba :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorForeground :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setColorForegroundRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setColorHighlight :
      'a class
       -> Gdk.ColorRecord.t option
       -> unit
    val setColorHighlightForeground :
      'a class
       -> Gdk.ColorRecord.t option
       -> unit
    val setColorHighlightForegroundRgba :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColorHighlightRgba :
      'a class
       -> Gdk.RgbaRecord.t option
       -> unit
    val setColors :
      'a class
       -> Gdk.ColorRecord.t option
           * Gdk.ColorRecord.t option
           * Gdk.ColorRecord.t vector
       -> unit
    val setColorsRgba :
      'a class
       -> Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t vector
       -> unit
    val setCursorBlinkMode :
      'a class
       -> terminal_cursor_blink_mode_t
       -> unit
    val setCursorShape :
      'a class
       -> terminal_cursor_shape_t
       -> unit
    val setDefaultColors : 'a class -> unit
    val setDeleteBinding :
      'a class
       -> terminal_erase_binding_t
       -> unit
    val setEmulation :
      'a class
       -> string option
       -> unit
    val setEncoding :
      'a class
       -> string option
       -> unit
    val setFont :
      'a class
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val setFontFromString :
      'a class
       -> string
       -> unit
    val setMouseAutohide :
      'a class
       -> bool
       -> unit
    val setPtyObject :
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
    val setScrollbackLines :
      'a class
       -> LargeInt.int
       -> unit
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setVisibleBell :
      'a class
       -> bool
       -> unit
    val setWordChars :
      'a class
       -> string
       -> unit
    val watchChild :
      'a class
       -> LargeInt.int
       -> unit
    val writeContents :
      'a class
       -> 'b Gio.OutputStreamClass.class
           * terminal_write_flags_t
           * 'c Gio.CancellableClass.class option
       -> unit
    val beepSig : (unit -> unit) -> 'a class Signal.t
    val charSizeChangedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val childExitedSig : (unit -> unit) -> 'a class Signal.t
    val commitSig : (string * LargeInt.int -> unit) -> 'a class Signal.t
    val contentsChangedSig : (unit -> unit) -> 'a class Signal.t
    val copyClipboardSig : (unit -> unit) -> 'a class Signal.t
    val currentDirectoryUriChangedSig : (unit -> unit) -> 'a class Signal.t
    val currentFileUriChangedSig : (unit -> unit) -> 'a class Signal.t
    val cursorMovedSig : (unit -> unit) -> 'a class Signal.t
    val decreaseFontSizeSig : (unit -> unit) -> 'a class Signal.t
    val deiconifyWindowSig : (unit -> unit) -> 'a class Signal.t
    val emulationChangedSig : (unit -> unit) -> 'a class Signal.t
    val encodingChangedSig : (unit -> unit) -> 'a class Signal.t
    val eofSig : (unit -> unit) -> 'a class Signal.t
    val iconTitleChangedSig : (unit -> unit) -> 'a class Signal.t
    val iconifyWindowSig : (unit -> unit) -> 'a class Signal.t
    val increaseFontSizeSig : (unit -> unit) -> 'a class Signal.t
    val lowerWindowSig : (unit -> unit) -> 'a class Signal.t
    val maximizeWindowSig : (unit -> unit) -> 'a class Signal.t
    val moveWindowSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val pasteClipboardSig : (unit -> unit) -> 'a class Signal.t
    val raiseWindowSig : (unit -> unit) -> 'a class Signal.t
    val refreshWindowSig : (unit -> unit) -> 'a class Signal.t
    val resizeWindowSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val restoreWindowSig : (unit -> unit) -> 'a class Signal.t
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val statusLineChangedSig : (unit -> unit) -> 'a class Signal.t
    val textDeletedSig : (unit -> unit) -> 'a class Signal.t
    val textInsertedSig : (unit -> unit) -> 'a class Signal.t
    val textModifiedSig : (unit -> unit) -> 'a class Signal.t
    val textScrolledSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val windowTitleChangedSig : (unit -> unit) -> 'a class Signal.t
    val allowBoldProp : ('a class, bool, bool) Property.readwrite
    val audibleBellProp : ('a class, bool, bool) Property.readwrite
    val backgroundImageFileProp : ('a class, string option, string option) Property.readwrite
    val backgroundImagePixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val backgroundOpacityProp : ('a class, real, real) Property.readwrite
    val backgroundSaturationProp : ('a class, real, real) Property.readwrite
    val backgroundTintColorProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundTransparentProp : ('a class, bool, bool) Property.readwrite
    val backspaceBindingProp : ('a class, terminal_erase_binding_t, terminal_erase_binding_t) Property.readwrite
    val currentDirectoryUriProp : ('a class, string option) Property.readonly
    val currentFileUriProp : ('a class, string option) Property.readonly
    val cursorBlinkModeProp : ('a class, terminal_cursor_blink_mode_t, terminal_cursor_blink_mode_t) Property.readwrite
    val cursorShapeProp : ('a class, terminal_cursor_shape_t, terminal_cursor_shape_t) Property.readwrite
    val deleteBindingProp : ('a class, terminal_erase_binding_t, terminal_erase_binding_t) Property.readwrite
    val emulationProp : ('a class, string option, string option) Property.readwrite
    val encodingProp : ('a class, string option, string option) Property.readwrite
    val fontDescProp : ('a class, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val iconTitleProp : ('a class, string option) Property.readonly
    val pointerAutohideProp : ('a class, bool, bool) Property.readwrite
    val ptyProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val ptyObjectProp : ('a class, base pty_class option, 'b pty_class option) Property.readwrite
    val rewrapOnResizeProp : ('a class, bool, bool) Property.readwrite
    val scrollBackgroundProp : ('a class, bool, bool) Property.readwrite
    val scrollOnKeystrokeProp : ('a class, bool, bool) Property.readwrite
    val scrollOnOutputProp : ('a class, bool, bool) Property.readwrite
    val scrollbackLinesProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val visibleBellProp : ('a class, bool, bool) Property.readwrite
    val windowTitleProp : ('a class, string option) Property.readonly
    val wordCharsProp : ('a class, string option, string option) Property.readwrite
  end
