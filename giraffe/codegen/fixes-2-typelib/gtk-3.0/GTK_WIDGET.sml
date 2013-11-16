signature GTK_WIDGET =
  sig
    type 'a class_t
    type align_t
    type 'a styleclass_t
    type 'a containerclass_t
    type stateflags_t
    type statetype_t
    type widgethelptype_t
    type selectiondatarecord_t
    type 'a tooltipclass_t
    type directiontype_t
    type dragresult_t
    type textdirection_t
    type 'a windowclass_t
    type 'a accelgroupclass_t
    type 'a rcstyleclass_t
    type 'a stylecontextclass_t
    type 'a settingsclass_t
    type sizerequestmode_t
    type requisitionrecord_t
    type widgetpathrecord_t
    type 'a clipboardclass_t
    type targetlistrecord_t
    type orientation_t
    type accelflags_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val getDefaultDirection : unit -> textdirection_t
    val getDefaultStyle : unit -> base styleclass_t
    val popCompositeChild : unit -> unit
    val pushCompositeChild : unit -> unit
    val setDefaultDirection : textdirection_t -> unit
    val activate : 'a class_t -> bool
    val addAccelerator :
      'a class_t
       -> string
       -> 'b accelgroupclass_t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> accelflags_t
       -> unit
    val addDeviceEvents :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> Gdk.EventMask.t
       -> unit
    val addEvents :
      'a class_t
       -> Gdk.EventMask.t
       -> unit
    val addMnemonicLabel :
      'a class_t
       -> 'b class_t
       -> unit
    val canActivateAccel :
      'a class_t
       -> LargeInt.int
       -> bool
    val childFocus :
      'a class_t
       -> directiontype_t
       -> bool
    val childNotify :
      'a class_t
       -> string
       -> unit
    val classPath :
      'a class_t
       -> LargeInt.int
           * string
           * string
    val computeExpand :
      'a class_t
       -> orientation_t
       -> bool
    val createPangoContext : 'a class_t -> base Pango.ContextClass.t
    val createPangoLayout :
      'a class_t
       -> string
       -> base Pango.LayoutClass.t
    val destroy : 'a class_t -> unit
