signature GDK_DEVICE =
  sig
    type 'a class
    type grab_status_t
    type 'a cursor_class
    type event_mask_t
    type grab_ownership_t
    type 'a window_class
    type axis_use_t
    type modifier_type_t
    type 'a screen_class
    type 'a device_manager_class
    type 'a display_class
    type input_mode_t
    type input_source_t
    type device_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val grabInfoLibgtkOnly :
      'a display_class
       -> 'b class
       -> (base window_class * bool) option
    val getAssociatedDevice : 'a class -> base class
    val getAxisUse :
      'a class
       -> LargeInt.int
       -> axis_use_t
    val getDeviceType : 'a class -> device_type_t
    val getDisplay : 'a class -> base display_class
    val getHasCursor : 'a class -> bool
    val getKey :
      'a class
       -> LargeInt.int
       -> (LargeInt.int * modifier_type_t) option
    val getMode : 'a class -> input_mode_t
    val getNAxes : 'a class -> LargeInt.int
    val getNKeys : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getPosition :
      'a class
       -> base screen_class
           * LargeInt.int
           * LargeInt.int
    val getSource : 'a class -> input_source_t
    val getWindowAtPosition :
      'a class
       -> base window_class
           * LargeInt.int
           * LargeInt.int
    val grab :
      'a class
       -> 'b window_class
       -> grab_ownership_t
       -> bool
       -> event_mask_t
       -> 'c cursor_class option
       -> LargeInt.int
       -> grab_status_t
    val setAxisUse :
      'a class
       -> LargeInt.int
       -> axis_use_t
       -> unit
    val setKey :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> modifier_type_t
       -> unit
    val setMode :
      'a class
       -> input_mode_t
       -> bool
    val ungrab :
      'a class
       -> LargeInt.int
       -> unit
    val warp :
      'a class
       -> 'b screen_class
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.signal
    val associatedDeviceProp : ('a class, base class option) Property.readonly
    val deviceManagerProp : ('a class, base device_manager_class option, 'b device_manager_class option) Property.readwrite
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
    val hasCursorProp : ('a class, bool, bool) Property.readwrite
    val inputModeProp : ('a class, input_mode_t, input_mode_t) Property.readwrite
    val inputSourceProp : ('a class, input_source_t, input_source_t) Property.readwrite
    val nAxesProp : ('a class, LargeInt.int) Property.readonly
    val nameProp : ('a class, string option, string option) Property.readwrite
    val typeProp : ('a class, device_type_t, device_type_t) Property.readwrite
  end
