signature VTE_TERMINAL =
  sig
    type 'a class
    type format_t
    type regex_record_c_ptr_array_n_t
    type pty_flags_t
    type regex_t
    type write_flags_t
    type cursor_blink_mode_t
    type cursor_shape_t
    type erase_binding_t
    type 'a pty_class
    type text_blink_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val asScrollable : 'a class -> base Gtk.ScrollableClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val copyClipboard : 'a class -> unit
    val copyClipboardFormat :
      'a class
       -> format_t
       -> unit
    val copyPrimary : 'a class -> unit
    val eventCheckRegexSimple :
      'a class
       -> 'b Gdk.Event.union
           * regex_record_c_ptr_array_n_t
           * LargeInt.int
       -> Utf8CPtrArrayN.t
    val feed :
      'a class
       -> GUInt8CArrayN.t
       -> unit
    val feedChild :
      'a class
       -> GUInt8CArrayN.t
       -> unit
    val feedChildBinary :
      'a class
       -> GUInt8CArrayN.t
       -> unit
    val getAllowBold : 'a class -> bool
    val getAllowHyperlink : 'a class -> bool
    val getAudibleBell : 'a class -> bool
    val getBoldIsBright : 'a class -> bool
    val getCellHeightScale : 'a class -> real
    val getCellWidthScale : 'a class -> real
    val getCharHeight : 'a class -> LargeInt.int
    val getCharWidth : 'a class -> LargeInt.int
    val getCjkAmbiguousWidth : 'a class -> LargeInt.int
    val getColorBackgroundForDraw : 'a class -> Gdk.RgbaRecord.t
    val getColumnCount : 'a class -> LargeInt.int
    val getCurrentContainerName : 'a class -> string option
    val getCurrentContainerRuntime : 'a class -> string option
    val getCurrentDirectoryUri : 'a class -> string option
    val getCurrentFileUri : 'a class -> string option
    val getCursorBlinkMode : 'a class -> cursor_blink_mode_t
    val getCursorPosition : 'a class -> LargeInt.int * LargeInt.int
    val getCursorShape : 'a class -> cursor_shape_t
    val getEnableBidi : 'a class -> bool
    val getEnableShaping : 'a class -> bool
    val getEnableSixel : 'a class -> bool
    val getEncoding : 'a class -> string option
    val getFont : 'a class -> Pango.FontDescriptionRecord.t
    val getFontScale : 'a class -> real
    val getGeometryHints :
      'a class
       -> LargeInt.int * LargeInt.int
       -> Gdk.GeometryRecord.t
    val getHasSelection : 'a class -> bool
    val getIconTitle : 'a class -> string option
    val getInputEnabled : 'a class -> bool
    val getMouseAutohide : 'a class -> bool
    val getPty : 'a class -> base pty_class
    val getRewrapOnResize : 'a class -> bool
    val getRowCount : 'a class -> LargeInt.int
    val getScrollOnKeystroke : 'a class -> bool
    val getScrollOnOutput : 'a class -> bool
    val getScrollbackLines : 'a class -> LargeInt.int
    val getTextBlinkMode : 'a class -> text_blink_mode_t
    val getWindowTitle : 'a class -> string option
    val getWordCharExceptions : 'a class -> string option
    val hyperlinkCheckEvent :
      'a class
       -> 'b Gdk.Event.union
       -> string option
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
       -> string option * LargeInt.int
    val matchCheckEvent :
      'a class
       -> 'b Gdk.Event.union
       -> string option * LargeInt.int
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
    val setAllowHyperlink :
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
    val setBoldIsBright :
      'a class
       -> bool
       -> unit
    val setCellHeightScale :
      'a class
       -> real
       -> unit
    val setCellWidthScale :
      'a class
       -> real
       -> unit
    val setCjkAmbiguousWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setClearBackground :
      'a class
       -> bool
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
           * GdkRgbaRecordCArrayN.t
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
    val setEnableBidi :
      'a class
       -> bool
       -> unit
    val setEnableShaping :
      'a class
       -> bool
       -> unit
    val setEnableSixel :
      'a class
       -> bool
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
    val setTextBlinkMode :
      'a class
       -> text_blink_mode_t
       -> unit
    val setWordCharExceptions :
      'a class
       -> string
       -> unit
    val spawnSync :
      'a class
       -> pty_flags_t
           * string option
           * Utf8CPtrArray.t
           * Utf8CPtrArray.t option
           * GLib.SpawnFlags.t
           * GLib.SpawnChildSetupFunc.t option
           * 'a Gio.CancellableClass.class option
       -> GLib.Pid.t
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
    val bellSig : ('a class, unit, unit) Signal.t
    val charSizeChangedSig : ('a class, LargeInt.int * LargeInt.int -> unit, LargeInt.int * LargeInt.int -> unit) Signal.t
    val childExitedSig : ('a class, LargeInt.int -> unit, LargeInt.int -> unit) Signal.t
    val commitSig : ('a class, string * LargeInt.int -> unit, string * LargeInt.int -> unit) Signal.t
    val contentsChangedSig : ('a class, unit, unit) Signal.t
    val copyClipboardSig : ('a class, unit, unit) Signal.t
    val currentDirectoryUriChangedSig : ('a class, unit, unit) Signal.t
    val currentFileUriChangedSig : ('a class, unit, unit) Signal.t
    val cursorMovedSig : ('a class, unit, unit) Signal.t
    val decreaseFontSizeSig : ('a class, unit, unit) Signal.t
    val deiconifyWindowSig : ('a class, unit, unit) Signal.t
    val encodingChangedSig : ('a class, unit, unit) Signal.t
    val eofSig : ('a class, unit, unit) Signal.t
    val hyperlinkHoverUriChangedSig : ('a class, string * Gdk.RectangleRecord.t -> unit, string * Gdk.RectangleRecord.t -> unit) Signal.t
    val iconTitleChangedSig : ('a class, unit, unit) Signal.t
    val iconifyWindowSig : ('a class, unit, unit) Signal.t
    val increaseFontSizeSig : ('a class, unit, unit) Signal.t
    val lowerWindowSig : ('a class, unit, unit) Signal.t
    val maximizeWindowSig : ('a class, unit, unit) Signal.t
    val moveWindowSig : ('a class, LargeInt.int * LargeInt.int -> unit, LargeInt.int * LargeInt.int -> unit) Signal.t
    val notificationReceivedSig : ('a class, string * string option -> unit, string * string option -> unit) Signal.t
    val pasteClipboardSig : ('a class, unit, unit) Signal.t
    val raiseWindowSig : ('a class, unit, unit) Signal.t
    val refreshWindowSig : ('a class, unit, unit) Signal.t
    val resizeWindowSig : ('a class, LargeInt.int * LargeInt.int -> unit, LargeInt.int * LargeInt.int -> unit) Signal.t
    val restoreWindowSig : ('a class, unit, unit) Signal.t
    val selectionChangedSig : ('a class, unit, unit) Signal.t
    val shellPrecmdSig : ('a class, unit, unit) Signal.t
    val shellPreexecSig : ('a class, unit, unit) Signal.t
    val textDeletedSig : ('a class, unit, unit) Signal.t
    val textInsertedSig : ('a class, unit, unit) Signal.t
    val textModifiedSig : ('a class, unit, unit) Signal.t
    val textScrolledSig : ('a class, LargeInt.int -> unit, LargeInt.int -> unit) Signal.t
    val windowTitleChangedSig : ('a class, unit, unit) Signal.t
    val allowBoldProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val allowHyperlinkProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val audibleBellProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backspaceBindingProp : ('a class, unit -> erase_binding_t, erase_binding_t -> unit, erase_binding_t -> unit) Property.t
    val boldIsBrightProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val cellHeightScaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val cellWidthScaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val cjkAmbiguousWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val currentContainerNameProp : ('a class, unit -> string option, unit, unit) Property.t
    val currentContainerRuntimeProp : ('a class, unit -> string option, unit, unit) Property.t
    val currentDirectoryUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val currentFileUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val cursorBlinkModeProp : ('a class, unit -> cursor_blink_mode_t, cursor_blink_mode_t -> unit, cursor_blink_mode_t -> unit) Property.t
    val cursorShapeProp : ('a class, unit -> cursor_shape_t, cursor_shape_t -> unit, cursor_shape_t -> unit) Property.t
    val deleteBindingProp : ('a class, unit -> erase_binding_t, erase_binding_t -> unit, erase_binding_t -> unit) Property.t
    val enableBidiProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val enableShapingProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val enableSixelProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val encodingProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val fontScaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val hyperlinkHoverUriProp : ('a class, unit -> string option, unit, unit) Property.t
    val iconTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val inputEnabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pointerAutohideProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val ptyProp : ('a class, unit -> base pty_class option, 'b pty_class option -> unit, 'b pty_class option -> unit) Property.t
    val rewrapOnResizeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnKeystrokeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollOnOutputProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scrollSpeedProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val scrollbackLinesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val textBlinkModeProp : ('a class, unit -> text_blink_mode_t, text_blink_mode_t -> unit, text_blink_mode_t -> unit) Property.t
    val windowTitleProp : ('a class, unit -> string option, unit, unit) Property.t
    val wordCharExceptionsProp : ('a class, unit -> string option, unit, unit) Property.t
  end
