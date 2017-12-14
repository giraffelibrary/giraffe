signature GDK_DISPLAY =
  sig
    type 'a class
    type 'a device_class
    type 'a app_launch_context_class
    type 'a device_manager_class
    type modifier_type_t
    type 'a event_union
    type atom_t
    type 'a window_class
    type 'a screen_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val open' : string -> base class
    val openDefaultLibgtkOnly : unit -> base class
    val beep : 'a class -> unit
    val close : 'a class -> unit
    val deviceIsGrabbed :
      'a class
       -> 'b device_class
       -> bool
    val flush : 'a class -> unit
    val getAppLaunchContext : 'a class -> base app_launch_context_class
    val getDefaultCursorSize : 'a class -> LargeInt.int
    val getDefaultGroup : 'a class -> base window_class
    val getDefaultScreen : 'a class -> base screen_class
    val getDeviceManager : 'a class -> base device_manager_class
    val getEvent : 'a class -> base event_union
    val getMaximalCursorSize : 'a class -> LargeInt.int * LargeInt.int
    val getNScreens : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getPointer :
      'a class
       -> base screen_class
           * LargeInt.int
           * LargeInt.int
           * modifier_type_t
    val getScreen :
      'a class
       -> LargeInt.int
       -> base screen_class
    val getWindowAtPointer :
      'a class
       -> base window_class
           * LargeInt.int
           * LargeInt.int
    val hasPending : 'a class -> bool
    val isClosed : 'a class -> bool
    val keyboardUngrab :
      'a class
       -> LargeInt.int
       -> unit
    val notifyStartupComplete :
      'a class
       -> string
       -> unit
    val peekEvent : 'a class -> base event_union
    val pointerIsGrabbed : 'a class -> bool
    val pointerUngrab :
      'a class
       -> LargeInt.int
       -> unit
    val putEvent :
      'a class
       -> 'b event_union
       -> unit
    val requestSelectionNotification :
      'a class
       -> atom_t
       -> bool
    val setDoubleClickDistance :
      'a class
       -> LargeInt.int
       -> unit
    val setDoubleClickTime :
      'a class
       -> LargeInt.int
       -> unit
    val storeClipboard :
      'a class
       -> 'b window_class
           * LargeInt.int
           * atom_t vector
       -> unit
    val supportsClipboardPersistence : 'a class -> bool
    val supportsComposite : 'a class -> bool
    val supportsCursorAlpha : 'a class -> bool
    val supportsCursorColor : 'a class -> bool
    val supportsInputShapes : 'a class -> bool
    val supportsSelectionNotification : 'a class -> bool
    val supportsShapes : 'a class -> bool
    val sync : 'a class -> unit
    val warpPointer :
      'a class
       -> 'b screen_class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val closedSig : (bool -> unit) -> 'a class Signal.t
    val openedSig : (unit -> unit) -> 'a class Signal.t
  end
