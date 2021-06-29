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
       -> GUInt8CArrayN.t
       -> unit
    val feedChild :
      'a class
       -> string * LargeInt.int
       -> unit
    val feedChildBinary :
      'a class
       -> string * LargeInt.int
       -> unit
    (**
     * `forkCommandFull` has no child setup callback parameter because it
     * cannot work: the child setup callback _must_ call vte_pty_child_setup
     * (not documented in API) but vte_pty_child_setup requires the
     * terminal's VtePty object as its argument which is not available to the
     * callback.  vte_terminal_get_pty_object cannot be used in the child
     * setup callback because vte_terminal_set_pty_object occurs after
     * __vte_pty_spawn in vte_terminal_fork_command_full.  The binding always
     * uses NULL as the callback function which causes vte_pty_child_setup to
     * be called internally.
     *)
    val forkCommandFull :
      'a class
       -> pty_flags_t
           * string option
           * Utf8CPtrArray.t
           * Utf8CPtrArray.t option
           * GLib.SpawnFlags.t
       -> GLib.Pid.t
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
           * GdkColorRecordCArrayN.t
       -> unit
    val setColorsRgba :
      'a class
       -> Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t option
           * GdkRgbaRecordCArrayN.t
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
       -> GLib.Pid.t
       -> unit
    val writeContents :
      'a class
       -> 'b Gio.OutputStreamClass.class
           * terminal_write_flags_t
           * 'c Gio.CancellableClass.class option
       -> unit
    val beepSig : ('a class, unit, unit, unit, unit) Signal.t
    val charSizeChangedSig : ('a class, LargeInt.int * LargeInt.int, LargeInt.int * LargeInt.int, unit, unit) Signal.t
    val childExitedSig : ('a class, unit, unit, unit, unit) Signal.t
    val commitSig : ('a class, string * LargeInt.int, string * LargeInt.int, unit, unit) Signal.t
    val contentsChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val copyClipboardSig : ('a class, unit, unit, unit, unit) Signal.t
    val currentDirectoryUriChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val currentFileUriChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val cursorMovedSig : ('a class, unit, unit, unit, unit) Signal.t
    val decreaseFontSizeSig : ('a class, unit, unit, unit, unit) Signal.t
    val deiconifyWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val emulationChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val encodingChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val eofSig : ('a class, unit, unit, unit, unit) Signal.t
    val iconTitleChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val iconifyWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val increaseFontSizeSig : ('a class, unit, unit, unit, unit) Signal.t
    val lowerWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val maximizeWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val moveWindowSig : ('a class, LargeInt.int * LargeInt.int, LargeInt.int * LargeInt.int, unit, unit) Signal.t
    val pasteClipboardSig : ('a class, unit, unit, unit, unit) Signal.t
    val raiseWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val refreshWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val resizeWindowSig : ('a class, LargeInt.int * LargeInt.int, LargeInt.int * LargeInt.int, unit, unit) Signal.t
    val restoreWindowSig : ('a class, unit, unit, unit, unit) Signal.t
    val selectionChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val statusLineChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val textDeletedSig : ('a class, unit, unit, unit, unit) Signal.t
    val textInsertedSig : ('a class, unit, unit, unit, unit) Signal.t
    val textModifiedSig : ('a class, unit, unit, unit, unit) Signal.t
    val textScrolledSig : ('a class, LargeInt.int, LargeInt.int, unit, unit) Signal.t
    val windowTitleChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val allowBoldProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val audibleBellProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backgroundImageFileProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val backgroundImagePixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val backgroundOpacityProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val backgroundSaturationProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val backgroundTintColorProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val backgroundTransparentProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backspaceBindingProp : ('a class, unit -> terminal_erase_binding_t, terminal_erase_binding_t -> unit, terminal_erase_binding_t -> unit) Property.t
    val currentDirectoryUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val currentFileUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val cursorBlinkModeProp : ('a class, unit -> terminal_cursor_blink_mode_t, terminal_cursor_blink_mode_t -> unit, terminal_cursor_blink_mode_t -> unit) Property.t
    val cursorShapeProp : ('a class, unit -> terminal_cursor_shape_t, terminal_cursor_shape_t -> unit, terminal_cursor_shape_t -> unit) Property.t
    val deleteBindingProp : ('a class, unit -> terminal_erase_binding_t, terminal_erase_binding_t -> unit, terminal_erase_binding_t -> unit) Property.t
    val emulationProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val encodingProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val iconTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val pointerAutohideProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val ptyProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val ptyObjectProp : ('a class, unit -> base pty_class option, 'b pty_class option -> unit, 'b pty_class option -> unit) Property.t
    val rewrapOnResizeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollBackgroundProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnKeystrokeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnOutputProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollbackLinesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val visibleBellProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val windowTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val wordCharsProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
