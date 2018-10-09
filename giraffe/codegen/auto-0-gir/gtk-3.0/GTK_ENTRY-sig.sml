signature GTK_ENTRY =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a editable_class
    type 'a adjustment_class
    type target_list_t
    type delete_type_t
    type entry_icon_position_t
    type movement_step_t
    type 'a widget_class
    type 'a entry_buffer_class
    type 'a entry_completion_class
    type border_t
    type input_hints_t
    type input_purpose_t
    type image_type_t
    type shadow_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asEditable : 'a class -> base editable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithBuffer : 'a entry_buffer_class -> base class
    val getActivatesDefault : 'a class -> bool
    val getAlignment : 'a class -> real
    val getAttributes : 'a class -> Pango.AttrListRecord.t option
    val getBuffer : 'a class -> base entry_buffer_class
    val getCompletion : 'a class -> base entry_completion_class
    val getCurrentIconDragSource : 'a class -> LargeInt.int
    val getCursorHadjustment : 'a class -> base adjustment_class option
    val getHasFrame : 'a class -> bool
    val getIconActivatable :
      'a class
       -> entry_icon_position_t
       -> bool
    val getIconArea :
      'a class
       -> entry_icon_position_t
       -> Gdk.RectangleRecord.t
    val getIconAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getIconGicon :
      'a class
       -> entry_icon_position_t
       -> base Gio.IconClass.class option
    val getIconName :
      'a class
       -> entry_icon_position_t
       -> string option
    val getIconPixbuf :
      'a class
       -> entry_icon_position_t
       -> base GdkPixbuf.PixbufClass.class option
    val getIconSensitive :
      'a class
       -> entry_icon_position_t
       -> bool
    val getIconStock :
      'a class
       -> entry_icon_position_t
       -> string
    val getIconStorageType :
      'a class
       -> entry_icon_position_t
       -> image_type_t
    val getIconTooltipMarkup :
      'a class
       -> entry_icon_position_t
       -> string option
    val getIconTooltipText :
      'a class
       -> entry_icon_position_t
       -> string option
    val getInnerBorder : 'a class -> border_t option
    val getInputHints : 'a class -> input_hints_t
    val getInputPurpose : 'a class -> input_purpose_t
    val getInvisibleChar : 'a class -> char
    val getLayout : 'a class -> base Pango.LayoutClass.class
    val getLayoutOffsets : 'a class -> LargeInt.int * LargeInt.int
    val getMaxLength : 'a class -> LargeInt.int
    val getMaxWidthChars : 'a class -> LargeInt.int
    val getOverwriteMode : 'a class -> bool
    val getPlaceholderText : 'a class -> string
    val getProgressFraction : 'a class -> real
    val getProgressPulseStep : 'a class -> real
    val getTabs : 'a class -> Pango.TabArrayRecord.t option
    val getText : 'a class -> string
    val getTextArea : 'a class -> Gdk.RectangleRecord.t
    val getTextLength : 'a class -> LargeInt.int
    val getVisibility : 'a class -> bool
    val getWidthChars : 'a class -> LargeInt.int
    val grabFocusWithoutSelecting : 'a class -> unit
    val imContextFilterKeypress :
      'a class
       -> Gdk.EventKeyRecord.t
       -> bool
    val layoutIndexToTextIndex :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val progressPulse : 'a class -> unit
    val resetImContext : 'a class -> unit
    val setActivatesDefault :
      'a class
       -> bool
       -> unit
    val setAlignment :
      'a class
       -> real
       -> unit
    val setAttributes :
      'a class
       -> Pango.AttrListRecord.t
       -> unit
    val setBuffer :
      'a class
       -> 'b entry_buffer_class
       -> unit
    val setCompletion :
      'a class
       -> 'b entry_completion_class option
       -> unit
    val setCursorHadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setHasFrame :
      'a class
       -> bool
       -> unit
    val setIconActivatable :
      'a class
       -> entry_icon_position_t * bool
       -> unit
    val setIconDragSource :
      'a class
       -> entry_icon_position_t
           * target_list_t
           * Gdk.DragAction.t
       -> unit
    val setIconFromGicon :
      'a class
       -> entry_icon_position_t * 'b Gio.IconClass.class option
       -> unit
    val setIconFromIconName :
      'a class
       -> entry_icon_position_t * string option
       -> unit
    val setIconFromPixbuf :
      'a class
       -> entry_icon_position_t * 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setIconFromStock :
      'a class
       -> entry_icon_position_t * string option
       -> unit
    val setIconSensitive :
      'a class
       -> entry_icon_position_t * bool
       -> unit
    val setIconTooltipMarkup :
      'a class
       -> entry_icon_position_t * string option
       -> unit
    val setIconTooltipText :
      'a class
       -> entry_icon_position_t * string option
       -> unit
    val setInnerBorder :
      'a class
       -> border_t option
       -> unit
    val setInputHints :
      'a class
       -> input_hints_t
       -> unit
    val setInputPurpose :
      'a class
       -> input_purpose_t
       -> unit
    val setInvisibleChar :
      'a class
       -> char
       -> unit
    val setMaxLength :
      'a class
       -> LargeInt.int
       -> unit
    val setMaxWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val setOverwriteMode :
      'a class
       -> bool
       -> unit
    val setPlaceholderText :
      'a class
       -> string option
       -> unit
    val setProgressFraction :
      'a class
       -> real
       -> unit
    val setProgressPulseStep :
      'a class
       -> real
       -> unit
    val setTabs :
      'a class
       -> Pango.TabArrayRecord.t
       -> unit
    val setText :
      'a class
       -> string
       -> unit
    val setVisibility :
      'a class
       -> bool
       -> unit
    val setWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val textIndexToLayoutIndex :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val unsetInvisibleChar : 'a class -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val backspaceSig : (unit -> unit) -> 'a class Signal.t
    val copyClipboardSig : (unit -> unit) -> 'a class Signal.t
    val cutClipboardSig : (unit -> unit) -> 'a class Signal.t
    val deleteFromCursorSig : (delete_type_t * LargeInt.int -> unit) -> 'a class Signal.t
    val iconPressSig : (entry_icon_position_t * Gdk.EventButtonRecord.t -> unit) -> 'a class Signal.t
    val iconReleaseSig : (entry_icon_position_t * Gdk.EventButtonRecord.t -> unit) -> 'a class Signal.t
    val insertAtCursorSig : (string -> unit) -> 'a class Signal.t
    val moveCursorSig :
      (movement_step_t
        * LargeInt.int
        * bool
        -> unit)
       -> 'a class Signal.t
    val pasteClipboardSig : (unit -> unit) -> 'a class Signal.t
    val populatePopupSig : (base widget_class -> unit) -> 'a class Signal.t
    val preeditChangedSig : (string -> unit) -> 'a class Signal.t
    val toggleOverwriteSig : (unit -> unit) -> 'a class Signal.t
    val activatesDefaultProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
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
    val bufferProp :
      {
        get : 'a class -> base entry_buffer_class option,
        set :
          'b entry_buffer_class option
           -> 'a class
           -> unit,
        new : 'b entry_buffer_class option -> 'a class Property.t
      }
    val capsLockWarningProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val completionProp :
      {
        get : 'a class -> base entry_completion_class option,
        set :
          'b entry_completion_class option
           -> 'a class
           -> unit,
        new : 'b entry_completion_class option -> 'a class Property.t
      }
    val cursorPositionProp : {get : 'a class -> LargeInt.int}
    val editableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasFrameProp :
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
    val innerBorderProp :
      {
        get : 'a class -> border_t option,
        set :
          border_t option
           -> 'a class
           -> unit,
        new : border_t option -> 'a class Property.t
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
    val invisibleCharProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val invisibleCharSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val maxLengthProp :
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
    val overwriteModeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val placeholderTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
    val primaryIconActivatableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val primaryIconGiconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val primaryIconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val primaryIconPixbufProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val primaryIconSensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val primaryIconStockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val primaryIconStorageTypeProp : {get : 'a class -> image_type_t}
    val primaryIconTooltipMarkupProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val primaryIconTooltipTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val progressFractionProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val progressPulseStepProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val scrollOffsetProp : {get : 'a class -> LargeInt.int}
    val secondaryIconActivatableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val secondaryIconGiconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val secondaryIconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val secondaryIconPixbufProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val secondaryIconSensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val secondaryIconStockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val secondaryIconStorageTypeProp : {get : 'a class -> image_type_t}
    val secondaryIconTooltipMarkupProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val secondaryIconTooltipTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val selectionBoundProp : {get : 'a class -> LargeInt.int}
    val shadowTypeProp :
      {
        get : 'a class -> shadow_type_t,
        set :
          shadow_type_t
           -> 'a class
           -> unit,
        new : shadow_type_t -> 'a class Property.t
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
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val textLengthProp : {get : 'a class -> LargeInt.int}
    val truncateMultilineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val visibilityProp :
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
    val xalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
