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
    type axis_flags_t
    type 'a device_manager_class
    type 'a display_class
    type input_mode_t
    type input_source_t
    type 'a seat_class
    type 'a device_tool_class
    type device_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val grabInfoLibgtkOnly : 'a display_class * 'b class -> (base window_class * bool) option
    val getAssociatedDevice : 'a class -> base class option
    val getAxes : 'a class -> axis_flags_t
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
    val getLastEventWindow : 'a class -> base window_class option
    val getMode : 'a class -> input_mode_t
    val getNAxes : 'a class -> LargeInt.int
    val getNKeys : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getPosition :
      'a class
       -> base screen_class
           * LargeInt.int
           * LargeInt.int
    val getPositionDouble :
      'a class
       -> base screen_class
           * real
           * real
    val getProductId : 'a class -> string option
    val getSeat : 'a class -> base seat_class
    val getSource : 'a class -> input_source_t
    val getVendorId : 'a class -> string option
    val getWindowAtPosition :
      'a class
       -> base window_class option
           * LargeInt.int
           * LargeInt.int
    val getWindowAtPositionDouble :
      'a class
       -> base window_class option
           * real
           * real
    val grab :
      'a class
       -> 'b window_class
           * grab_ownership_t
           * bool
           * event_mask_t
           * 'c cursor_class option
           * LargeInt.int
       -> grab_status_t
    val setAxisUse :
      'a class
       -> LargeInt.int * axis_use_t
       -> unit
    val setKey :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * modifier_type_t
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
           * LargeInt.int
           * LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val toolChangedSig : (base device_tool_class -> unit) -> 'a class Signal.t
    val associatedDeviceProp : {get : 'a class -> base class option}
    val axesProp : {get : 'a class -> axis_flags_t}
    val deviceManagerProp :
      {
        get : 'a class -> base device_manager_class option,
        new : 'b device_manager_class option -> 'a class Property.t
      }
    val displayProp :
      {
        get : 'a class -> base display_class option,
        new : 'b display_class option -> 'a class Property.t
      }
    val hasCursorProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val inputModeProp :
      {
        get : 'a class -> input_mode_t,
        set :
          input_mode_t
           -> 'a class
           -> unit,
        new : input_mode_t -> 'a class Property.t
      }
    val inputSourceProp :
      {
        get : 'a class -> input_source_t,
        new : input_source_t -> 'a class Property.t
      }
    val nAxesProp : {get : 'a class -> LargeInt.int}
    val nameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val numTouchesProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val productIdProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val seatProp :
      {
        get : 'a class -> base seat_class option,
        set :
          'b seat_class option
           -> 'a class
           -> unit,
        new : 'b seat_class option -> 'a class Property.t
      }
    val toolProp : {get : 'a class -> base device_tool_class option}
    val typeProp :
      {
        get : 'a class -> device_type_t,
        new : device_type_t -> 'a class Property.t
      }
    val vendorIdProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
