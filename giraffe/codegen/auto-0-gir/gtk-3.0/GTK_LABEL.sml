signature GTK_LABEL =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type movement_step_t
    type 'a menu_class_t
    type justification_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val getAngle : 'a class_t -> real
    val getAttributes : 'a class_t -> Pango.AttrListRecord.t
    val getCurrentUri : 'a class_t -> string
    val getEllipsize : 'a class_t -> Pango.EllipsizeMode.t
    val getJustify : 'a class_t -> justification_t
    val getLabel : 'a class_t -> string
    val getLayout : 'a class_t -> base Pango.LayoutClass.t
    val getLayoutOffsets : 'a class_t -> LargeInt.int * LargeInt.int
    val getLineWrap : 'a class_t -> bool
    val getLineWrapMode : 'a class_t -> Pango.WrapMode.t
    val getMaxWidthChars : 'a class_t -> LargeInt.int
    val getMnemonicKeyval : 'a class_t -> LargeInt.int
    val getMnemonicWidget : 'a class_t -> base widget_class_t
    val getSelectable : 'a class_t -> bool
    val getSelectionBounds : 'a class_t -> (LargeInt.int * LargeInt.int) option
    val getSingleLineMode : 'a class_t -> bool
    val getText : 'a class_t -> string
    val getTrackVisitedLinks : 'a class_t -> bool
    val getUseMarkup : 'a class_t -> bool
    val getUseUnderline : 'a class_t -> bool
    val getWidthChars : 'a class_t -> LargeInt.int
    val selectRegion :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setAngle :
      'a class_t
       -> real
       -> unit
    val setAttributes :
      'a class_t
       -> Pango.AttrListRecord.t
       -> unit
    val setEllipsize :
      'a class_t
       -> Pango.EllipsizeMode.t
       -> unit
    val setJustify :
      'a class_t
       -> justification_t
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setLineWrap :
      'a class_t
       -> bool
       -> unit
    val setLineWrapMode :
      'a class_t
       -> Pango.WrapMode.t
       -> unit
    val setMarkup :
      'a class_t
       -> string
       -> unit
    val setMarkupWithMnemonic :
      'a class_t
       -> string
       -> unit
    val setMaxWidthChars :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMnemonicWidget :
      'a class_t
       -> 'b widget_class_t option
       -> unit
    val setPattern :
      'a class_t
       -> string
       -> unit
    val setSelectable :
      'a class_t
       -> bool
       -> unit
    val setSingleLineMode :
      'a class_t
       -> bool
       -> unit
    val setText :
      'a class_t
       -> string
       -> unit
    val setTextWithMnemonic :
      'a class_t
       -> string
       -> unit
    val setTrackVisitedLinks :
      'a class_t
       -> bool
       -> unit
    val setUseMarkup :
      'a class_t
       -> bool
       -> unit
    val setUseUnderline :
      'a class_t
       -> bool
       -> unit
    val setWidthChars :
      'a class_t
       -> LargeInt.int
       -> unit
    val activateCurrentLinkSig : (unit -> unit) -> 'a class_t Signal.signal
    val activateLinkSig : (string -> bool) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (movement_step_t
        -> LargeInt.int
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val populatePopupSig : (base menu_class_t -> unit) -> 'a class_t Signal.signal
    val angleProp : ('a class_t, real, real) Property.readwrite
    val attributesProp : ('a class_t, Pango.AttrListRecord.t option, Pango.AttrListRecord.t option) Property.readwrite
    val cursorPositionProp : ('a class_t, LargeInt.int) Property.readonly
    val ellipsizeProp : ('a class_t, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val justifyProp : ('a class_t, justification_t, justification_t) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val maxWidthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val mnemonicKeyvalProp : ('a class_t, LargeInt.int) Property.readonly
    val mnemonicWidgetProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
    val patternProp : ('a class_t, string option) Property.writeonly
    val selectableProp : ('a class_t, bool, bool) Property.readwrite
    val selectionBoundProp : ('a class_t, LargeInt.int) Property.readonly
    val singleLineModeProp : ('a class_t, bool, bool) Property.readwrite
    val trackVisitedLinksProp : ('a class_t, bool, bool) Property.readwrite
    val useMarkupProp : ('a class_t, bool, bool) Property.readwrite
    val useUnderlineProp : ('a class_t, bool, bool) Property.readwrite
    val widthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val wrapProp : ('a class_t, bool, bool) Property.readwrite
    val wrapModeProp : ('a class_t, Pango.WrapMode.t, Pango.WrapMode.t) Property.readwrite
  end
