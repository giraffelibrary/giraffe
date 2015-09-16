signature GTK_TEXT_VIEW =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a scrollable_class_t
    type 'a text_child_anchor_class_t
    type text_attributes_record_t
    type 'a widget_class_t
    type 'a text_mark_class_t
    type text_iter_record_t
    type text_window_type_t
    type delete_type_t
    type movement_step_t
    type scroll_step_t
    type 'a menu_class_t
    type 'a text_buffer_class_t
    type justification_t
    type wrap_mode_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asScrollable : 'a class_t -> base scrollable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithBuffer : 'a text_buffer_class_t -> base class_t
    val addChildAtAnchor :
      'a class_t
       -> 'b widget_class_t
       -> 'c text_child_anchor_class_t
       -> unit
    val addChildInWindow :
      'a class_t
       -> 'b widget_class_t
       -> text_window_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val backwardDisplayLine :
      'a class_t
       -> text_iter_record_t
       -> bool
    val backwardDisplayLineStart :
      'a class_t
       -> text_iter_record_t
       -> bool
    val bufferToWindowCoords :
      'a class_t
       -> text_window_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val forwardDisplayLine :
      'a class_t
       -> text_iter_record_t
       -> bool
    val forwardDisplayLineEnd :
      'a class_t
       -> text_iter_record_t
       -> bool
    val getAcceptsTab : 'a class_t -> bool
    val getBorderWindowSize :
      'a class_t
       -> text_window_type_t
       -> LargeInt.int
    val getBuffer : 'a class_t -> base text_buffer_class_t
    val getCursorLocations :
      'a class_t
       -> text_iter_record_t option
       -> Gdk.RectangleRecord.t * Gdk.RectangleRecord.t
    val getCursorVisible : 'a class_t -> bool
    val getDefaultAttributes : 'a class_t -> text_attributes_record_t
    val getEditable : 'a class_t -> bool
    val getIndent : 'a class_t -> LargeInt.int
    val getIterAtLocation :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> text_iter_record_t
    val getIterAtPosition :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> text_iter_record_t * LargeInt.int
    val getIterLocation :
      'a class_t
       -> text_iter_record_t
       -> Gdk.RectangleRecord.t
    val getJustification : 'a class_t -> justification_t
    val getLeftMargin : 'a class_t -> LargeInt.int
    val getLineAtY :
      'a class_t
       -> LargeInt.int
       -> text_iter_record_t * LargeInt.int
    val getLineYrange :
      'a class_t
       -> text_iter_record_t
       -> LargeInt.int * LargeInt.int
    val getOverwrite : 'a class_t -> bool
    val getPixelsAboveLines : 'a class_t -> LargeInt.int
    val getPixelsBelowLines : 'a class_t -> LargeInt.int
    val getPixelsInsideWrap : 'a class_t -> LargeInt.int
    val getRightMargin : 'a class_t -> LargeInt.int
    val getTabs : 'a class_t -> Pango.TabArrayRecord.t
    val getVisibleRect : 'a class_t -> Gdk.RectangleRecord.t
    val getWindow :
      'a class_t
       -> text_window_type_t
       -> base Gdk.WindowClass.t
    val getWindowType :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> text_window_type_t
    val getWrapMode : 'a class_t -> wrap_mode_t
    val imContextFilterKeypress :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val moveChild :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val moveMarkOnscreen :
      'a class_t
       -> 'b text_mark_class_t
       -> bool
    val moveVisually :
      'a class_t
       -> text_iter_record_t
       -> LargeInt.int
       -> bool
    val placeCursorOnscreen : 'a class_t -> bool
    val resetImContext : 'a class_t -> unit
    val scrollMarkOnscreen :
      'a class_t
       -> 'b text_mark_class_t
       -> unit
    val scrollToIter :
      'a class_t
       -> text_iter_record_t
       -> real
       -> bool
       -> real
       -> real
       -> bool
    val scrollToMark :
      'a class_t
       -> 'b text_mark_class_t
       -> real
       -> bool
       -> real
       -> real
       -> unit
    val setAcceptsTab :
      'a class_t
       -> bool
       -> unit
    val setBorderWindowSize :
      'a class_t
       -> text_window_type_t
       -> LargeInt.int
       -> unit
    val setBuffer :
      'a class_t
       -> 'b text_buffer_class_t option
       -> unit
    val setCursorVisible :
      'a class_t
       -> bool
       -> unit
    val setEditable :
      'a class_t
       -> bool
       -> unit
    val setIndent :
      'a class_t
       -> LargeInt.int
       -> unit
    val setJustification :
      'a class_t
       -> justification_t
       -> unit
    val setLeftMargin :
      'a class_t
       -> LargeInt.int
       -> unit
    val setOverwrite :
      'a class_t
       -> bool
       -> unit
    val setPixelsAboveLines :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPixelsBelowLines :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPixelsInsideWrap :
      'a class_t
       -> LargeInt.int
       -> unit
    val setRightMargin :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTabs :
      'a class_t
       -> Pango.TabArrayRecord.t
       -> unit
    val setWrapMode :
      'a class_t
       -> wrap_mode_t
       -> unit
    val startsDisplayLine :
      'a class_t
       -> text_iter_record_t
       -> bool
    val windowToBufferCoords :
      'a class_t
       -> text_window_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val backspaceSig : (unit -> unit) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val cutClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val deleteFromCursorSig :
      (delete_type_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val insertAtCursorSig : (string -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (movement_step_t
        -> LargeInt.int
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val moveViewportSig :
      (scroll_step_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pasteClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val populatePopupSig : (base menu_class_t -> unit) -> 'a class_t Signal.signal
    val preeditChangedSig : (string -> unit) -> 'a class_t Signal.signal
    val selectAllSig : (bool -> unit) -> 'a class_t Signal.signal
    val setAnchorSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleCursorVisibleSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleOverwriteSig : (unit -> unit) -> 'a class_t Signal.signal
    val acceptsTabProp : ('a class_t, bool, bool) Property.readwrite
    val bufferProp : ('a class_t, base text_buffer_class_t option, 'b text_buffer_class_t option) Property.readwrite
    val cursorVisibleProp : ('a class_t, bool, bool) Property.readwrite
    val editableProp : ('a class_t, bool, bool) Property.readwrite
    val imModuleProp : ('a class_t, string option, string option) Property.readwrite
    val indentProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val justificationProp : ('a class_t, justification_t, justification_t) Property.readwrite
    val leftMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val overwriteProp : ('a class_t, bool, bool) Property.readwrite
    val pixelsAboveLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsBelowLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsInsideWrapProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rightMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tabsProp : ('a class_t, Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option) Property.readwrite
    val wrapModeProp : ('a class_t, wrap_mode_t, wrap_mode_t) Property.readwrite
  end
