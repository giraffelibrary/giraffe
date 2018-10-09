signature GTK_LABEL =
  sig
    type 'a class
    type 'a buildable_class
    type movement_step_t
    type 'a menu_class
    type justification_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val newWithMnemonic : string option -> base class
    val getAngle : 'a class -> real
    val getAttributes : 'a class -> Pango.AttrListRecord.t option
    val getCurrentUri : 'a class -> string
    val getEllipsize : 'a class -> Pango.EllipsizeMode.t
    val getJustify : 'a class -> justification_t
    val getLabel : 'a class -> string
    val getLayout : 'a class -> base Pango.LayoutClass.class
    val getLayoutOffsets : 'a class -> LargeInt.int * LargeInt.int
    val getLineWrap : 'a class -> bool
    val getLineWrapMode : 'a class -> Pango.WrapMode.t
    val getLines : 'a class -> LargeInt.int
    val getMaxWidthChars : 'a class -> LargeInt.int
    val getMnemonicKeyval : 'a class -> LargeInt.int
    val getMnemonicWidget : 'a class -> base widget_class option
    val getSelectable : 'a class -> bool
    val getSelectionBounds : 'a class -> (LargeInt.int * LargeInt.int) option
    val getSingleLineMode : 'a class -> bool
    val getText : 'a class -> string
    val getTrackVisitedLinks : 'a class -> bool
    val getUseMarkup : 'a class -> bool
    val getUseUnderline : 'a class -> bool
    val getWidthChars : 'a class -> LargeInt.int
    val getXalign : 'a class -> real
    val getYalign : 'a class -> real
    val selectRegion :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setAngle :
      'a class
       -> real
       -> unit
    val setAttributes :
      'a class
       -> Pango.AttrListRecord.t option
       -> unit
    val setEllipsize :
      'a class
       -> Pango.EllipsizeMode.t
       -> unit
    val setJustify :
      'a class
       -> justification_t
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setLineWrap :
      'a class
       -> bool
       -> unit
    val setLineWrapMode :
      'a class
       -> Pango.WrapMode.t
       -> unit
    val setLines :
      'a class
       -> LargeInt.int
       -> unit
    val setMarkup :
      'a class
       -> string
       -> unit
    val setMarkupWithMnemonic :
      'a class
       -> string
       -> unit
    val setMaxWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val setMnemonicWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setPattern :
      'a class
       -> string
       -> unit
    val setSelectable :
      'a class
       -> bool
       -> unit
    val setSingleLineMode :
      'a class
       -> bool
       -> unit
    val setText :
      'a class
       -> string
       -> unit
    val setTextWithMnemonic :
      'a class
       -> string
       -> unit
    val setTrackVisitedLinks :
      'a class
       -> bool
       -> unit
    val setUseMarkup :
      'a class
       -> bool
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val setWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val setXalign :
      'a class
       -> real
       -> unit
    val setYalign :
      'a class
       -> real
       -> unit
    val activateCurrentLinkSig : (unit -> unit) -> 'a class Signal.t
    val activateLinkSig : (string -> bool) -> 'a class Signal.t
    val copyClipboardSig : (unit -> unit) -> 'a class Signal.t
    val moveCursorSig :
      (movement_step_t
        * LargeInt.int
        * bool
        -> unit)
       -> 'a class Signal.t
    val populatePopupSig : (base menu_class -> unit) -> 'a class Signal.t
    val angleProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val attributesProp :
      {
        get : 'a class -> Pango.AttrListRecord.t option,
        set :
          Pango.AttrListRecord.t option
           -> 'a class
           -> unit,
        new : Pango.AttrListRecord.t option -> 'a class Property.t
      }
    val cursorPositionProp : {get : 'a class -> LargeInt.int}
    val ellipsizeProp :
      {
        get : 'a class -> Pango.EllipsizeMode.t,
        set :
          Pango.EllipsizeMode.t
           -> 'a class
           -> unit,
        new : Pango.EllipsizeMode.t -> 'a class Property.t
      }
    val justifyProp :
      {
        get : 'a class -> justification_t,
        set :
          justification_t
           -> 'a class
           -> unit,
        new : justification_t -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val linesProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val maxWidthCharsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val mnemonicKeyvalProp : {get : 'a class -> LargeInt.int}
    val mnemonicWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val patternProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val selectableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val selectionBoundProp : {get : 'a class -> LargeInt.int}
    val singleLineModeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val trackVisitedLinksProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useMarkupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useUnderlineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val widthCharsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val wrapProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val wrapModeProp :
      {
        get : 'a class -> Pango.WrapMode.t,
        set :
          Pango.WrapMode.t
           -> 'a class
           -> unit,
        new : Pango.WrapMode.t -> 'a class Property.t
      }
    val xalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val yalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
