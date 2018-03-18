signature GTK_TEXT_VIEW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a scrollable_class
    type 'a text_child_anchor_class
    type text_attributes_t
    type 'a adjustment_class
    type 'a text_mark_class
    type text_window_type_t
    type delete_type_t
    type text_iter_t
    type text_extend_selection_t
    type movement_step_t
    type scroll_step_t
    type 'a widget_class
    type 'a text_buffer_class
    type input_hints_t
    type input_purpose_t
    type justification_t
    type wrap_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithBuffer : 'a text_buffer_class -> base class
    val addChildAtAnchor :
      'a class
       -> 'b widget_class * 'c text_child_anchor_class
       -> unit
    val addChildInWindow :
      'a class
       -> 'b widget_class
           * text_window_type_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val backwardDisplayLine :
      'a class
       -> text_iter_t
       -> bool
    val backwardDisplayLineStart :
      'a class
       -> text_iter_t
       -> bool
    val bufferToWindowCoords :
      'a class
       -> text_window_type_t
           * LargeInt.int
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val forwardDisplayLine :
      'a class
       -> text_iter_t
       -> bool
    val forwardDisplayLineEnd :
      'a class
       -> text_iter_t
       -> bool
    val getAcceptsTab : 'a class -> bool
    val getBorderWindowSize :
      'a class
       -> text_window_type_t
       -> LargeInt.int
    val getBottomMargin : 'a class -> LargeInt.int
    val getBuffer : 'a class -> base text_buffer_class
    val getCursorLocations :
      'a class
       -> text_iter_t option
       -> Gdk.RectangleRecord.t * Gdk.RectangleRecord.t
    val getCursorVisible : 'a class -> bool
    val getDefaultAttributes : 'a class -> text_attributes_t
    val getEditable : 'a class -> bool
    val getHadjustment : 'a class -> base adjustment_class
    val getIndent : 'a class -> LargeInt.int
    val getInputHints : 'a class -> input_hints_t
    val getInputPurpose : 'a class -> input_purpose_t
    val getIterAtLocation :
      'a class
       -> LargeInt.int * LargeInt.int
       -> text_iter_t option
    val getIterAtPosition :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (text_iter_t * LargeInt.int) option
    val getIterLocation :
      'a class
       -> text_iter_t
       -> Gdk.RectangleRecord.t
    val getJustification : 'a class -> justification_t
    val getLeftMargin : 'a class -> LargeInt.int
    val getLineAtY :
      'a class
       -> LargeInt.int
       -> text_iter_t * LargeInt.int
    val getLineYrange :
      'a class
       -> text_iter_t
       -> LargeInt.int * LargeInt.int
    val getMonospace : 'a class -> bool
    val getOverwrite : 'a class -> bool
    val getPixelsAboveLines : 'a class -> LargeInt.int
    val getPixelsBelowLines : 'a class -> LargeInt.int
    val getPixelsInsideWrap : 'a class -> LargeInt.int
    val getRightMargin : 'a class -> LargeInt.int
    val getTabs : 'a class -> Pango.TabArrayRecord.t option
    val getTopMargin : 'a class -> LargeInt.int
    val getVadjustment : 'a class -> base adjustment_class
    val getVisibleRect : 'a class -> Gdk.RectangleRecord.t
    val getWindow :
      'a class
       -> text_window_type_t
       -> base Gdk.WindowClass.class option
    val getWindowType :
      'a class
       -> 'b Gdk.WindowClass.class
       -> text_window_type_t
    val getWrapMode : 'a class -> wrap_mode_t
    val imContextFilterKeypress :
      'a class
       -> Gdk.EventKeyRecord.t
       -> bool
    val moveChild :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val moveMarkOnscreen :
      'a class
       -> 'b text_mark_class
       -> bool
    val moveVisually :
      'a class
       -> text_iter_t * LargeInt.int
       -> bool
    val placeCursorOnscreen : 'a class -> bool
    val resetCursorBlink : 'a class -> unit
    val resetImContext : 'a class -> unit
    val scrollMarkOnscreen :
      'a class
       -> 'b text_mark_class
       -> unit
    val scrollToIter :
      'a class
       -> text_iter_t
           * real
           * bool
           * real
           * real
       -> bool
    val scrollToMark :
      'a class
       -> 'b text_mark_class
           * real
           * bool
           * real
           * real
       -> unit
    val setAcceptsTab :
      'a class
       -> bool
       -> unit
    val setBorderWindowSize :
      'a class
       -> text_window_type_t * LargeInt.int
       -> unit
    val setBottomMargin :
      'a class
       -> LargeInt.int
       -> unit
    val setBuffer :
      'a class
       -> 'b text_buffer_class option
       -> unit
    val setCursorVisible :
      'a class
       -> bool
       -> unit
    val setEditable :
      'a class
       -> bool
       -> unit
    val setIndent :
      'a class
       -> LargeInt.int
       -> unit
    val setInputHints :
      'a class
       -> input_hints_t
       -> unit
    val setInputPurpose :
      'a class
       -> input_purpose_t
       -> unit
    val setJustification :
      'a class
       -> justification_t
       -> unit
    val setLeftMargin :
      'a class
       -> LargeInt.int
       -> unit
    val setMonospace :
      'a class
       -> bool
       -> unit
    val setOverwrite :
      'a class
       -> bool
       -> unit
    val setPixelsAboveLines :
      'a class
       -> LargeInt.int
       -> unit
    val setPixelsBelowLines :
      'a class
       -> LargeInt.int
       -> unit
    val setPixelsInsideWrap :
      'a class
       -> LargeInt.int
       -> unit
    val setRightMargin :
      'a class
       -> LargeInt.int
       -> unit
    val setTabs :
      'a class
       -> Pango.TabArrayRecord.t
       -> unit
    val setTopMargin :
      'a class
       -> LargeInt.int
       -> unit
    val setWrapMode :
      'a class
       -> wrap_mode_t
       -> unit
    val startsDisplayLine :
      'a class
       -> text_iter_t
       -> bool
    val windowToBufferCoords :
      'a class
       -> text_window_type_t
           * LargeInt.int
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val backspaceSig : (unit -> unit) -> 'a class Signal.t
    val copyClipboardSig : (unit -> unit) -> 'a class Signal.t
    val cutClipboardSig : (unit -> unit) -> 'a class Signal.t
    val deleteFromCursorSig : (delete_type_t * LargeInt.int -> unit) -> 'a class Signal.t
    val extendSelectionSig :
      (text_extend_selection_t
        * text_iter_t
        * text_iter_t
        * text_iter_t
        -> bool)
       -> 'a class Signal.t
    val insertAtCursorSig : (string -> unit) -> 'a class Signal.t
    val moveCursorSig :
      (movement_step_t
        * LargeInt.int
        * bool
        -> unit)
       -> 'a class Signal.t
    val moveViewportSig : (scroll_step_t * LargeInt.int -> unit) -> 'a class Signal.t
    val pasteClipboardSig : (unit -> unit) -> 'a class Signal.t
    val populatePopupSig : (base widget_class -> unit) -> 'a class Signal.t
    val preeditChangedSig : (string -> unit) -> 'a class Signal.t
    val selectAllSig : (bool -> unit) -> 'a class Signal.t
    val setAnchorSig : (unit -> unit) -> 'a class Signal.t
    val toggleCursorVisibleSig : (unit -> unit) -> 'a class Signal.t
    val toggleOverwriteSig : (unit -> unit) -> 'a class Signal.t
    val acceptsTabProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val bottomMarginProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val bufferProp :
      {
        get : 'a class -> base text_buffer_class option,
        set :
          'b text_buffer_class option
           -> 'a class
           -> unit,
        new : 'b text_buffer_class option -> 'a class Property.t
      }
    val cursorVisibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val editableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val imModuleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val indentProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val inputHintsProp :
      {
        get : 'a class -> input_hints_t,
        set :
          input_hints_t
           -> 'a class
           -> unit,
        new : input_hints_t -> 'a class Property.t
      }
    val inputPurposeProp :
      {
        get : 'a class -> input_purpose_t,
        set :
          input_purpose_t
           -> 'a class
           -> unit,
        new : input_purpose_t -> 'a class Property.t
      }
    val justificationProp :
      {
        get : 'a class -> justification_t,
        set :
          justification_t
           -> 'a class
           -> unit,
        new : justification_t -> 'a class Property.t
      }
    val leftMarginProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val monospaceProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val overwriteProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val pixelsAboveLinesProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val pixelsBelowLinesProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val pixelsInsideWrapProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val populateAllProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val rightMarginProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val tabsProp :
      {
        get : 'a class -> Pango.TabArrayRecord.t option,
        set :
          Pango.TabArrayRecord.t option
           -> 'a class
           -> unit,
        new : Pango.TabArrayRecord.t option -> 'a class Property.t
      }
    val topMarginProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val wrapModeProp :
      {
        get : 'a class -> wrap_mode_t,
        set :
          wrap_mode_t
           -> 'a class
           -> unit,
        new : wrap_mode_t -> 'a class Property.t
      }
  end
