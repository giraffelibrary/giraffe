signature GDK_DEVICE =
  sig
    type 'a class_t
    type grab_status_t
    type 'a cursor_class_t
    type event_mask_t
    type grab_ownership_t
    type 'a window_class_t
    type axis_use_t
    type modifier_type_t
    type 'a screen_class_t
    type 'a device_manager_class_t
    type 'a display_class_t
    type input_mode_t
    type input_source_t
    type device_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val grabInfoLibgtkOnly :
      'a display_class_t
       -> 'b class_t
       -> (base window_class_t * bool) option
    val getAssociatedDevice : 'a class_t -> base class_t
    val getAxisUse :
      'a class_t
       -> LargeInt.int
       -> axis_use_t
    val getDeviceType : 'a class_t -> device_type_t
    val getDisplay : 'a class_t -> base display_class_t
    val getHasCursor : 'a class_t -> bool
    val getKey :
      'a class_t
       -> LargeInt.int
       -> (LargeInt.int * modifier_type_t) option
    val getMode : 'a class_t -> input_mode_t
    val getNAxes : 'a class_t -> LargeInt.int
    val getNKeys : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getPosition :
      'a class_t
       -> base screen_class_t
           * LargeInt.int
           * LargeInt.int
    val getSource : 'a class_t -> input_source_t
    val getWindowAtPosition :
      'a class_t
       -> base window_class_t
           * LargeInt.int
           * LargeInt.int
    val grab :
      'a class_t
       -> 'b window_class_t
       -> grab_ownership_t
       -> bool
       -> event_mask_t
       -> 'c cursor_class_t option
       -> LargeInt.int
       -> grab_status_t
    val setAxisUse :
      'a class_t
       -> LargeInt.int
       -> axis_use_t
       -> unit
    val setKey :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> modifier_type_t
       -> unit
    val setMode :
      'a class_t
       -> input_mode_t
       -> bool
    val ungrab :
      'a class_t
       -> LargeInt.int
       -> unit
    val warp :
      'a class_t
       -> 'b screen_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val associatedDeviceProp : ('a class_t, base class_t option) Property.readonly
    val deviceManagerProp : ('a class_t, base device_manager_class_t option, 'b device_manager_class_t option) Property.readwrite
    val displayProp : ('a class_t, base display_class_t option, 'b display_class_t option) Property.readwrite
    val hasCursorProp : ('a class_t, bool, bool) Property.readwrite
    val inputModeProp : ('a class_t, input_mode_t, input_mode_t) Property.readwrite
    val inputSourceProp : ('a class_t, input_source_t, input_source_t) Property.readwrite
    val nAxesProp : ('a class_t, LargeInt.int) Property.readonly
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val typeProp : ('a class_t, device_type_t, device_type_t) Property.readwrite
  end
