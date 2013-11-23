signature GDK_DISPLAY =
  sig
    type 'a class_t
    type atomrecord_t
    type 'a event_t
    type 'a screenclass_t
    type 'a devicemanagerclass_t
    type 'a windowclass_t
    type 'a applaunchcontextclass_t
    type 'a deviceclass_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val open' : string -> base class_t
    val openDefaultLibgtkOnly : unit -> base class_t
    val beep : 'a class_t -> unit
    val close : 'a class_t -> unit
    val deviceIsGrabbed :
      'a class_t
       -> 'b deviceclass_t
       -> bool
    val flush : 'a class_t -> unit
    val getAppLaunchContext : 'a class_t -> base applaunchcontextclass_t
    val getDefaultCursorSize : 'a class_t -> LargeInt.int
    val getDefaultGroup : 'a class_t -> base windowclass_t
    val getDefaultScreen : 'a class_t -> base screenclass_t
    val getDeviceManager : 'a class_t -> base devicemanagerclass_t
    val getEvent : 'a class_t -> base event_t
    val getMaximalCursorSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getNScreens : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getScreen :
      'a class_t
       -> LargeInt.int
       -> base screenclass_t
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val notifyStartupComplete :
      'a class_t
       -> string
       -> unit
    val peekEvent : 'a class_t -> base event_t
    val putEvent :
      'a class_t
       -> 'b event_t
       -> unit
    val requestSelectionNotification :
      'a class_t
       -> atomrecord_t
       -> bool
    val setDoubleClickDistance :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDoubleClickTime :
      'a class_t
       -> LargeInt.int
       -> unit
    val supportsClipboardPersistence : 'a class_t -> bool
    val supportsComposite : 'a class_t -> bool
    val supportsCursorAlpha : 'a class_t -> bool
    val supportsCursorColor : 'a class_t -> bool
    val supportsInputShapes : 'a class_t -> bool
    val supportsSelectionNotification : 'a class_t -> bool
    val supportsShapes : 'a class_t -> bool
    val sync : 'a class_t -> unit
    val closedSig : (bool -> unit) -> 'a class_t Signal.signal
    val openedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
