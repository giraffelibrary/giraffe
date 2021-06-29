signature GTK_WIDGET =
  sig
    type 'a class
    type 'a buildable_class
    type accel_flags_t
    type orientation_t
    type dest_defaults_t
    type target_entry_record_c_array_n_t
    type target_list_t
    type 'a clipboard_class
    type widget_path_t
    type size_request_mode_t
    type 'a settings_class
    type 'a style_context_class
    type 'a rc_style_class
    type 'a accel_group_class
    type 'a window_class
    type requisition_t
    type text_direction_t
    type drag_result_t
    type direction_type_t
    type 'a tooltip_class
    type selection_data_t
    type widget_help_type_t
    type allocation_t
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
           * 'b accel_group_class
           * LargeInt.int
           * Gdk.ModifierType.t
           * accel_flags_t
       -> unit
    val addDeviceEvents :
      'a class
       -> 'b Gdk.DeviceClass.class * Gdk.EventMask.t
       -> unit
    val addEvents :
      'a class
       -> Gdk.EventMask.t
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
       -> string option
       -> base Pango.LayoutClass.class
    val destroy : 'a class -> unit
    val deviceIsShadowed :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> bool
    val dragBegin :
      'a class
       -> target_list_t
           * Gdk.DragAction.t
           * LargeInt.int
           * 'b Gdk.Event.union option
       -> base Gdk.DragContextClass.class
    val dragBeginWithCoordinates :
      'a class
       -> target_list_t
           * Gdk.DragAction.t
           * LargeInt.int
           * 'b Gdk.Event.union option
           * LargeInt.int
           * LargeInt.int
       -> base Gdk.DragContextClass.class
    val dragCheckThreshold :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> bool
    val dragDestAddImageTargets : 'a class -> unit
    val dragDestAddTextTargets : 'a class -> unit
    val dragDestAddUriTargets : 'a class -> unit
    val dragDestFindTarget :
      'a class
       -> 'b Gdk.DragContextClass.class * target_list_t option
       -> Gdk.AtomRecord.t
    val dragDestGetTargetList : 'a class -> target_list_t option
    val dragDestGetTrackMotion : 'a class -> bool
    val dragDestSet :
      'a class
       -> dest_defaults_t
           * target_entry_record_c_array_n_t
           * Gdk.DragAction.t
       -> unit
    val dragDestSetProxy :
      'a class
       -> 'b Gdk.WindowClass.class
           * Gdk.DragProtocol.t
           * bool
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
           * Gdk.AtomRecord.t
           * LargeInt.int
       -> unit
    val dragHighlight : 'a class -> unit
    val dragSourceAddImageTargets : 'a class -> unit
    val dragSourceAddTextTargets : 'a class -> unit
    val dragSourceAddUriTargets : 'a class -> unit
    val dragSourceGetTargetList : 'a class -> target_list_t option
    val dragSourceSet :
      'a class
       -> Gdk.ModifierType.t
           * target_entry_record_c_array_n_t
           * Gdk.DragAction.t
       -> unit
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
    val getActionGroup :
      'a class
       -> string
       -> base Gio.ActionGroupClass.class option
    val getAllocatedBaseline : 'a class -> LargeInt.int
    val getAllocatedHeight : 'a class -> LargeInt.int
    val getAllocatedSize : 'a class -> allocation_t * LargeInt.int
    val getAllocatedWidth : 'a class -> LargeInt.int
    val getAllocation : 'a class -> allocation_t
    val getAncestor :
      'a class
       -> GObject.Type.t
       -> base class option
    val getAppPaintable : 'a class -> bool
    val getCanDefault : 'a class -> bool
    val getCanFocus : 'a class -> bool
    val getChildRequisition : 'a class -> requisition_t
    val getChildVisible : 'a class -> bool
    val getClip : 'a class -> allocation_t
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
    val getEvents : 'a class -> Gdk.EventMask.t
    val getFocusOnClick : 'a class -> bool
    val getFontMap : 'a class -> base Pango.FontMapClass.class option
    val getFontOptions : 'a class -> Cairo.FontOptionsRecord.t option
    val getFrameClock : 'a class -> base Gdk.FrameClockClass.class option
    val getHalign : 'a class -> align_t
    val getHasTooltip : 'a class -> bool
    val getHasWindow : 'a class -> bool
    val getHexpand : 'a class -> bool
    val getHexpandSet : 'a class -> bool
    val getMapped : 'a class -> bool
    val getMarginBottom : 'a class -> LargeInt.int
    val getMarginEnd : 'a class -> LargeInt.int
    val getMarginLeft : 'a class -> LargeInt.int
    val getMarginRight : 'a class -> LargeInt.int
    val getMarginStart : 'a class -> LargeInt.int
    val getMarginTop : 'a class -> LargeInt.int
    val getModifierMask :
      'a class
       -> Gdk.ModifierIntent.t
       -> Gdk.ModifierType.t
    val getModifierStyle : 'a class -> base rc_style_class
    val getName : 'a class -> string
    val getNoShowAll : 'a class -> bool
    val getOpacity : 'a class -> real
    val getPangoContext : 'a class -> base Pango.ContextClass.class
    val getParent : 'a class -> base class option
    val getParentWindow : 'a class -> base Gdk.WindowClass.class option
    val getPath : 'a class -> widget_path_t
    val getPointer : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeight : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeightAndBaselineForWidth :
      'a class
       -> LargeInt.int
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
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
    val getRequisition : 'a class -> requisition_t
    val getRootWindow : 'a class -> base Gdk.WindowClass.class
    val getScaleFactor : 'a class -> LargeInt.int
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSensitive : 'a class -> bool
    val getSettings : 'a class -> base settings_class
    val getSizeRequest : 'a class -> LargeInt.int * LargeInt.int
    val getState : 'a class -> state_type_t
    val getStateFlags : 'a class -> state_flags_t
    val getStyle : 'a class -> base style_class
    val getStyleContext : 'a class -> base style_context_class
    val getSupportMultidevice : 'a class -> bool
    val getTemplateChild :
      'a class
       -> GObject.Type.t * string
       -> base GObject.ObjectClass.class
    val getTooltipMarkup : 'a class -> string option
    val getTooltipText : 'a class -> string option
    val getTooltipWindow : 'a class -> base window_class
    val getToplevel : 'a class -> base class
    val getValign : 'a class -> align_t
    val getValignWithBaseline : 'a class -> align_t
    val getVexpand : 'a class -> bool
    val getVexpandSet : 'a class -> bool
    val getVisible : 'a class -> bool
    val getVisual : 'a class -> base Gdk.VisualClass.class
    val getWindow : 'a class -> base Gdk.WindowClass.class option
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
    val initTemplate : 'a class -> unit
    val inputShapeCombineRegion :
      'a class
       -> Cairo.RegionRecord.t option
       -> unit
    val insertActionGroup :
      'a class
       -> string * 'b Gio.ActionGroupClass.class option
       -> unit
    val intersect :
      'a class
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t option
    val isAncestor :
      'a class
       -> 'b class
       -> bool
    val isComposited : 'a class -> bool
    val isDrawable : 'a class -> bool
    val isFocus : 'a class -> bool
    val isSensitive : 'a class -> bool
    val isToplevel : 'a class -> bool
    val isVisible : 'a class -> bool
    val keynavFailed :
      'a class
       -> direction_type_t
       -> bool
    val listActionPrefixes : 'a class -> Utf8CPtrArray.t
    val map : 'a class -> unit
    val mnemonicActivate :
      'a class
       -> bool
       -> bool
    val modifyBase :
      'a class
       -> state_type_t * Gdk.ColorRecord.t option
       -> unit
    val modifyBg :
      'a class
       -> state_type_t * Gdk.ColorRecord.t option
       -> unit
    val modifyCursor :
      'a class
       -> Gdk.ColorRecord.t option * Gdk.ColorRecord.t option
       -> unit
    val modifyFg :
      'a class
       -> state_type_t * Gdk.ColorRecord.t option
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
       -> state_type_t * Gdk.ColorRecord.t option
       -> unit
    val overrideBackgroundColor :
      'a class
       -> state_flags_t * Gdk.RgbaRecord.t option
       -> unit
    val overrideColor :
      'a class
       -> state_flags_t * Gdk.RgbaRecord.t option
       -> unit
    val overrideCursor :
      'a class
       -> Gdk.RgbaRecord.t option * Gdk.RgbaRecord.t option
       -> unit
    val overrideFont :
      'a class
       -> Pango.FontDescriptionRecord.t option
       -> unit
    val overrideSymbolicColor :
      'a class
       -> string * Gdk.RgbaRecord.t option
       -> unit
    val path :
      'a class
       -> LargeInt.int
           * string
           * string
    val queueAllocate : 'a class -> unit
    val queueComputeExpand : 'a class -> unit
    val queueDraw : 'a class -> unit
    val queueDrawArea :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
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
    val registerWindow :
      'a class
       -> 'b Gdk.WindowClass.class
       -> unit
    val removeAccelerator :
      'a class
       -> 'b accel_group_class
           * LargeInt.int
           * Gdk.ModifierType.t
       -> bool
    val removeMnemonicLabel :
      'a class
       -> 'b class
       -> unit
    val removeTickCallback :
      'a class
       -> LargeInt.int
       -> unit
    val renderIcon :
      'a class
       -> string
           * LargeInt.int
           * string option
       -> base GdkPixbuf.PixbufClass.class option
    val renderIconPixbuf :
      'a class
       -> string * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class option
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
       -> string option * 'b accel_group_class option
       -> unit
    val setAllocation :
      'a class
       -> allocation_t
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
    val setClip :
      'a class
       -> allocation_t
       -> unit
    val setCompositeName :
      'a class
       -> string
       -> unit
    val setDeviceEnabled :
      'a class
       -> 'b Gdk.DeviceClass.class * bool
       -> unit
    val setDeviceEvents :
      'a class
       -> 'b Gdk.DeviceClass.class * Gdk.EventMask.t
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
       -> Gdk.EventMask.t
       -> unit
    val setFocusOnClick :
      'a class
       -> bool
       -> unit
    val setFontMap :
      'a class
       -> 'b Pango.FontMapClass.class option
       -> unit
    val setFontOptions :
      'a class
       -> Cairo.FontOptionsRecord.t option
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
    val setMarginEnd :
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
    val setMarginStart :
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
    val setOpacity :
      'a class
       -> real
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
       -> LargeInt.int * LargeInt.int
       -> unit
    val setState :
      'a class
       -> state_type_t
       -> unit
    val setStateFlags :
      'a class
       -> state_flags_t * bool
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
       -> string option
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
       -> 'b Gdk.VisualClass.class option
       -> unit
    val setWindow :
      'a class
       -> 'b Gdk.WindowClass.class
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
       -> allocation_t
       -> unit
    val sizeAllocateWithBaseline :
      'a class
       -> allocation_t * LargeInt.int
       -> unit
    val sizeRequest : 'a class -> requisition_t
    val styleAttach : 'a class -> unit
    val styleGetProperty :
      'a class
       -> string * GObject.ValueRecord.t
       -> unit
    val thawChildNotify : 'a class -> unit
    val translateCoordinates :
      'a class
       -> 'b class
           * LargeInt.int
           * LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val triggerTooltipQuery : 'a class -> unit
    val unmap : 'a class -> unit
    val unparent : 'a class -> unit
    val unrealize : 'a class -> unit
    val unregisterWindow :
      'a class
       -> 'b Gdk.WindowClass.class
       -> unit
    val unsetStateFlags :
      'a class
       -> state_flags_t
       -> unit
    val accelClosuresChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val buttonPressEventSig : ('a class, Gdk.EventButtonRecord.t, Gdk.EventButtonRecord.t, bool, bool) Signal.t
    val buttonReleaseEventSig : ('a class, Gdk.EventButtonRecord.t, Gdk.EventButtonRecord.t, bool, bool) Signal.t
    val canActivateAccelSig : ('a class, LargeInt.int, LargeInt.int, bool, bool) Signal.t
    val childNotifySig : ('a class, 'b GObject.ParamSpecClass.class, base GObject.ParamSpecClass.class, unit, unit) Signal.t
    val compositedChangedSig : ('a class, unit, unit, unit, unit) Signal.t
    val configureEventSig : ('a class, Gdk.EventConfigureRecord.t, Gdk.EventConfigureRecord.t, bool, bool) Signal.t
    val damageEventSig : ('a class, Gdk.EventExposeRecord.t, Gdk.EventExposeRecord.t, bool, bool) Signal.t
    val deleteEventSig : ('a class, 'b Gdk.Event.union, base Gdk.Event.union, bool, bool) Signal.t
    val destroySig : ('a class, unit, unit, unit, unit) Signal.t
    val destroyEventSig : ('a class, 'b Gdk.Event.union, base Gdk.Event.union, bool, bool) Signal.t
    val directionChangedSig : ('a class, text_direction_t, text_direction_t, unit, unit) Signal.t
    val dragBeginSig : ('a class, 'b Gdk.DragContextClass.class, base Gdk.DragContextClass.class, unit, unit) Signal.t
    val dragDataDeleteSig : ('a class, 'b Gdk.DragContextClass.class, base Gdk.DragContextClass.class, unit, unit) Signal.t
    val dragDataGetSig :
      (
        'a class,
        'b Gdk.DragContextClass.class
         * selection_data_t
         * LargeInt.int
         * LargeInt.int,
        base Gdk.DragContextClass.class
         * selection_data_t
         * LargeInt.int
         * LargeInt.int,
        unit,
        unit
      ) Signal.t
    val dragDataReceivedSig :
      (
        'a class,
        'b Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * selection_data_t
         * LargeInt.int
         * LargeInt.int,
        base Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * selection_data_t
         * LargeInt.int
         * LargeInt.int,
        unit,
        unit
      ) Signal.t
    val dragDropSig :
      (
        'a class,
        'b Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * LargeInt.int,
        base Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * LargeInt.int,
        bool,
        bool
      ) Signal.t
    val dragEndSig : ('a class, 'b Gdk.DragContextClass.class, base Gdk.DragContextClass.class, unit, unit) Signal.t
    val dragFailedSig : ('a class, 'b Gdk.DragContextClass.class * drag_result_t, base Gdk.DragContextClass.class * drag_result_t, bool, bool) Signal.t
    val dragLeaveSig : ('a class, 'b Gdk.DragContextClass.class * LargeInt.int, base Gdk.DragContextClass.class * LargeInt.int, unit, unit) Signal.t
    val dragMotionSig :
      (
        'a class,
        'b Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * LargeInt.int,
        base Gdk.DragContextClass.class
         * LargeInt.int
         * LargeInt.int
         * LargeInt.int,
        bool,
        bool
      ) Signal.t
    val drawSig : ('a class, Cairo.ContextRecord.t, Cairo.ContextRecord.t, bool, bool) Signal.t
    val enterNotifyEventSig : ('a class, Gdk.EventCrossingRecord.t, Gdk.EventCrossingRecord.t, bool, bool) Signal.t
    val eventSig : ('a class, 'b Gdk.Event.union, base Gdk.Event.union, bool, bool) Signal.t
    val eventAfterSig : ('a class, 'b Gdk.Event.union, base Gdk.Event.union, unit, unit) Signal.t
    val focusSig : ('a class, direction_type_t, direction_type_t, bool, bool) Signal.t
    val focusInEventSig : ('a class, Gdk.EventFocusRecord.t, Gdk.EventFocusRecord.t, bool, bool) Signal.t
    val focusOutEventSig : ('a class, Gdk.EventFocusRecord.t, Gdk.EventFocusRecord.t, bool, bool) Signal.t
    val grabBrokenEventSig : ('a class, Gdk.EventGrabBrokenRecord.t, Gdk.EventGrabBrokenRecord.t, bool, bool) Signal.t
    val grabFocusSig : ('a class, unit, unit, unit, unit) Signal.t
    val grabNotifySig : ('a class, bool, bool, unit, unit) Signal.t
    val hideSig : ('a class, unit, unit, unit, unit) Signal.t
    val hierarchyChangedSig : ('a class, 'b class option, base class option, unit, unit) Signal.t
    val keyPressEventSig : ('a class, Gdk.EventKeyRecord.t, Gdk.EventKeyRecord.t, bool, bool) Signal.t
    val keyReleaseEventSig : ('a class, Gdk.EventKeyRecord.t, Gdk.EventKeyRecord.t, bool, bool) Signal.t
    val keynavFailedSig : ('a class, direction_type_t, direction_type_t, bool, bool) Signal.t
    val leaveNotifyEventSig : ('a class, Gdk.EventCrossingRecord.t, Gdk.EventCrossingRecord.t, bool, bool) Signal.t
    val mapSig : ('a class, unit, unit, unit, unit) Signal.t
    val mapEventSig : ('a class, Gdk.EventAnyRecord.t, Gdk.EventAnyRecord.t, bool, bool) Signal.t
    val mnemonicActivateSig : ('a class, bool, bool, bool, bool) Signal.t
    val motionNotifyEventSig : ('a class, Gdk.EventMotionRecord.t, Gdk.EventMotionRecord.t, bool, bool) Signal.t
    val moveFocusSig : ('a class, direction_type_t, direction_type_t, unit, unit) Signal.t
    val parentSetSig : ('a class, 'b class option, base class option, unit, unit) Signal.t
    val popupMenuSig : ('a class, unit, unit, bool, bool) Signal.t
    val propertyNotifyEventSig : ('a class, Gdk.EventPropertyRecord.t, Gdk.EventPropertyRecord.t, bool, bool) Signal.t
    val proximityInEventSig : ('a class, Gdk.EventProximityRecord.t, Gdk.EventProximityRecord.t, bool, bool) Signal.t
    val proximityOutEventSig : ('a class, Gdk.EventProximityRecord.t, Gdk.EventProximityRecord.t, bool, bool) Signal.t
    val queryTooltipSig :
      (
        'a class,
        LargeInt.int
         * LargeInt.int
         * bool
         * 'b tooltip_class,
        LargeInt.int
         * LargeInt.int
         * bool
         * base tooltip_class,
        bool,
        bool
      ) Signal.t
    val realizeSig : ('a class, unit, unit, unit, unit) Signal.t
    val screenChangedSig : ('a class, 'b Gdk.ScreenClass.class option, base Gdk.ScreenClass.class option, unit, unit) Signal.t
    val scrollEventSig : ('a class, Gdk.EventScrollRecord.t, Gdk.EventScrollRecord.t, bool, bool) Signal.t
    val selectionClearEventSig : ('a class, Gdk.EventSelectionRecord.t, Gdk.EventSelectionRecord.t, bool, bool) Signal.t
    val selectionGetSig :
      (
        'a class,
        selection_data_t
         * LargeInt.int
         * LargeInt.int,
        selection_data_t
         * LargeInt.int
         * LargeInt.int,
        unit,
        unit
      ) Signal.t
    val selectionNotifyEventSig : ('a class, Gdk.EventSelectionRecord.t, Gdk.EventSelectionRecord.t, bool, bool) Signal.t
    val selectionReceivedSig : ('a class, selection_data_t * LargeInt.int, selection_data_t * LargeInt.int, unit, unit) Signal.t
    val selectionRequestEventSig : ('a class, Gdk.EventSelectionRecord.t, Gdk.EventSelectionRecord.t, bool, bool) Signal.t
    val showSig : ('a class, unit, unit, unit, unit) Signal.t
    val showHelpSig : ('a class, widget_help_type_t, widget_help_type_t, bool, bool) Signal.t
    val sizeAllocateSig : ('a class, allocation_t, allocation_t, unit, unit) Signal.t
    val stateChangedSig : ('a class, state_type_t, state_type_t, unit, unit) Signal.t
    val stateFlagsChangedSig : ('a class, state_flags_t, state_flags_t, unit, unit) Signal.t
    val styleSetSig : ('a class, 'b style_class option, base style_class option, unit, unit) Signal.t
    val styleUpdatedSig : ('a class, unit, unit, unit, unit) Signal.t
    val touchEventSig : ('a class, 'b Gdk.Event.union, base Gdk.Event.union, bool, bool) Signal.t
    val unmapSig : ('a class, unit, unit, unit, unit) Signal.t
    val unmapEventSig : ('a class, Gdk.EventAnyRecord.t, Gdk.EventAnyRecord.t, bool, bool) Signal.t
    val unrealizeSig : ('a class, unit, unit, unit, unit) Signal.t
    val visibilityNotifyEventSig : ('a class, Gdk.EventVisibilityRecord.t, Gdk.EventVisibilityRecord.t, bool, bool) Signal.t
    val windowStateEventSig : ('a class, Gdk.EventWindowStateRecord.t, Gdk.EventWindowStateRecord.t, bool, bool) Signal.t
    val appPaintableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val canDefaultProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val canFocusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val compositeChildProp : ('a class, unit -> bool, unit, unit) Property.t
    val doubleBufferedProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val eventsProp : ('a class, unit -> Gdk.EventMask.t, Gdk.EventMask.t -> unit, Gdk.EventMask.t -> unit) Property.t
    val expandProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val focusOnClickProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val halignProp : ('a class, unit -> align_t, align_t -> unit, align_t -> unit) Property.t
    val hasDefaultProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hasFocusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hasTooltipProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val heightRequestProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val hexpandProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hexpandSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val isFocusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val marginProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginBottomProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginEndProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginLeftProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginRightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginStartProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val marginTopProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val nameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val noShowAllProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val opacityProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val parentProp : ('a class, unit -> base container_class option, 'b container_class option -> unit, 'b container_class option -> unit) Property.t
    val receivesDefaultProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scaleFactorProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val sensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val styleProp : ('a class, unit -> base style_class option, 'b style_class option -> unit, 'b style_class option -> unit) Property.t
    val tooltipMarkupProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val valignProp : ('a class, unit -> align_t, align_t -> unit, align_t -> unit) Property.t
    val vexpandProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val vexpandSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val widthRequestProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val windowProp : ('a class, unit -> base Gdk.WindowClass.class option, unit, unit) Property.t
  end
