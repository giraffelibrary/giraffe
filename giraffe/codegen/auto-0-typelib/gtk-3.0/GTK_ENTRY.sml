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
    type 'a menu_class
    type 'a entry_buffer_class
    type 'a entry_completion_class
    type border_t
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
    val getBuffer : 'a class -> base entry_buffer_class
    val getCompletion : 'a class -> base entry_completion_class
    val getCurrentIconDragSource : 'a class -> LargeInt.int
    val getCursorHadjustment : 'a class -> base adjustment_class
    val getHasFrame : 'a class -> bool
    val getIconActivatable :
      'a class
       -> entry_icon_position_t
       -> bool
    val getIconArea :
      'a class
       -> entry_icon_position_t
       -> Cairo.RectangleIntRecord.t
    val getIconAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getIconGicon :
      'a class
       -> entry_icon_position_t
       -> base Gio.IconClass.class
    val getIconName :
      'a class
       -> entry_icon_position_t
       -> string
    val getIconPixbuf :
      'a class
       -> entry_icon_position_t
       -> base GdkPixbuf.PixbufClass.class
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
       -> string
    val getIconTooltipText :
      'a class
       -> entry_icon_position_t
       -> string
    val getInnerBorder : 'a class -> border_t
    val getInvisibleChar : 'a class -> char
    val getLayout : 'a class -> base Pango.LayoutClass.class
    val getLayoutOffsets : 'a class -> LargeInt.int * LargeInt.int
    val getMaxLength : 'a class -> LargeInt.int
    val getOverwriteMode : 'a class -> bool
    val getPlaceholderText : 'a class -> string
    val getProgressFraction : 'a class -> real
    val getProgressPulseStep : 'a class -> real
    val getText : 'a class -> string
    val getTextArea : 'a class -> Cairo.RectangleIntRecord.t
    val getTextLength : 'a class -> LargeInt.int
    val getVisibility : 'a class -> bool
    val getWidthChars : 'a class -> LargeInt.int
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
       -> 'b adjustment_class
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
    val setInvisibleChar :
      'a class
       -> char
       -> unit
    val setMaxLength :
      'a class
       -> LargeInt.int
       -> unit
    val setOverwriteMode :
      'a class
       -> bool
       -> unit
    val setPlaceholderText :
      'a class
       -> string
       -> unit
    val setProgressFraction :
      'a class
       -> real
       -> unit
    val setProgressPulseStep :
      'a class
       -> real
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
    val populatePopupSig : (base menu_class -> unit) -> 'a class Signal.t
    val preeditChangedSig : (string -> unit) -> 'a class Signal.t
    val toggleOverwriteSig : (unit -> unit) -> 'a class Signal.t
    val activatesDefaultProp : ('a class, bool, bool) Property.readwrite
    val bufferProp : ('a class, base entry_buffer_class option, 'b entry_buffer_class option) Property.readwrite
    val capsLockWarningProp : ('a class, bool, bool) Property.readwrite
    val completionProp : ('a class, base entry_completion_class option, 'b entry_completion_class option) Property.readwrite
    val cursorPositionProp : ('a class, LargeInt.int) Property.readonly
    val editableProp : ('a class, bool, bool) Property.readwrite
    val hasFrameProp : ('a class, bool, bool) Property.readwrite
    val imModuleProp : ('a class, string option, string option) Property.readwrite
    val innerBorderProp : ('a class, border_t option, border_t option) Property.readwrite
    val invisibleCharProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val invisibleCharSetProp : ('a class, bool, bool) Property.readwrite
    val maxLengthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val overwriteModeProp : ('a class, bool, bool) Property.readwrite
    val placeholderTextProp : ('a class, string option, string option) Property.readwrite
    val primaryIconActivatableProp : ('a class, bool, bool) Property.readwrite
    val primaryIconGiconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val primaryIconNameProp : ('a class, string option, string option) Property.readwrite
    val primaryIconPixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val primaryIconSensitiveProp : ('a class, bool, bool) Property.readwrite
    val primaryIconStockProp : ('a class, string option, string option) Property.readwrite
    val primaryIconStorageTypeProp : ('a class, image_type_t) Property.readonly
    val primaryIconTooltipMarkupProp : ('a class, string option, string option) Property.readwrite
    val primaryIconTooltipTextProp : ('a class, string option, string option) Property.readwrite
    val progressFractionProp : ('a class, real, real) Property.readwrite
    val progressPulseStepProp : ('a class, real, real) Property.readwrite
    val scrollOffsetProp : ('a class, LargeInt.int) Property.readonly
    val secondaryIconActivatableProp : ('a class, bool, bool) Property.readwrite
    val secondaryIconGiconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val secondaryIconNameProp : ('a class, string option, string option) Property.readwrite
    val secondaryIconPixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val secondaryIconSensitiveProp : ('a class, bool, bool) Property.readwrite
    val secondaryIconStockProp : ('a class, string option, string option) Property.readwrite
    val secondaryIconStorageTypeProp : ('a class, image_type_t) Property.readonly
    val secondaryIconTooltipMarkupProp : ('a class, string option, string option) Property.readwrite
    val secondaryIconTooltipTextProp : ('a class, string option, string option) Property.readwrite
    val selectionBoundProp : ('a class, LargeInt.int) Property.readonly
    val shadowTypeProp : ('a class, shadow_type_t, shadow_type_t) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
    val textLengthProp : ('a class, LargeInt.int) Property.readonly
    val truncateMultilineProp : ('a class, bool, bool) Property.readwrite
    val visibilityProp : ('a class, bool, bool) Property.readwrite
    val widthCharsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class, real, real) Property.readwrite
  end
