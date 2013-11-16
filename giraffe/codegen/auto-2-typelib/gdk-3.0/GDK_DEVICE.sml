signature GDK_DEVICE =
  sig
    type 'a class_t
    type devicetype_t
    type inputsource_t
    type inputmode_t
    type 'a displayclass_t
    type 'a devicemanagerclass_t
    type 'a screenclass_t
    type modifiertype_t
    type axisuse_t
    type 'a windowclass_t
    type grabownership_t
    type eventmask_t
    type 'a cursorclass_t
    type grabstatus_t
    val getType : unit -> GObject.Type.t
    val grabInfoLibgtkOnly :
      'a displayclass_t
       -> 'b class_t
       -> (base windowclass_t * bool) option
    val getAssociatedDevice : 'a class_t -> base class_t
    val getAxisUse :
      'a class_t
       -> LargeInt.int
       -> axisuse_t
    val getDeviceType : 'a class_t -> devicetype_t
    val getDisplay : 'a class_t -> base displayclass_t
    val getHasCursor : 'a class_t -> bool
    val getKey :
      'a class_t
       -> LargeInt.int
       -> (LargeInt.int * modifiertype_t) option
    val getMode : 'a class_t -> inputmode_t
    val getNAxes : 'a class_t -> LargeInt.int
    val getNKeys : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getPosition :
      'a class_t
       -> base screenclass_t
           * LargeInt.int
           * LargeInt.int
    val getSource : 'a class_t -> inputsource_t
    val getWindowAtPosition :
      'a class_t
       -> base windowclass_t
           * LargeInt.int
           * LargeInt.int
    val grab :
      'a class_t
       -> 'b windowclass_t
       -> grabownership_t
       -> bool
       -> eventmask_t
       -> 'c cursorclass_t option
       -> LargeInt.int
       -> grabstatus_t
    val setAxisUse :
      'a class_t
       -> LargeInt.int
       -> axisuse_t
       -> unit
    val setKey :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> modifiertype_t
       -> unit
    val setMode :
      'a class_t
       -> inputmode_t
       -> bool
    val ungrab :
      'a class_t
       -> LargeInt.int
       -> unit
    val warp :
      'a class_t
       -> 'b screenclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val associatedDeviceProp : ('a class_t, base class_t option) Property.readonly
    val deviceManagerProp : ('a class_t, base devicemanagerclass_t option, 'b devicemanagerclass_t option) Property.readwrite
    val displayProp : ('a class_t, base displayclass_t option, 'b displayclass_t option) Property.readwrite
    val hasCursorProp : ('a class_t, bool, bool) Property.readwrite
    val inputModeProp : ('a class_t, inputmode_t, inputmode_t) Property.readwrite
    val inputSourceProp : ('a class_t, inputsource_t, inputsource_t) Property.readwrite
    val nAxesProp : ('a class_t, LargeInt.int) Property.readonly
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val typeProp : ('a class_t, devicetype_t, devicetype_t) Property.readwrite
  end
