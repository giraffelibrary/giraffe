signature GTK_WIDGET =
  sig
    type 'a class
    type 'a buildable_class
    type accel_flags_t
    type orientation_t
    type target_list_t
    type 'a clipboard_class
    type widget_path_t
    type requisition_t
    type size_request_mode_t
    type 'a settings_class
    type 'a style_context_class
    type 'a rc_style_class
    type 'a accel_group_class
    type 'a window_class
    type text_direction_t
    type drag_result_t
    type direction_type_t
    type 'a tooltip_class
    type selection_data_t
    type widget_help_type_t
    type state_type_t
    type state_flags_t
    type 'a container_class
    type 'a style_class
    type align_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val getDefaultDirection : unit -> text_direction_t
    val getDefaultStyle : unit -> base style_class
    val popCompositeChild : unit -> unit
    val pushCompositeChild : unit -> unit
    val setDefaultDirection : text_direction_t -> unit
    val activate : 'a class -> bool
    val addAccelerator :
      'a class
       -> string
       -> 'b accel_group_class
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> accel_flags_t
       -> unit
    val addDeviceEvents :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> Gdk.EventMask.t
       -> unit
    val addEvents :
      'a class
       -> LargeInt.int
       -> unit
    val addMnemonicLabel :
      'a class
       -> 'b class
       -> unit
    val canActivateAccel :
      'a class
       -> LargeInt.int
       -> bool
    val childFocus :
      'a class
       -> direction_type_t
       -> bool
    val childNotify :
      'a class
       -> string
       -> unit
    val classPath :
      'a class
       -> LargeInt.int
           * string
           * string
    val computeExpand :
      'a class
       -> orientation_t
       -> bool
    val createPangoContext : 'a class -> base Pango.ContextClass.class
    val createPangoLayout :
      'a class
       -> string
       -> base Pango.LayoutClass.class
    val destroy : 'a class -> unit
    val destroyed :
      'a class
       -> 'b class
       -> 'b class
    val deviceIsShadowed :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> bool
    val dragBegin :
      'a class
       -> target_list_t
       -> Gdk.DragAction.t
       -> LargeInt.int
       -> 'b Gdk.Event.union
       -> base Gdk.DragContextClass.class
    val dragCheckThreshold :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val dragDestAddImageTargets : 'a class -> unit
    val dragDestAddTextTargets : 'a class -> unit
    val dragDestAddUriTargets : 'a class -> unit
    val dragDestFindTarget :
      'a class
       -> 'b Gdk.DragContextClass.class
       -> target_list_t option
       -> Gdk.AtomRecord.t
    val dragDestGetTargetList : 'a class -> target_list_t
    val dragDestGetTrackMotion : 'a class -> bool
    val dragDestSetProxy :
      'a class
       -> 'b Gdk.WindowClass.class
       -> Gdk.DragProtocol.t
       -> bool
       -> unit
    val dragDestSetTargetList :
      'a class
       -> target_list_t option
       -> unit
    val dragDestSetTrackMotion :
      'a class
       -> bool
       -> unit
    val dragDestUnset : 'a class -> unit
    val dragGetData :
      'a class
       -> 'b Gdk.DragContextClass.class
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> unit
    val dragHighlight : 'a class -> unit
    val dragSourceAddImageTargets : 'a class -> unit
    val dragSourceAddTextTargets : 'a class -> unit
    val dragSourceAddUriTargets : 'a class -> unit
    val dragSourceGetTargetList : 'a class -> target_list_t
    val dragSourceSetIconGicon :
      'a class
       -> 'b Gio.IconClass.class
       -> unit
    val dragSourceSetIconName :
      'a class
       -> string
       -> unit
    val dragSourceSetIconPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class
       -> unit
    val dragSourceSetIconStock :
      'a class
       -> string
       -> unit
    val dragSourceSetTargetList :
      'a class
       -> target_list_t option
       -> unit
    val dragSourceUnset : 'a class -> unit
    val dragUnhighlight : 'a class -> unit
    val draw :
      'a class
       -> Cairo.ContextRecord.t
       -> unit
    val ensureStyle : 'a class -> unit
    val errorBell : 'a class -> unit
    val event :
      'a class
       -> 'b Gdk.Event.union
       -> bool
    val freezeChildNotify : 'a class -> unit
    val getAccessible : 'a class -> base Atk.ObjectClass.class
    val getAllocatedHeight : 'a class -> LargeInt.int
    val getAllocatedWidth : 'a class -> LargeInt.int
    val getAllocation : 'a class -> Cairo.RectangleIntRecord.t
    val getAppPaintable : 'a class -> bool
    val getCanDefault : 'a class -> bool
    val getCanFocus : 'a class -> bool
    val getChildVisible : 'a class -> bool
    val getClipboard :
      'a class
       -> Gdk.AtomRecord.t
       -> base clipboard_class
    val getCompositeName : 'a class -> string
    val getDeviceEnabled :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> bool
    val getDeviceEvents :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> Gdk.EventMask.t
    val getDirection : 'a class -> text_direction_t
    val getDisplay : 'a class -> base Gdk.DisplayClass.class
    val getDoubleBuffered : 'a class -> bool
    val getEvents : 'a class -> LargeInt.int
    val getHalign : 'a class -> align_t
    val getHasTooltip : 'a class -> bool
    val getHasWindow : 'a class -> bool
    val getHexpand : 'a class -> bool
    val getHexpandSet : 'a class -> bool
    val getMapped : 'a class -> bool
    val getMarginBottom : 'a class -> LargeInt.int
    val getMarginLeft : 'a class -> LargeInt.int
    val getMarginRight : 'a class -> LargeInt.int
    val getMarginTop : 'a class -> LargeInt.int
    val getModifierStyle : 'a class -> base rc_style_class
    val getName : 'a class -> string
    val getNoShowAll : 'a class -> bool
    val getPangoContext : 'a class -> base Pango.ContextClass.class
    val getParent : 'a class -> base class
    val getParentWindow : 'a class -> base Gdk.WindowClass.class
    val getPath : 'a class -> widget_path_t
    val getPointer : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeight : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredSize : 'a class -> requisition_t * requisition_t
    val getPreferredWidth : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRealized : 'a class -> bool
    val getReceivesDefault : 'a class -> bool
    val getRequestMode : 'a class -> size_request_mode_t
    val getRootWindow : 'a class -> base Gdk.WindowClass.class
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSensitive : 'a class -> bool
    val getSettings : 'a class -> base settings_class
    val getSizeRequest : 'a class -> LargeInt.int * LargeInt.int
    val getStateFlags : 'a class -> state_flags_t
    val getStyle : 'a class -> base style_class
    val getStyleContext : 'a class -> base style_context_class
    val getSupportMultidevice : 'a class -> bool
    val getTooltipMarkup : 'a class -> string
    val getTooltipText : 'a class -> string
    val getTooltipWindow : 'a class -> base window_class
    val getToplevel : 'a class -> base class
    val getValign : 'a class -> align_t
    val getVexpand : 'a class -> bool
    val getVexpandSet : 'a class -> bool
    val getVisible : 'a class -> bool
    val getVisual : 'a class -> base Gdk.VisualClass.class
    val getWindow : 'a class -> base Gdk.WindowClass.class
    val grabAdd : 'a class -> unit
    val grabDefault : 'a class -> unit
    val grabFocus : 'a class -> unit
    val grabRemove : 'a class -> unit
    val hasDefault : 'a class -> bool
    val hasFocus : 'a class -> bool
    val hasGrab : 'a class -> bool
    val hasRcStyle : 'a class -> bool
    val hasScreen : 'a class -> bool
    val hasVisibleFocus : 'a class -> bool
    val hide : 'a class -> unit
    val hideOnDelete : 'a class -> bool
    val inDestruction : 'a class -> bool
    val inputShapeCombineRegion :
      'a class
       -> Cairo.RegionRecord.t option
       -> unit
    val intersect :
      'a class
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> bool
    val isAncestor :
      'a class
       -> 'b class
       -> bool
    val isComposited : 'a class -> bool
    val isDrawable : 'a class -> bool
    val isFocus : 'a class -> bool
    val isSensitive : 'a class -> bool
    val isToplevel : 'a class -> bool
    val keynavFailed :
      'a class
       -> direction_type_t
       -> bool
    val map : 'a class -> unit
    val mnemonicActivate :
      'a class
       -> bool
       -> bool
    val modifyBase :
      'a class
       -> state_type_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyBg :
      'a class
       -> state_type_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyFg :
      'a class
       -> state_type_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyFont :
      'a class
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val modifyStyle :
      'a class
       -> 'b rc_style_class
       -> unit
    val modifyText :
      'a class
       -> state_type_t
       -> Gdk.ColorRecord.t option
       -> unit
    val overrideBackgroundColor :
      'a class
       -> state_flags_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideColor :
      'a class
       -> state_flags_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideCursor :
      'a class
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideFont :
      'a class
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val overrideSymbolicColor :
      'a class
       -> string
       -> Gdk.RgbaRecord.t option
       -> unit
    val path :
      'a class
       -> LargeInt.int
           * string
           * string
    val queueComputeExpand : 'a class -> unit
    val queueDraw : 'a class -> unit
    val queueDrawArea :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val queueDrawRegion :
      'a class
       -> Cairo.RegionRecord.t
       -> unit
    val queueResize : 'a class -> unit
    val queueResizeNoRedraw : 'a class -> unit
    val realize : 'a class -> unit
    val regionIntersect :
      'a class
       -> Cairo.RegionRecord.t
       -> Cairo.RegionRecord.t
    val removeAccelerator :
      'a class
       -> 'b accel_group_class
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val removeMnemonicLabel :
      'a class
       -> 'b class
       -> unit
    val renderIconPixbuf :
      'a class
       -> string
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
    val reparent :
      'a class
       -> 'b class
       -> unit
    val resetRcStyles : 'a class -> unit
    val resetStyle : 'a class -> unit
    val sendExpose :
      'a class
       -> 'b Gdk.Event.union
       -> LargeInt.int
    val sendFocusChange :
      'a class
       -> 'b Gdk.Event.union
       -> bool
    val setAccelPath :
      'a class
       -> string option
       -> 'b accel_group_class option
       -> unit
    val setAllocation :
      'a class
       -> Cairo.RectangleIntRecord.t
       -> unit
    val setAppPaintable :
      'a class
       -> bool
       -> unit
    val setCanDefault :
      'a class
       -> bool
       -> unit
    val setCanFocus :
      'a class
       -> bool
       -> unit
    val setChildVisible :
      'a class
       -> bool
       -> unit
    val setCompositeName :
      'a class
       -> string
       -> unit
    val setDeviceEnabled :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> bool
       -> unit
    val setDeviceEvents :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> Gdk.EventMask.t
       -> unit
    val setDirection :
      'a class
       -> text_direction_t
       -> unit
    val setDoubleBuffered :
      'a class
       -> bool
       -> unit
    val setEvents :
      'a class
       -> LargeInt.int
       -> unit
    val setHalign :
      'a class
       -> align_t
       -> unit
    val setHasTooltip :
      'a class
       -> bool
       -> unit
    val setHasWindow :
      'a class
       -> bool
       -> unit
    val setHexpand :
      'a class
       -> bool
       -> unit
    val setHexpandSet :
      'a class
       -> bool
       -> unit
    val setMapped :
      'a class
       -> bool
       -> unit
    val setMarginBottom :
      'a class
       -> LargeInt.int
       -> unit
    val setMarginLeft :
      'a class
       -> LargeInt.int
       -> unit
    val setMarginRight :
      'a class
       -> LargeInt.int
       -> unit
    val setMarginTop :
      'a class
       -> LargeInt.int
       -> unit
    val setName :
      'a class
       -> string
       -> unit
    val setNoShowAll :
      'a class
       -> bool
       -> unit
    val setParent :
      'a class
       -> 'b class
       -> unit
    val setParentWindow :
      'a class
       -> 'b Gdk.WindowClass.class
       -> unit
    val setRealized :
      'a class
       -> bool
       -> unit
    val setReceivesDefault :
      'a class
       -> bool
       -> unit
    val setRedrawOnAllocate :
      'a class
       -> bool
       -> unit
    val setSensitive :
      'a class
       -> bool
       -> unit
    val setSizeRequest :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setStateFlags :
      'a class
       -> state_flags_t
       -> bool
       -> unit
    val setStyle :
      'a class
       -> 'b style_class option
       -> unit
    val setSupportMultidevice :
      'a class
       -> bool
       -> unit
    val setTooltipMarkup :
      'a class
       -> string option
       -> unit
    val setTooltipText :
      'a class
       -> string
       -> unit
    val setTooltipWindow :
      'a class
       -> 'b window_class option
       -> unit
    val setValign :
      'a class
       -> align_t
       -> unit
    val setVexpand :
      'a class
       -> bool
       -> unit
    val setVexpandSet :
      'a class
       -> bool
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val setVisual :
      'a class
       -> 'b Gdk.VisualClass.class
       -> unit
    val shapeCombineRegion :
      'a class
       -> Cairo.RegionRecord.t option
       -> unit
    val show : 'a class -> unit
    val showAll : 'a class -> unit
    val showNow : 'a class -> unit
    val sizeAllocate :
      'a class
       -> Cairo.RectangleIntRecord.t
       -> unit
    val styleGetProperty :
      'a class
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val thawChildNotify : 'a class -> unit
    val translateCoordinates :
      'a class
       -> 'b class
       -> LargeInt.int
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val triggerTooltipQuery : 'a class -> unit
    val unmap : 'a class -> unit
    val unparent : 'a class -> unit
    val unrealize : 'a class -> unit
    val unsetStateFlags :
      'a class
       -> state_flags_t
       -> unit
    val accelClosuresChangedSig : (unit -> unit) -> 'a class Signal.signal
    val buttonPressEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.signal
    val buttonReleaseEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.signal
    val canActivateAccelSig : (LargeInt.int -> bool) -> 'a class Signal.signal
    val childNotifySig : (base GObject.ParamSpecClass.class -> unit) -> 'a class Signal.signal
    val compositedChangedSig : (unit -> unit) -> 'a class Signal.signal
    val configureEventSig : (Gdk.EventConfigureRecord.t -> bool) -> 'a class Signal.signal
    val damageEventSig : (Gdk.EventExposeRecord.t -> bool) -> 'a class Signal.signal
    val deleteEventSig : (base Gdk.Event.union -> bool) -> 'a class Signal.signal
    val destroySig : (unit -> unit) -> 'a class Signal.signal
    val destroyEventSig : (base Gdk.Event.union -> bool) -> 'a class Signal.signal
    val directionChangedSig : (text_direction_t -> unit) -> 'a class Signal.signal
    val dragBeginSig : (base Gdk.DragContextClass.class -> unit) -> 'a class Signal.signal
    val dragDataDeleteSig : (base Gdk.DragContextClass.class -> unit) -> 'a class Signal.signal
    val dragDataGetSig :
      (base Gdk.DragContextClass.class
        -> selection_data_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val dragDataReceivedSig :
      (base Gdk.DragContextClass.class
        -> LargeInt.int
        -> LargeInt.int
        -> selection_data_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val dragDropSig :
      (base Gdk.DragContextClass.class
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class Signal.signal
    val dragEndSig : (base Gdk.DragContextClass.class -> unit) -> 'a class Signal.signal
    val dragFailedSig :
      (base Gdk.DragContextClass.class
        -> drag_result_t
        -> bool)
       -> 'a class Signal.signal
    val dragLeaveSig :
      (base Gdk.DragContextClass.class
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val dragMotionSig :
      (base Gdk.DragContextClass.class
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class Signal.signal
    val drawSig : (Cairo.ContextRecord.t -> bool) -> 'a class Signal.signal
    val enterNotifyEventSig : (Gdk.EventCrossingRecord.t -> bool) -> 'a class Signal.signal
    val eventSig : (base Gdk.Event.union -> bool) -> 'a class Signal.signal
    val eventAfterSig : (base Gdk.Event.union -> unit) -> 'a class Signal.signal
    val focusSig : (direction_type_t -> bool) -> 'a class Signal.signal
    val focusInEventSig : (Gdk.EventFocusRecord.t -> bool) -> 'a class Signal.signal
    val focusOutEventSig : (Gdk.EventFocusRecord.t -> bool) -> 'a class Signal.signal
    val grabBrokenEventSig : (Gdk.EventGrabBrokenRecord.t -> bool) -> 'a class Signal.signal
    val grabFocusSig : (unit -> unit) -> 'a class Signal.signal
    val grabNotifySig : (bool -> unit) -> 'a class Signal.signal
    val hideSig : (unit -> unit) -> 'a class Signal.signal
    val hierarchyChangedSig : (base class option -> unit) -> 'a class Signal.signal
    val keyPressEventSig : (Gdk.EventKeyRecord.t -> bool) -> 'a class Signal.signal
    val keyReleaseEventSig : (Gdk.EventKeyRecord.t -> bool) -> 'a class Signal.signal
    val keynavFailedSig : (direction_type_t -> bool) -> 'a class Signal.signal
    val leaveNotifyEventSig : (Gdk.EventCrossingRecord.t -> bool) -> 'a class Signal.signal
    val mapSig : (unit -> unit) -> 'a class Signal.signal
    val mapEventSig : (Gdk.EventAnyRecord.t -> bool) -> 'a class Signal.signal
    val mnemonicActivateSig : (bool -> bool) -> 'a class Signal.signal
    val motionNotifyEventSig : (Gdk.EventMotionRecord.t -> bool) -> 'a class Signal.signal
    val moveFocusSig : (direction_type_t -> unit) -> 'a class Signal.signal
    val parentSetSig : (base class option -> unit) -> 'a class Signal.signal
    val popupMenuSig : (unit -> bool) -> 'a class Signal.signal
    val propertyNotifyEventSig : (Gdk.EventPropertyRecord.t -> bool) -> 'a class Signal.signal
    val proximityInEventSig : (Gdk.EventProximityRecord.t -> bool) -> 'a class Signal.signal
    val proximityOutEventSig : (Gdk.EventProximityRecord.t -> bool) -> 'a class Signal.signal
    val queryTooltipSig :
      (LargeInt.int
        -> LargeInt.int
        -> bool
        -> base tooltip_class
        -> bool)
       -> 'a class Signal.signal
    val realizeSig : (unit -> unit) -> 'a class Signal.signal
    val screenChangedSig : (base Gdk.ScreenClass.class option -> unit) -> 'a class Signal.signal
    val scrollEventSig : (Gdk.EventScrollRecord.t -> bool) -> 'a class Signal.signal
    val selectionClearEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class Signal.signal
    val selectionGetSig :
      (selection_data_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val selectionNotifyEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class Signal.signal
    val selectionReceivedSig :
      (selection_data_t
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val selectionRequestEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class Signal.signal
    val showSig : (unit -> unit) -> 'a class Signal.signal
    val showHelpSig : (widget_help_type_t -> bool) -> 'a class Signal.signal
    val sizeAllocateSig : (Cairo.RectangleIntRecord.t -> unit) -> 'a class Signal.signal
    val stateChangedSig : (state_type_t -> unit) -> 'a class Signal.signal
    val stateFlagsChangedSig : (state_flags_t -> unit) -> 'a class Signal.signal
    val styleSetSig : (base style_class option -> unit) -> 'a class Signal.signal
    val styleUpdatedSig : (unit -> unit) -> 'a class Signal.signal
    val unmapSig : (unit -> unit) -> 'a class Signal.signal
    val unmapEventSig : (Gdk.EventAnyRecord.t -> bool) -> 'a class Signal.signal
    val unrealizeSig : (unit -> unit) -> 'a class Signal.signal
    val visibilityNotifyEventSig : (Gdk.EventVisibilityRecord.t -> bool) -> 'a class Signal.signal
    val windowStateEventSig : (Gdk.EventWindowStateRecord.t -> bool) -> 'a class Signal.signal
    val appPaintableProp : ('a class, bool, bool) Property.readwrite
    val canDefaultProp : ('a class, bool, bool) Property.readwrite
    val canFocusProp : ('a class, bool, bool) Property.readwrite
    val compositeChildProp : ('a class, bool) Property.readonly
    val doubleBufferedProp : ('a class, bool, bool) Property.readwrite
    val eventsProp : ('a class, Gdk.EventMask.t, Gdk.EventMask.t) Property.readwrite
    val expandProp : ('a class, bool, bool) Property.readwrite
    val halignProp : ('a class, align_t, align_t) Property.readwrite
    val hasDefaultProp : ('a class, bool, bool) Property.readwrite
    val hasFocusProp : ('a class, bool, bool) Property.readwrite
    val hasTooltipProp : ('a class, bool, bool) Property.readwrite
    val heightRequestProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val hexpandProp : ('a class, bool, bool) Property.readwrite
    val hexpandSetProp : ('a class, bool, bool) Property.readwrite
    val isFocusProp : ('a class, bool, bool) Property.readwrite
    val marginProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val marginBottomProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val marginLeftProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val marginRightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val marginTopProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val noShowAllProp : ('a class, bool, bool) Property.readwrite
    val parentProp : ('a class, base container_class option, 'b container_class option) Property.readwrite
    val receivesDefaultProp : ('a class, bool, bool) Property.readwrite
    val sensitiveProp : ('a class, bool, bool) Property.readwrite
    val styleProp : ('a class, base style_class option, 'b style_class option) Property.readwrite
    val tooltipMarkupProp : ('a class, string option, string option) Property.readwrite
    val tooltipTextProp : ('a class, string option, string option) Property.readwrite
    val valignProp : ('a class, align_t, align_t) Property.readwrite
    val vexpandProp : ('a class, bool, bool) Property.readwrite
    val vexpandSetProp : ('a class, bool, bool) Property.readwrite
    val visibleProp : ('a class, bool, bool) Property.readwrite
    val widthRequestProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val windowProp : ('a class, base Gdk.WindowClass.class option) Property.readonly
  end
