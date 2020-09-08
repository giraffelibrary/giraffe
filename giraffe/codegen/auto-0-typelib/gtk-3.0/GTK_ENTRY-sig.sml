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
    val activatesDefaultProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val attributesProp : ('a class, unit -> Pango.AttrListRecord.t option, Pango.AttrListRecord.t option -> unit, Pango.AttrListRecord.t option -> unit) Property.t
    val bufferProp : ('a class, unit -> base entry_buffer_class option, 'b entry_buffer_class option -> unit, 'b entry_buffer_class option -> unit) Property.t
    val capsLockWarningProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val completionProp : ('a class, unit -> base entry_completion_class option, 'b entry_completion_class option -> unit, 'b entry_completion_class option -> unit) Property.t
    val cursorPositionProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val editableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hasFrameProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val imModuleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val innerBorderProp : ('a class, unit -> border_t option, border_t option -> unit, border_t option -> unit) Property.t
    val inputHintsProp : ('a class, unit -> input_hints_t, input_hints_t -> unit, input_hints_t -> unit) Property.t
    val inputPurposeProp : ('a class, unit -> input_purpose_t, input_purpose_t -> unit, input_purpose_t -> unit) Property.t
    val invisibleCharProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val invisibleCharSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val maxLengthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val maxWidthCharsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val overwriteModeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val placeholderTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val populateAllProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val primaryIconActivatableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val primaryIconGiconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val primaryIconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val primaryIconPixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val primaryIconSensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val primaryIconStockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val primaryIconStorageTypeProp : ('a class, unit -> image_type_t, unit, unit) Property.t
    val primaryIconTooltipMarkupProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val primaryIconTooltipTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val progressFractionProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val progressPulseStepProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val scrollOffsetProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val secondaryIconActivatableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val secondaryIconGiconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val secondaryIconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val secondaryIconPixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val secondaryIconSensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val secondaryIconStockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val secondaryIconStorageTypeProp : ('a class, unit -> image_type_t, unit, unit) Property.t
    val secondaryIconTooltipMarkupProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val secondaryIconTooltipTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val selectionBoundProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val shadowTypeProp : ('a class, unit -> shadow_type_t, shadow_type_t -> unit, shadow_type_t -> unit) Property.t
    val tabsProp : ('a class, unit -> Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option -> unit, Pango.TabArrayRecord.t option -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val textLengthProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val truncateMultilineProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibilityProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val widthCharsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val xalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
  end