(*
    val destroyed :
      'a class_t
       -> 'b class_t
       -> 'b class_t
*)
    val deviceIsShadowed :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> bool
    val dragBegin :
      'a class_t
       -> targetlistrecord_t
       -> Gdk.DragAction.t
       -> LargeInt.int
       -> 'b Gdk.Event.t
       -> base Gdk.DragContextClass.t
    val dragCheckThreshold :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val dragDestAddImageTargets : 'a class_t -> unit
    val dragDestAddTextTargets : 'a class_t -> unit
    val dragDestAddUriTargets : 'a class_t -> unit
    val dragDestFindTarget :
      'a class_t
       -> 'b Gdk.DragContextClass.t
       -> targetlistrecord_t option
       -> Gdk.AtomRecord.t
    val dragDestGetTargetList : 'a class_t -> targetlistrecord_t
    val dragDestGetTrackMotion : 'a class_t -> bool
    val dragDestSetProxy :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> Gdk.DragProtocol.t
       -> bool
       -> unit
    val dragDestSetTargetList :
      'a class_t
       -> targetlistrecord_t option
       -> unit
    val dragDestSetTrackMotion :
      'a class_t
       -> bool
       -> unit
    val dragDestUnset : 'a class_t -> unit
    val dragGetData :
      'a class_t
       -> 'b Gdk.DragContextClass.t
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> unit
    val dragHighlight : 'a class_t -> unit
    val dragSourceAddImageTargets : 'a class_t -> unit
    val dragSourceAddTextTargets : 'a class_t -> unit
    val dragSourceAddUriTargets : 'a class_t -> unit
    val dragSourceGetTargetList : 'a class_t -> targetlistrecord_t
    val dragSourceSetIconGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> unit
    val dragSourceSetIconName :
      'a class_t
       -> string
       -> unit
    val dragSourceSetIconPixbuf :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> unit
    val dragSourceSetIconStock :
      'a class_t
       -> string
       -> unit
    val dragSourceSetTargetList :
      'a class_t
       -> targetlistrecord_t option
       -> unit
    val dragSourceUnset : 'a class_t -> unit
    val dragUnhighlight : 'a class_t -> unit
    val draw :
      'a class_t
       -> Cairo.ContextRecord.t
       -> unit
    val ensureStyle : 'a class_t -> unit
    val errorBell : 'a class_t -> unit
    val event :
      'a class_t
       -> 'b Gdk.Event.t
       -> bool
    val freezeChildNotify : 'a class_t -> unit
    val getAccessible : 'a class_t -> base Atk.ObjectClass.t
    val getAllocatedHeight : 'a class_t -> LargeInt.int
    val getAllocatedWidth : 'a class_t -> LargeInt.int
    val getAllocation : 'a class_t -> Cairo.RectangleIntRecord.t
    val getAppPaintable : 'a class_t -> bool
    val getCanDefault : 'a class_t -> bool
    val getCanFocus : 'a class_t -> bool
    val getChildVisible : 'a class_t -> bool
    val getClipboard :
      'a class_t
       -> Gdk.AtomRecord.t
       -> base clipboardclass_t
    val getCompositeName : 'a class_t -> string
    val getDeviceEnabled :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> bool
    val getDeviceEvents :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> Gdk.EventMask.t
    val getDirection : 'a class_t -> textdirection_t
    val getDisplay : 'a class_t -> base Gdk.DisplayClass.t
    val getDoubleBuffered : 'a class_t -> bool
    val getEvents : 'a class_t -> Gdk.EventMask.t
    val getHalign : 'a class_t -> align_t
    val getHasTooltip : 'a class_t -> bool
    val getHasWindow : 'a class_t -> bool
    val getHexpand : 'a class_t -> bool
    val getHexpandSet : 'a class_t -> bool
    val getMapped : 'a class_t -> bool
    val getMarginBottom : 'a class_t -> LargeInt.int
    val getMarginLeft : 'a class_t -> LargeInt.int
    val getMarginRight : 'a class_t -> LargeInt.int
    val getMarginTop : 'a class_t -> LargeInt.int
    val getModifierStyle : 'a class_t -> base rcstyleclass_t
    val getName : 'a class_t -> string
    val getNoShowAll : 'a class_t -> bool
    val getPangoContext : 'a class_t -> base Pango.ContextClass.t
    val getParent : 'a class_t -> base class_t
    val getParentWindow : 'a class_t -> base Gdk.WindowClass.t
    val getPath : 'a class_t -> widgetpathrecord_t
    val getPointer : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredHeight : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredSize : 'a class_t -> requisitionrecord_t * requisitionrecord_t
    val getPreferredWidth : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRealized : 'a class_t -> bool
    val getReceivesDefault : 'a class_t -> bool
    val getRequestMode : 'a class_t -> sizerequestmode_t
    val getRootWindow : 'a class_t -> base Gdk.WindowClass.t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val getSensitive : 'a class_t -> bool
    val getSettings : 'a class_t -> base settingsclass_t
    val getSizeRequest : 'a class_t -> LargeInt.int * LargeInt.int
    val getStateFlags : 'a class_t -> stateflags_t
    val getStyle : 'a class_t -> base styleclass_t
    val getStyleContext : 'a class_t -> base stylecontextclass_t
    val getSupportMultidevice : 'a class_t -> bool
    val getTooltipMarkup : 'a class_t -> string
    val getTooltipText : 'a class_t -> string
    val getTooltipWindow : 'a class_t -> base windowclass_t
    val getToplevel : 'a class_t -> base class_t
    val getValign : 'a class_t -> align_t
    val getVexpand : 'a class_t -> bool
    val getVexpandSet : 'a class_t -> bool
    val getVisible : 'a class_t -> bool
    val getVisual : 'a class_t -> base Gdk.VisualClass.t
    val getWindow : 'a class_t -> base Gdk.WindowClass.t
    val grabAdd : 'a class_t -> unit
    val grabDefault : 'a class_t -> unit
    val grabFocus : 'a class_t -> unit
    val grabRemove : 'a class_t -> unit
    val hasDefault : 'a class_t -> bool
    val hasFocus : 'a class_t -> bool
    val hasGrab : 'a class_t -> bool
    val hasRcStyle : 'a class_t -> bool
    val hasScreen : 'a class_t -> bool
    val hasVisibleFocus : 'a class_t -> bool
    val hide : 'a class_t -> unit
    val hideOnDelete : 'a class_t -> bool
    val inDestruction : 'a class_t -> bool
    val inputShapeCombineRegion :
      'a class_t
       -> Cairo.RegionRecord.t option
       -> unit
    val intersect :
      'a class_t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> bool
    val isAncestor :
      'a class_t
       -> 'b class_t
       -> bool
    val isComposited : 'a class_t -> bool
    val isDrawable : 'a class_t -> bool
    val isFocus : 'a class_t -> bool
    val isSensitive : 'a class_t -> bool
    val isToplevel : 'a class_t -> bool
    val keynavFailed :
      'a class_t
       -> directiontype_t
       -> bool
    val map : 'a class_t -> unit
    val mnemonicActivate :
      'a class_t
       -> bool
       -> bool
    val modifyBase :
      'a class_t
       -> statetype_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyBg :
      'a class_t
       -> statetype_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyFg :
      'a class_t
       -> statetype_t
       -> Gdk.ColorRecord.t option
       -> unit
    val modifyFont :
      'a class_t
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val modifyStyle :
      'a class_t
       -> 'b rcstyleclass_t
       -> unit
    val modifyText :
      'a class_t
       -> statetype_t
       -> Gdk.ColorRecord.t option
       -> unit
    val overrideBackgroundColor :
      'a class_t
       -> stateflags_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideColor :
      'a class_t
       -> stateflags_t
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideCursor :
      'a class_t
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> unit
    val overrideFont :
      'a class_t
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val overrideSymbolicColor :
      'a class_t
       -> string
       -> Gdk.RgbaRecord.t option
       -> unit
    val path :
      'a class_t
       -> LargeInt.int
           * string
           * string
    val queueComputeExpand : 'a class_t -> unit
    val queueDraw : 'a class_t -> unit
    val queueDrawArea :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val queueDrawRegion :
      'a class_t
       -> Cairo.RegionRecord.t
       -> unit
    val queueResize : 'a class_t -> unit
    val queueResizeNoRedraw : 'a class_t -> unit
    val realize : 'a class_t -> unit
    val regionIntersect :
      'a class_t
       -> Cairo.RegionRecord.t
       -> Cairo.RegionRecord.t
    val removeAccelerator :
      'a class_t
       -> 'b accelgroupclass_t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val removeMnemonicLabel :
      'a class_t
       -> 'b class_t
       -> unit
    val renderIconPixbuf :
      'a class_t
       -> string
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
    val reparent :
      'a class_t
       -> 'b class_t
       -> unit
    val resetRcStyles : 'a class_t -> unit
    val resetStyle : 'a class_t -> unit
    val sendExpose :
      'a class_t
       -> 'b Gdk.Event.t
       -> LargeInt.int
    val sendFocusChange :
      'a class_t
       -> 'b Gdk.Event.t
       -> bool
    val setAccelPath :
      'a class_t
       -> string option
       -> 'b accelgroupclass_t option
       -> unit
    val setAllocation :
      'a class_t
       -> Cairo.RectangleIntRecord.t
       -> unit
    val setAppPaintable :
      'a class_t
       -> bool
       -> unit
    val setCanDefault :
      'a class_t
       -> bool
       -> unit
    val setCanFocus :
      'a class_t
       -> bool
       -> unit
    val setChildVisible :
      'a class_t
       -> bool
       -> unit
    val setCompositeName :
      'a class_t
       -> string
       -> unit
    val setDeviceEnabled :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> bool
       -> unit
    val setDeviceEvents :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> Gdk.EventMask.t
       -> unit
    val setDirection :
      'a class_t
       -> textdirection_t
       -> unit
    val setDoubleBuffered :
      'a class_t
       -> bool
       -> unit
    val setEvents :
      'a class_t
       -> Gdk.EventMask.t
       -> unit
    val setHalign :
      'a class_t
       -> align_t
       -> unit
    val setHasTooltip :
      'a class_t
       -> bool
       -> unit
    val setHasWindow :
      'a class_t
       -> bool
       -> unit
    val setHexpand :
      'a class_t
       -> bool
       -> unit
    val setHexpandSet :
      'a class_t
       -> bool
       -> unit
    val setMapped :
      'a class_t
       -> bool
       -> unit
    val setMarginBottom :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMarginLeft :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMarginRight :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMarginTop :
      'a class_t
       -> LargeInt.int
       -> unit
    val setName :
      'a class_t
       -> string
       -> unit
    val setNoShowAll :
      'a class_t
       -> bool
       -> unit
    val setParent :
      'a class_t
       -> 'b class_t
       -> unit
    val setParentWindow :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> unit
    val setRealized :
      'a class_t
       -> bool
       -> unit
    val setReceivesDefault :
      'a class_t
       -> bool
       -> unit
    val setRedrawOnAllocate :
      'a class_t
       -> bool
       -> unit
    val setSensitive :
      'a class_t
       -> bool
       -> unit
    val setSizeRequest :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setStateFlags :
      'a class_t
       -> stateflags_t
       -> bool
       -> unit
    val setStyle :
      'a class_t
       -> 'b styleclass_t option
       -> unit
    val setSupportMultidevice :
      'a class_t
       -> bool
       -> unit
    val setTooltipMarkup :
      'a class_t
       -> string option
       -> unit
    val setTooltipText :
      'a class_t
       -> string
       -> unit
    val setTooltipWindow :
      'a class_t
       -> 'b windowclass_t option
       -> unit
    val setValign :
      'a class_t
       -> align_t
       -> unit
    val setVexpand :
      'a class_t
       -> bool
       -> unit
    val setVexpandSet :
      'a class_t
       -> bool
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val setVisual :
      'a class_t
       -> 'b Gdk.VisualClass.t
       -> unit
    val shapeCombineRegion :
      'a class_t
       -> Cairo.RegionRecord.t option
       -> unit
    val show : 'a class_t -> unit
    val showAll : 'a class_t -> unit
    val showNow : 'a class_t -> unit
    val sizeAllocate :
      'a class_t
       -> Cairo.RectangleIntRecord.t
       -> unit
    val styleGetProperty :
      'a class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val thawChildNotify : 'a class_t -> unit
    val translateCoordinates :
      'a class_t
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val triggerTooltipQuery : 'a class_t -> unit
    val unmap : 'a class_t -> unit
    val unparent : 'a class_t -> unit
    val unrealize : 'a class_t -> unit
    val unsetStateFlags :
      'a class_t
       -> stateflags_t
       -> unit
    val accelClosuresChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val buttonPressEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class_t Signal.signal
    val buttonReleaseEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class_t Signal.signal
    val canActivateAccelSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val childNotifySig : (base GObject.ParamSpecClass.t -> unit) -> 'a class_t Signal.signal
    val compositedChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val configureEventSig : (Gdk.EventConfigureRecord.t -> bool) -> 'a class_t Signal.signal
    val damageEventSig : (Gdk.EventExposeRecord.t -> bool) -> 'a class_t Signal.signal
    val deleteEventSig : (base Gdk.Event.t -> bool) -> 'a class_t Signal.signal
    val destroySig : (unit -> unit) -> 'a class_t Signal.signal
    val destroyEventSig : (base Gdk.Event.t -> bool) -> 'a class_t Signal.signal
    val directionChangedSig : (textdirection_t -> unit) -> 'a class_t Signal.signal
    val dragBeginSig : (base Gdk.DragContextClass.t -> unit) -> 'a class_t Signal.signal
    val dragDataDeleteSig : (base Gdk.DragContextClass.t -> unit) -> 'a class_t Signal.signal
    val dragDataGetSig :
      (base Gdk.DragContextClass.t
        -> selectiondatarecord_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val dragDataReceivedSig :
      (base Gdk.DragContextClass.t
        -> LargeInt.int
        -> LargeInt.int
        -> selectiondatarecord_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val dragDropSig :
      (base Gdk.DragContextClass.t
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val dragEndSig : (base Gdk.DragContextClass.t -> unit) -> 'a class_t Signal.signal
    val dragFailedSig :
      (base Gdk.DragContextClass.t
        -> dragresult_t
        -> bool)
       -> 'a class_t Signal.signal
    val dragLeaveSig :
      (base Gdk.DragContextClass.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val dragMotionSig :
      (base Gdk.DragContextClass.t
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val drawSig : (Cairo.ContextRecord.t -> bool) -> 'a class_t Signal.signal
    val enterNotifyEventSig : (Gdk.EventCrossingRecord.t -> bool) -> 'a class_t Signal.signal
    val eventSig : (base Gdk.Event.t -> bool) -> 'a class_t Signal.signal
    val eventAfterSig : (base Gdk.Event.t -> unit) -> 'a class_t Signal.signal
    val focusSig : (directiontype_t -> bool) -> 'a class_t Signal.signal
    val focusInEventSig : (Gdk.EventFocusRecord.t -> bool) -> 'a class_t Signal.signal
    val focusOutEventSig : (Gdk.EventFocusRecord.t -> bool) -> 'a class_t Signal.signal
    val grabBrokenEventSig : (Gdk.EventGrabBrokenRecord.t -> bool) -> 'a class_t Signal.signal
    val grabFocusSig : (unit -> unit) -> 'a class_t Signal.signal
    val grabNotifySig : (bool -> unit) -> 'a class_t Signal.signal
    val hideSig : (unit -> unit) -> 'a class_t Signal.signal
    val hierarchyChangedSig : (base class_t option -> unit) -> 'a class_t Signal.signal
    val keyPressEventSig : (Gdk.EventKeyRecord.t -> bool) -> 'a class_t Signal.signal
    val keyReleaseEventSig : (Gdk.EventKeyRecord.t -> bool) -> 'a class_t Signal.signal
    val keynavFailedSig : (directiontype_t -> bool) -> 'a class_t Signal.signal
    val leaveNotifyEventSig : (Gdk.EventCrossingRecord.t -> bool) -> 'a class_t Signal.signal
    val mapSig : (unit -> unit) -> 'a class_t Signal.signal
    val mapEventSig : (Gdk.EventAnyRecord.t -> bool) -> 'a class_t Signal.signal
    val mnemonicActivateSig : (bool -> bool) -> 'a class_t Signal.signal
    val motionNotifyEventSig : (Gdk.EventMotionRecord.t -> bool) -> 'a class_t Signal.signal
    val moveFocusSig : (directiontype_t -> unit) -> 'a class_t Signal.signal
    val parentSetSig : (base class_t option -> unit) -> 'a class_t Signal.signal
    val popupMenuSig : (unit -> bool) -> 'a class_t Signal.signal
    val propertyNotifyEventSig : (Gdk.EventPropertyRecord.t -> bool) -> 'a class_t Signal.signal
    val proximityInEventSig : (Gdk.EventProximityRecord.t -> bool) -> 'a class_t Signal.signal
    val proximityOutEventSig : (Gdk.EventProximityRecord.t -> bool) -> 'a class_t Signal.signal
    val queryTooltipSig :
      (LargeInt.int
        -> LargeInt.int
        -> bool
        -> base tooltipclass_t
        -> bool)
       -> 'a class_t Signal.signal
    val realizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val screenChangedSig : (base Gdk.ScreenClass.t option -> unit) -> 'a class_t Signal.signal
    val scrollEventSig : (Gdk.EventScrollRecord.t -> bool) -> 'a class_t Signal.signal
    val selectionClearEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class_t Signal.signal
    val selectionGetSig :
      (selectiondatarecord_t
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val selectionNotifyEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class_t Signal.signal
    val selectionReceivedSig :
      (selectiondatarecord_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val selectionRequestEventSig : (Gdk.EventSelectionRecord.t -> bool) -> 'a class_t Signal.signal
    val showSig : (unit -> unit) -> 'a class_t Signal.signal
    val showHelpSig : (widgethelptype_t -> bool) -> 'a class_t Signal.signal
    val sizeAllocateSig : (Cairo.RectangleIntRecord.t -> unit) -> 'a class_t Signal.signal
    val stateChangedSig : (statetype_t -> unit) -> 'a class_t Signal.signal
    val stateFlagsChangedSig : (stateflags_t -> unit) -> 'a class_t Signal.signal
    val styleSetSig : (base styleclass_t option -> unit) -> 'a class_t Signal.signal
    val styleUpdatedSig : (unit -> unit) -> 'a class_t Signal.signal
    val unmapSig : (unit -> unit) -> 'a class_t Signal.signal
    val unmapEventSig : (Gdk.EventAnyRecord.t -> bool) -> 'a class_t Signal.signal
    val unrealizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val visibilityNotifyEventSig : (Gdk.EventVisibilityRecord.t -> bool) -> 'a class_t Signal.signal
    val windowStateEventSig : (Gdk.EventWindowStateRecord.t -> bool) -> 'a class_t Signal.signal
    val appPaintableProp : ('a class_t, bool, bool) Property.readwrite
    val canDefaultProp : ('a class_t, bool, bool) Property.readwrite
    val canFocusProp : ('a class_t, bool, bool) Property.readwrite
    val compositeChildProp : ('a class_t, bool) Property.readonly
    val doubleBufferedProp : ('a class_t, bool, bool) Property.readwrite
    val eventsProp : ('a class_t, Gdk.EventMask.t, Gdk.EventMask.t) Property.readwrite
    val expandProp : ('a class_t, bool, bool) Property.readwrite
    val halignProp : ('a class_t, align_t, align_t) Property.readwrite
    val hasDefaultProp : ('a class_t, bool, bool) Property.readwrite
    val hasFocusProp : ('a class_t, bool, bool) Property.readwrite
    val hasTooltipProp : ('a class_t, bool, bool) Property.readwrite
    val heightRequestProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val hexpandProp : ('a class_t, bool, bool) Property.readwrite
    val hexpandSetProp : ('a class_t, bool, bool) Property.readwrite
    val isFocusProp : ('a class_t, bool, bool) Property.readwrite
    val marginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val marginBottomProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val marginLeftProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val marginRightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val marginTopProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val noShowAllProp : ('a class_t, bool, bool) Property.readwrite
    val parentProp : ('a class_t, base containerclass_t option, 'b containerclass_t option) Property.readwrite
    val receivesDefaultProp : ('a class_t, bool, bool) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val styleProp : ('a class_t, base styleclass_t option, 'b styleclass_t option) Property.readwrite
    val tooltipMarkupProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipTextProp : ('a class_t, string option, string option) Property.readwrite
    val valignProp : ('a class_t, align_t, align_t) Property.readwrite
    val vexpandProp : ('a class_t, bool, bool) Property.readwrite
    val vexpandSetProp : ('a class_t, bool, bool) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val widthRequestProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val windowProp : ('a class_t, base Gdk.WindowClass.t option) Property.readonly
  end
